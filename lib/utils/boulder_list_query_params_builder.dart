import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';

class BoulderListQueryParamsBuilder {
  static Future<Map<String, List<String>>> compute(
    BoulderFilterState filterState,
  ) async {
    Map<String, List<String>> queryParams = {};
    if (filterState.term != null) {
      queryParams['term'] = [filterState.term!];
    }
    queryParams['rock.boulderArea.id[]'] = filterState.boulderAreas
        .map((e) => e.iri.replaceAll('/boulder_areas/', ''))
        .toList();

    queryParams['grade.name[]'] =
        filterState.grades.map((e) => e.name).toList();

    queryParams[filterState.order.name] = [filterState.order.direction];

    return queryParams;
  }
}
