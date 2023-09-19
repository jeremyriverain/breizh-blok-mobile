import 'dart:convert';

import 'package:breizh_blok_mobile/models/boulder_marker.dart';
import 'package:breizh_blok_mobile/utils/query_constructor.dart';
import 'package:http/http.dart' as http;

class BoulderMarkerRepository {
  Future<List<BoulderMarker>> findBy({
    Map<String, List<String>>? queryParams,
  }) async {
    final query = QueryConstructor.stringify(queryParams: queryParams);
    final response = await http.get(
      Uri(
        scheme: 'https',
        host: const String.fromEnvironment('API_HOST'),
        path: '/boulders',
        query: query,
      ),
      headers: {'Accept': 'application/json'},
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final json = jsonDecode(response.body);
    if (json is List) {
      return json
          .map((b) => BoulderMarker.fromJson(b as Map<String, dynamic>))
          .toList();
    }

    throw const FormatException();
  }
}
