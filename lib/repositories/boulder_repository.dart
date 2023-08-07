import 'dart:convert';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/utils/query_constructor.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import 'package:breizh_blok_mobile/models/boulder.dart';

class BoulderRepository implements ApiRepositoryInterface<Boulder> {
  @override
  Future<Boulder> find(String id) async {
    final response = await http.get(
        Uri.https(const String.fromEnvironment('API_HOST'), '/boulders/$id'));
    if (response.statusCode == 200) {
      return Boulder.fromJson(jsonDecode(response.body));
    } else {
      throw Exception(response.body);
    }
  }

  CollectionItems<Boulder> _parseBoulders(String responseBody) {
    return CollectionItems.fromApi(
      jsonDecode(responseBody),
      Boulder.fromJson,
    );
  }

  @override
  Future<CollectionItems<Boulder>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    String? query = QueryConstructor.stringify(queryParams: queryParams);
    final response = await http
        .get(Uri(
          scheme: 'https',
          host: const String.fromEnvironment('API_HOST'),
          path: '/boulders',
          query: query,
        ))
        .timeout(const Duration(seconds: 10));
    if (response.statusCode == 200) {
      return compute(_parseBoulders, response.body);
    } else {
      throw Exception(response.body);
    }
  }
}
