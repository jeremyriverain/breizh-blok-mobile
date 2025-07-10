import 'dart:convert';

import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/repositories/query_param_factory.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:flutter/foundation.dart';

class BoulderMarkerRepository {
  BoulderMarkerRepository({required this.httpClient});

  final ApiClient httpClient;

  Future<List<BoulderMarker>> findByBoulderArea({
    required BoulderArea boulderArea,
  }) async {
    final query = QueryParamFactory.stringify(
      queryParams: {
        'pagination': ['false'],
        'rock.boulderArea.id': [boulderArea.id],
        'groups[]': ['Boulder:map'],
      },
    );
    final response = await httpClient.get(
      Uri(scheme: 'https', host: Env.apiHost, path: '/boulders', query: query),
      headers: {'Accept': 'application/json'},
      timeout: const Duration(seconds: 10),
      offlineFirst: true,
    );

    return _decodeResponse(response);
  }

  Future<List<BoulderMarker>> findAll() async {
    final query = QueryParamFactory.stringify(
      queryParams: {
        'pagination': ['false'],
        'groups[]': ['Boulder:map'],
      },
    );
    final response = await httpClient.get(
      Uri(scheme: 'https', host: Env.apiHost, path: '/boulders', query: query),
      headers: {'Accept': 'application/json'},
      timeout: const Duration(seconds: 10),
      offlineFirst: true,
    );

    return _decodeResponse(response);
  }

  Future<List<BoulderMarker>> _decodeResponse(String response) async {
    final json = await compute(jsonDecode, response);
    if (json is List) {
      return json
          .map((b) => BoulderMarker.fromJson(b as Map<String, dynamic>))
          .toList();
    }

    throw const FormatException();
  }
}
