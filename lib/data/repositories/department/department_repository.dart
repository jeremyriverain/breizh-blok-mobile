import 'dart:convert';

import 'package:breizh_blok_mobile/config/env_vars.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/data/repositories/query_param_factory.dart';
import 'package:breizh_blok_mobile/domain/models/department/department.dart';
import 'package:flutter/foundation.dart';

class DepartmentRepository implements ApiRepositoryInterface<Department> {
  DepartmentRepository({required this.httpClient});

  @override
  final ApiClient httpClient;

  @override
  Future<PaginatedCollection<Department>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    final query = QueryParamFactory.stringify(queryParams: queryParams);

    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        host: EnvVars.apiHost,
        path: 'departments',
        query: query,
      ),
    );

    return compute(_parseDepartments, response);
  }

  Future<PaginatedCollection<Department>> findAll() {
    return findBy(
      queryParams: {
        'exists[municipalities.boulderAreas.rocks.boulders]': ['true'],
        'pagination': ['false'],
        'order[name]': [kAscendantDirection],
      },
    );
  }

  @override
  Future<Department> find(String id) {
    throw UnimplementedError();
  }
}

PaginatedCollection<Department> _parseDepartments(String responseBody) {
  return PaginatedCollection.fromApi(
    jsonDecode(responseBody) as Map<String, dynamic>,
    Department.fromJson,
  );
}
