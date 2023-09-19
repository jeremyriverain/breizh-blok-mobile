import 'dart:convert';

import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';
import 'package:http/http.dart' as http;

class BoulderAreaRepository implements ApiRepositoryInterface<BoulderArea> {
  @override
  Future<BoulderArea> find(String id) async {
    final response = await http.get(
      Uri.https(const String.fromEnvironment('API_HOST'), '/boulder_areas/$id'),
    );
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    final json = jsonDecode(response.body);
    if (json is Map<String, dynamic>) {
      return BoulderArea.fromJson(json);
    }

    throw const FormatException();
  }

  @override
  Future<CollectionItems<BoulderArea>> findBy({
    Map<String, List<String>>? queryParams,
  }) {
    throw UnimplementedError();
  }
}
