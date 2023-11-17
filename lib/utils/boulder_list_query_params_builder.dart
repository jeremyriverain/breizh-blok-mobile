import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';

class BoulderListQueryParamsBuilder {
  static Map<String, List<String>> compute({
    required Set<Grade> grades,
    required OrderQueryParam orderQueryParam,
    required BoulderFilterState filterState,
  }) {
    final queryParams = <String, List<String>>{};
    if (filterState.term != null) {
      queryParams['term'] = [filterState.term!];
    }
    queryParams['rock.boulderArea.id[]'] = filterState.boulderAreas
        .map((e) => e.iri.replaceAll('/boulder_areas/', ''))
        .toList();

    queryParams['grade.name[]'] = grades.map((e) => e.name).toList();

    queryParams[orderQueryParam.name] = [orderQueryParam.direction];

    return queryParams;
  }
}
