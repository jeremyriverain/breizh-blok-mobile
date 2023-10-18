import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/repositories/api_repository_interface.dart';

class BoulderAreaRepository implements ApiRepositoryInterface<BoulderArea> {
  BoulderAreaRepository({
    required this.httpClient,
  });

  @override
  final AppHttpClient httpClient;

  @override
  Future<BoulderArea> find(String id) async {
    final response = await httpClient.get(
      Uri.https(const String.fromEnvironment('API_HOST'), '/boulder_areas/$id'),
    );

    final json = jsonDecode(response);
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
