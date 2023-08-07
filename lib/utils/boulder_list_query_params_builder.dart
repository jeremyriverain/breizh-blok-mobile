import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';

class BoulderListQueryParamsBuilder {
  static Future<Map<String, List<String>>> compute({
    required BoulderFilterState filterState,
    required OrderQueryParam orderQueryParam,
  }) async {
    Map<String, List<String>> queryParams = {};
    if (filterState.term != null) {
      queryParams['term'] = [filterState.term!];
    }
    queryParams['rock.boulderArea.id[]'] = filterState.boulderAreas
        .map((e) => e.iri.replaceAll('/boulder_areas/', ''))
        .toList();

    queryParams['grade.name[]'] =
        filterState.grades.map((e) => e.name).toList();

    queryParams[orderQueryParam.name] = [orderQueryParam.direction];

    return queryParams;
  }
}
