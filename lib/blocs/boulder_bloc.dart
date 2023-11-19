import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/models/response.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BoulderState = Response<CollectionItems<Boulder>>;

class BoulderBloc extends Bloc<BoulderEvent, BoulderState> {
  BoulderBloc({
    required this.repository,
  }) : super(const Response()) {
    on<BoulderListViewRequested>(
      (event, emit) async {
        final queryParams = <String, List<String>>{
          'page': [
            event.page.toString(),
          ],
          event.orderQueryParam.name: [event.orderQueryParam.direction],
        };
        if (event.filterState.term != null) {
          queryParams['term'] = [event.filterState.term!];
        }
        if (event.filterState.boulderAreas.isNotEmpty) {
          queryParams['rock.boulderArea.id[]'] = event.filterState.boulderAreas
              .map((e) => e.iri.replaceAll('/boulder_areas/', ''))
              .toList();
        }

        if (event.grades.isNotEmpty) {
          queryParams['grade.name[]'] =
              event.grades.map((e) => e.name).toList();
        }

        try {
          final data = await repository.findBy(
            queryParams: queryParams,
            offlineFirst: event.offlineFirst,
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
      },
    );

    on<BoulderMapViewRequested>(
      (event, emit) async {
        final queryParams = <String, List<String>>{
          'page': [
            event.page.toString(),
          ],
          event.orderQueryParam.name: [event.orderQueryParam.direction],
          'id[]': event.boulderIds,
        };
        try {
          final data = await repository.findBy(
            queryParams: queryParams,
            offlineFirst: event.offlineFirst,
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
      },
    );

    on<DbBouldersRequested>(
      (event, emit) async {
        try {
          final data = await repository.findBy(
            queryParams: event.queryParams,
            offlineFirst: true,
            timeout: const Duration(seconds: 15),
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
      },
    );
  }
  final BoulderRepository repository;
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
    required this.orderQueryParam,
    this.offlineFirst = false,
  });
  final int page;
  final List<String> boulderIds;
  final OrderQueryParam orderQueryParam;
  final bool offlineFirst;
}

class DbBouldersRequested extends BoulderEvent {
  DbBouldersRequested({
    required this.queryParams,
  });

  final Map<String, List<String>> queryParams;
}
