import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:breizh_blok_mobile/utils/query_constructor.dart';
import 'package:breizh_blok_mobile/models/boulder_marker.dart';

class BoulderMarkerRepository {
  Future<List<BoulderMarker>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    String? query = QueryConstructor.stringify(queryParams: queryParams);
    final response = await http.get(
      Uri(
        scheme: 'https',
        host: const String.fromEnvironment('API_HOST'),
        path: '/boulders',
        query: query,
      ),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode == 200) {
      return jsonDecode(response.body)
          .map<BoulderMarker>((marker) => BoulderMarker.fromJson(marker))
          .toList();
    } else {
      throw Exception(response.body);
    }
  }
}
