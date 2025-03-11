import 'dart:convert';

import 'package:breizh_blok_mobile/config/env_vars.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';

class BoulderAreaRepository implements ApiRepositoryInterface<BoulderArea> {
  BoulderAreaRepository({required this.httpClient});

  @override
  final ApiClient httpClient;

  @override
  Future<BoulderArea> find(String id, {bool offlineFirst = false}) async {
    final response = await httpClient.get(
      Uri.https(EnvVars.apiHost, '/boulder_areas/$id'),
      offlineFirst: offlineFirst,
    );

    final json = jsonDecode(response);
    if (json is Map<String, dynamic>) {
      return BoulderArea.fromJson(json);
    }

    throw const FormatException();
  }

  @override
  Future<PaginatedCollection<BoulderArea>> findBy({
    Map<String, List<String>>? queryParams,
  }) {
    throw UnimplementedError();
  }
}
