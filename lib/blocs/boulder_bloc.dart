import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/models/response.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/utils/boulder_list_query_params_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderBloc
    extends Bloc<BoulderEvent, Response<CollectionItems<Boulder>>> {
  BoulderBloc({
    required this.repository,
  }) : super(const Response()) {
    on<BoulderListViewRequested>(
      (event, emit) async {
        await _fetch(
          page: event.page,
          emit: emit,
          filterState: event.filterState,
          orderQueryParam: event.orderQueryParam,
          grades: event.grades,
          offlineFirst: event.offlineFirst,
        );
      },
    );

    on<BoulderMapViewRequested>(
      (event, emit) async {
        await _fetch(
          page: event.page,
          emit: emit,
          extraQueryParams: {
            'id[]': event.boulderIds,
          },
          filterState: event.filterState,
          orderQueryParam: event.orderQueryParam,
          grades: {},
          offlineFirst: event.offlineFirst,
        );
      },
    );
  }
  final BoulderRepository repository;

  Future<void> _fetch({
    required int page,
    required Emitter<Response<CollectionItems<Boulder>>> emit,
    required BoulderFilterState filterState,
    required OrderQueryParam orderQueryParam,
    required Set<Grade> grades,
    Map<String, List<String>>? extraQueryParams,
    bool offlineFirst = false,
  }) async {
    final queryParams = <String, List<String>>{
      'page': [
        page.toString(),
      ],
      ...await BoulderListQueryParamsBuilder.compute(
        filterState: filterState,
        orderQueryParam: orderQueryParam,
        grades: grades,
      ),
      ...extraQueryParams ?? {},
    };

    try {
      final data = await repository.findBy(
        queryParams: queryParams,
        offlineFirst: offlineFirst,
      );
      emit(
        Response(
          data: data,
        ),
      );
    } catch (error) {
      emit(
        Response(
          error: error,
        ),
      );
    }
  }
}

abstract class BoulderEvent {}

class BoulderListViewRequested extends BoulderEvent {
  BoulderListViewRequested({
    required this.page,
    required this.filterState,
    required this.orderQueryParam,
    required this.grades,
    this.offlineFirst = false,
  });
  final int page;
  final BoulderFilterState filterState;
  final OrderQueryParam orderQueryParam;
  final Set<Grade> grades;
  final bool offlineFirst;
}

class BoulderMapViewRequested extends BoulderEvent {
  BoulderMapViewRequested({
    required this.page,
    required this.boulderIds,
    required this.filterState,
    required this.orderQueryParam,
    this.offlineFirst = false,
  });
  final int page;
  final List<String> boulderIds;
  final BoulderFilterState filterState;
  final OrderQueryParam orderQueryParam;
  final bool offlineFirst;
}
