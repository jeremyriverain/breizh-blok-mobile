import 'dart:convert';

import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/data/repositories/query_param_factory.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:flutter/foundation.dart';

class BoulderRepository implements ApiRepositoryInterface<Boulder> {
  BoulderRepository({required this.httpClient});

  @override
  final ApiClient httpClient;

  @override
  Future<Boulder> find(String id) async {
    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        port: Env.apiPort,
        host: Env.apiHost,
        path: '/boulders/$id',
      ),
    );

    final json = jsonDecode(response);
    return Boulder.fromJson(json as Map<String, dynamic>);
  }

  @override
  Future<PaginatedCollection<Boulder>> findBy({
    Map<String, List<String>>? queryParams,
    bool offlineFirst = false,
    Duration? timeout,
  }) async {
    final query = QueryParamFactory.stringify(queryParams: queryParams);
    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        port: Env.apiPort,
        host: Env.apiHost,
        path: '/boulders',
        query: query,
      ),
      offlineFirst: offlineFirst,
      timeout: timeout ?? kRequestDefaultTimeout,
    );

    return compute(parseBoulders, response);
  }
}

PaginatedCollection<Boulder> parseBoulders(String responseBody) {
  return PaginatedCollection.fromApi(
    jsonDecode(responseBody) as Map<String, dynamic>,
    Boulder.fromJson,
  );
}
