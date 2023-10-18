import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/utils/query_constructor.dart';
import 'package:flutter/foundation.dart';

class GradeRepository implements ApiRepositoryInterface<Grade> {
  GradeRepository({required this.httpClient});

  @override
  final AppHttpClient httpClient;

  @override
  Future<CollectionItems<Grade>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    final query = QueryConstructor.stringify(queryParams: queryParams);

    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        host: const String.fromEnvironment('API_HOST'),
        path: 'grades',
        query: query,
      ),
    );
    return compute(_parseGrades, response);
  }

  Future<CollectionItems<Grade>> findWithBouldersOrderedByName() async {
    return findBy(
      queryParams: {
        'exists[boulders]': ['true'],
        'pagination': ['false'],
        'order[name]': ['asc'],
      },
    );
  }

  @override
  Future<Grade> find(String id) {
    throw UnimplementedError();
  }
}

CollectionItems<Grade> _parseGrades(String responseBody) {
  return CollectionItems.fromApi(
    jsonDecode(responseBody) as Map<String, dynamic>,
    Grade.fromJson,
  );
}
