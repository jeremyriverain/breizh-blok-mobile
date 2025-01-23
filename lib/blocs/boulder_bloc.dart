import 'package:breizh_blok_mobile/data/data_sources/api/model/boulder/boulder_api_response.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/download_area_service.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

typedef BoulderState = BoulderApiResponse<PaginatedCollection<Boulder>>;

class BoulderBloc extends Bloc<BoulderEvent, BoulderState> {
  BoulderBloc({
    required this.repository,
  }) : super(const BoulderApiResponse()) {
    on<BoulderRequested>(
      (event, emit) async {
        final queryParams = <String, List<String>>{
          'page': [
            event.page.toString(),
          ],
          event.orderParam.name: [event.orderParam.direction],
        };

        final term = event.term;
        if (term != null) {
          queryParams['term'] = [term];
        }
        final boulderAreas = event.boulderAreas;
        if (boulderAreas.isNotEmpty) {
          queryParams['rock.boulderArea.id[]'] = boulderAreas
              .map((e) => e.iri.replaceAll('/boulder_areas/', ''))
              .toList();
        }

        if (event.grades.isNotEmpty) {
          queryParams['grade.name[]'] =
              event.grades.map((e) => e.name).toList();
        }

        if (event.boulderIds.isNotEmpty) {
          queryParams['id[]'] = event.boulderIds.map((e) => e).toList();
        }

        try {
          final data = await repository.findBy(
            queryParams: queryParams,
          );
          emit(
            BoulderApiResponse(
              data: data,
            ),
          );
        } catch (error) {
          emit(
            BoulderApiResponse(
              error: error,
            ),
          );
        }
      },
    );

    on<DbBouldersRequested>(
      (event, emit) async {
        try {
          final queryParams = DownloadAreaService.bouldersQueryParamsOf(
            boulderArea: event.boulderArea,
          );

          var data = await repository.findBy(
            queryParams: queryParams,
            offlineFirst: true,
            timeout: const Duration(seconds: 15),
          );

          data = data.copyWith(
            items: data.items.where((boulder) {
              return _isInSet(boulder.id, event.boulderIds) &&
                  _isInSet(
                    boulder.grade,
                    event.grades,
                  );
            }).toList(),
          );

          if (event.orderParam.name == kGradeOrderParam) {
            data = data.copyWith(
              items: data.items
                ..sort((firstBoulder, secondBoulder) {
                  return _compareGrades(
                    firstBoulder,
                    secondBoulder,
                    orderParam: event.orderParam,
                  );
                }),
            );
          }

          data = data.copyWith(
            totalItems: data.items.length,
          );

          emit(
            BoulderApiResponse(
              data: data,
            ),
          );
        } catch (error) {
          emit(
            BoulderApiResponse(
              error: error,
            ),
          );
        }
      },
    );
  }
  final BoulderRepository repository;

  bool _isInSet<T>(T item, Set<T> set) {
    if (set.isEmpty) {
      return true;
    }

    if (set.contains(item)) {
      return true;
    }
    return false;
  }

  int _compareGrades(
    Boulder firstBoulder,
    Boulder secondBoulder, {
    required OrderParam orderParam,
  }) {
    final direction = orderParam.direction;
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

class BoulderRequested extends BoulderEvent {
  BoulderRequested({
    required this.page,
    required this.orderParam,
    this.term,
    this.boulderAreas = const {},
    this.grades = const {},
    this.boulderIds = const {},
  });
  final int page;
  final String? term;
  final Set<BoulderArea> boulderAreas;
  final OrderParam orderParam;
  final Set<Grade> grades;
  final Set<String> boulderIds;
}

class DbBouldersRequested extends BoulderEvent {
  DbBouldersRequested({
    required this.boulderArea,
    required this.orderParam,
    this.grades = const {},
    this.boulderIds = const {},
  });

  final BoulderArea boulderArea;
  final OrderParam orderParam;
  final Set<Grade> grades;
  final Set<String> boulderIds;
}
