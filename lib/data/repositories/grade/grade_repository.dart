import 'dart:convert';

import 'package:breizh_blok_mobile/config/env_vars.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/data/repositories/query_param_factory.dart';
import 'package:breizh_blok_mobile/domain/models/grade/grade.dart';
import 'package:flutter/foundation.dart';

class GradeRepository implements ApiRepositoryInterface<Grade> {
  GradeRepository({required this.httpClient});

  @override
  final ApiClient httpClient;

  @override
  Future<PaginatedCollection<Grade>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    final query = QueryParamFactory.stringify(queryParams: queryParams);

    final response = await httpClient.get(
      Uri(scheme: 'https', host: EnvVars.apiHost, path: 'grades', query: query),
      offlineFirst: true,
    );
    return compute(_parseGrades, response);
  }

  Future<PaginatedCollection<Grade>> findAll() async {
    return findBy(queryParams: findAllQueryParams);
  }

  static const findAllQueryParams = {
    'exists[boulders]': ['true'],
    'pagination': ['false'],
    'order[name]': [kAscendantDirection],
  };

  @override
  Future<Grade> find(String id) {
    throw UnimplementedError();
  }
}

PaginatedCollection<Grade> _parseGrades(String responseBody) {
  return PaginatedCollection.fromApi(
    jsonDecode(responseBody) as Map<String, dynamic>,
    Grade.fromJson,
  );
}
