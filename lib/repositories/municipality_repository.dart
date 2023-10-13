import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';

class MunicipalityRepository implements ApiRepositoryInterface<Municipality> {
  MunicipalityRepository({
    required this.httpClient,
  });

  @override
  final AppHttpClient httpClient;
  @override
  Future<Municipality> find(String id) async {
    final response = await httpClient.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        '/municipalities/$id',
      ),
    );
    return Municipality.fromJson(
      jsonDecode(response.body) as Map<String, dynamic>,
    );
  }

  @override
  Future<CollectionItems<Municipality>> findBy({
    Map<String, List<String>>? queryParams,
  }) {
    throw UnimplementedError();
  }
}
