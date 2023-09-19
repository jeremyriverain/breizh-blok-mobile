import 'dart:convert';

import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';
import 'package:http/http.dart' as http;

class MunicipalityRepository implements ApiRepositoryInterface<Municipality> {
  @override
  Future<Municipality> find(String id) async {
    final response = await http.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        '/municipalities/$id',
      ),
    );
    if (response.statusCode == 200) {
      return Municipality.fromJson(
        jsonDecode(response.body) as Map<String, dynamic>,
      );
    } else {
      throw Exception(response.body);
    }
  }

  @override
  Future<CollectionItems<Municipality>> findBy({
    Map<String, List<String>>? queryParams,
  }) {
    throw UnimplementedError();
  }
}
