import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/utils/query_constructor.dart';
import 'package:flutter/foundation.dart';

class BoulderRepository implements ApiRepositoryInterface<Boulder> {
  BoulderRepository({
    required this.httpClient,
  });

  @override
  final AppHttpClient httpClient;

  @override
  Future<Boulder> find(String id) async {
    final response = await httpClient.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        '/boulders/$id',
      ),
    );

    final json = jsonDecode(response.body);
    return Boulder.fromJson(
      json as Map<String, dynamic>,
    );
  }

  CollectionItems<Boulder> _parseBoulders(String responseBody) {
    return CollectionItems.fromApi(
      jsonDecode(responseBody) as Map<String, dynamic>,
      Boulder.fromJson,
    );
  }

  @override
  Future<CollectionItems<Boulder>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    final query = QueryConstructor.stringify(queryParams: queryParams);
    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        host: const String.fromEnvironment('API_HOST'),
        path: '/boulders',
        query: query,
      ),
    );

    return compute(_parseBoulders, response.body);
  }
}
