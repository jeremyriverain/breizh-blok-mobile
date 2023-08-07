import 'dart:convert';

import 'package:breizh_blok_mobile/models/department.dart';
import 'package:breizh_blok_mobile/utils/query_constructor.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';

class DepartmentRepository implements ApiRepositoryInterface<Department> {
  CollectionItems<Department> _parseDepartments(String responseBody) {
    return CollectionItems.fromApi(
      jsonDecode(responseBody),
      Department.fromJson,
    );
  }

  @override
  Future<CollectionItems<Department>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    String? query = QueryConstructor.stringify(queryParams: queryParams);

    final response = await http.get(Uri(
      scheme: 'https',
      host: const String.fromEnvironment('API_HOST'),
      path: 'departments',
      query: query,
    ));
    if (response.statusCode == 200) {
      return compute(_parseDepartments, response.body);
    } else {
      throw Exception(response.body);
    }
  }

  Future<CollectionItems<Department>> findAll() {
    return findBy(queryParams: {
      'exists[municipalities.boulderAreas.rocks.boulders]': ['true'],
      'pagination': ['false'],
      'order[name]': ['asc'],
    });
  }

  @override
  Future<Department> find(String id) {
    throw UnimplementedError();
  }
}
