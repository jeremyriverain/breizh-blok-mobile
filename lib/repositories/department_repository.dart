import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/department.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:breizh_blok_mobile/query_param_factory.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';
import 'package:flutter/foundation.dart';

class DepartmentRepository implements ApiRepositoryInterface<Department> {
  DepartmentRepository({required this.httpClient});

  @override
  final AppHttpClient httpClient;

  @override
  Future<CollectionItems<Department>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    final query = QueryParamFactory.stringify(queryParams: queryParams);

    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        host: const String.fromEnvironment('API_HOST'),
        path: 'departments',
        query: query,
      ),
    );

    return compute(_parseDepartments, response);
  }

  Future<CollectionItems<Department>> findAll() {
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

CollectionItems<Department> _parseDepartments(String responseBody) {
  return CollectionItems.fromApi(
    jsonDecode(responseBody) as Map<String, dynamic>,
    Department.fromJson,
  );
}
