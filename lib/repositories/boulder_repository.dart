import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/query_param_factory.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';
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

    final json = jsonDecode(response);
    return Boulder.fromJson(
      json as Map<String, dynamic>,
    );
  }

  @override
  Future<CollectionItems<Boulder>> findBy({
    Map<String, List<String>>? queryParams,
    bool offlineFirst = false,
    Duration? timeout,
  }) async {
    final query = QueryParamFactory.stringify(queryParams: queryParams);
    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        host: const String.fromEnvironment('API_HOST'),
        path: '/boulders',
        query: query,
      ),
      offlineFirst: offlineFirst,
      timeout: timeout ?? kRequestDefaultTimeout,
    );

    return compute(parseBoulders, response);
  }
}

CollectionItems<Boulder> parseBoulders(String responseBody) {
  return CollectionItems.fromApi(
    jsonDecode(responseBody) as Map<String, dynamic>,
    Boulder.fromJson,
  );
}
