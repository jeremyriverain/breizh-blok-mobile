import 'dart:convert';

import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/remote/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/query_param_factory.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:flutter/foundation.dart';

class GradeRepository {
  GradeRepository({required this.httpClient});

  final ApiClient httpClient;

  Future<PaginatedCollection<Grade>> _findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    final query = QueryParamFactory.stringify(queryParams: queryParams);

    final response = await httpClient.get(
      Uri(scheme: 'https', host: Env.apiHost, path: 'grades', query: query),
      offlineFirst: true,
    );
    return compute(_parseGrades, response);
  }

  Future<PaginatedCollection<Grade>> findAll() async {
    return _findBy(queryParams: findAllQueryParams);
  }

  static const Map<String, List<String>> findAllQueryParams = {
    'exists[boulders]': ['true'],
    'pagination': ['false'],
    'order[name]': [kAscendantDirection],
  };
}

PaginatedCollection<Grade> _parseGrades(String responseBody) {
  return PaginatedCollection.fromApi(
    jsonDecode(responseBody) as Map<String, dynamic>,
    Grade.fromJson,
  );
}
