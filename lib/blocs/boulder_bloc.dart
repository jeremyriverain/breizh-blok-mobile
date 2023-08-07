import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/utils/boulder_list_query_params_builder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/response.dart';

class BoulderBloc
    extends Bloc<BoulderEvent, Response<CollectionItems<Boulder>>> {
  final BoulderRepository repository = BoulderRepository();

  BoulderBloc() : super(const Response()) {
    on<BoulderListViewRequested>(
      (event, emit) async {
        await _fetch(
          page: event.page,
          emit: emit,
          filterState: event.filterState,
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
        );
      },
    );
  }

  Future<void> _fetch({
    required int page,
    required Emitter<Response<CollectionItems<Boulder>>> emit,
    Map<String, List<String>>? extraQueryParams,
    required BoulderFilterState filterState,
  }) async {
    Map<String, List<String>> queryParams = {
      'page': [
        page.toString(),
      ],
      ...await BoulderListQueryParamsBuilder.compute(filterState),
      ...(extraQueryParams ?? {}),
    };

    try {
      final data = await repository.findBy(
        queryParams: queryParams,
      );
      emit(Response(
        data: data,
      ));
    } catch (error) {
      emit(Response(
        error: error,
      ));
    }
  }
}

abstract class BoulderEvent {}

class BoulderListViewRequested extends BoulderEvent {
  final int page;
  final BoulderFilterState filterState;

  BoulderListViewRequested({
    required this.page,
    required this.filterState,
  });
}

class BoulderMapViewRequested extends BoulderEvent {
  final int page;
  final List<String> boulderIds;
  final BoulderFilterState filterState;

  BoulderMapViewRequested({
    required this.page,
    required this.boulderIds,
    required this.filterState,
  });
}
