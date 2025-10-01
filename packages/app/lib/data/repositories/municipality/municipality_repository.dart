import 'dart:convert';

import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/api_repository_interface.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';

class MunicipalityRepository implements ApiRepositoryInterface<Municipality> {
  MunicipalityRepository({required this.httpClient});

  @override
  final ApiClient httpClient;
  @override
  Future<Municipality> find(String id) async {
    final response = await httpClient.get(
      Uri(
        scheme: 'https',
        port: Env.apiPort,
        host: Env.apiHost,
        path: '/municipalities/$id',
      ),
    );
    return Municipality.fromJson(jsonDecode(response) as Map<String, dynamic>);
  }

  @override
  Future<PaginatedCollection<Municipality>> findBy({
    Map<String, List<String>>? queryParams,
  }) {
    throw UnimplementedError();
  }
}
