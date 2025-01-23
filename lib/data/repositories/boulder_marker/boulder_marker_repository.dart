import 'dart:convert';

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/repositories/query_param_factory.dart';
import 'package:breizh_blok_mobile/models/boulder_marker.dart';

class BoulderMarkerRepository {
  BoulderMarkerRepository({
    required this.httpClient,
  });

  final ApiClient httpClient;

  Future<List<BoulderMarker>> findBy({
    Map<String, List<String>>? queryParams,
    bool offlineFirst = false,
  }) async {
    final query = QueryParamFactory.stringify(queryParams: queryParams);

    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        host: const String.fromEnvironment('API_HOST'),
        path: '/boulders',
        query: query,
      ),
      headers: {'Accept': 'application/json'},
      timeout: const Duration(seconds: 10),
      offlineFirst: offlineFirst,
    );

    final json = jsonDecode(response);
    if (json is List) {
      return json
          .map((b) => BoulderMarker.fromJson(b as Map<String, dynamic>))
          .toList();
    }

    throw const FormatException();
  }
}
