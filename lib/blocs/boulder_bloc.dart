import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
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
          final queryParams = {
            'rock.boulderArea.id[]': [
              event.boulderArea.iri.replaceAll('/boulder_areas/', ''),
            ],
            kIdOrderQueryParam: [kDescendantDirection],
            'pagination': ['false'],
          };
          var data = await repository.findBy(
            queryParams: queryParams,
            offlineFirst: true,
            timeout: const Duration(seconds: 15),
          );

          data = CollectionItems(
            items: data.items.where((boulder) {
              final grades = event.grades;
              if (grades.isEmpty) {
                return true;
              }

              if (grades.contains(boulder.grade)) {
                return true;
              }
              return false;
            }).toList(),
            totalItems: data.totalItems,
            nextPage: data.nextPage,
          );

          if (event.orderQueryParam.name == kGradeOrderQueryParam) {
            data = CollectionItems(
              items: data.items
                ..sort((firstBoulder, secondBoulder) {
                  return _compareGrades(
                    firstBoulder,
                    secondBoulder,
                    orderQueryParam: event.orderQueryParam,
                  );
                }),
              totalItems: data.totalItems,
              nextPage: data.nextPage,
            );
          }

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

  int _compareGrades(
    Boulder firstBoulder,
    Boulder secondBoulder, {
    required OrderQueryParam orderQueryParam,
  }) {
    final direction = orderQueryParam.direction;
    final aGrade = direction == kAscendantDirection
        ? firstBoulder.grade
        : secondBoulder.grade;
    final bGrade = direction == kAscendantDirection
        ? secondBoulder.grade
        : firstBoulder.grade;
    if (aGrade == null && bGrade == null) {
      return 0;
    }
    if (aGrade == null) {
      return 1;
    }
    if (bGrade == null) {
      return -1;
    }
    return aGrade.name.compareTo(bGrade.name);
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
    required this.boulderArea,
    required this.orderQueryParam,
    required this.grades,
  });

  final BoulderArea boulderArea;
  final OrderQueryParam orderQueryParam;
  final Set<Grade> grades;
}
