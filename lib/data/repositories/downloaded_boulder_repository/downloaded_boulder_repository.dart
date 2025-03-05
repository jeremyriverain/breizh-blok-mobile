import 'dart:convert';

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';

class DownloadedBoulderRepository {
  DownloadedBoulderRepository({
    required this.database,
    required this.httpClient,
  });

  final AppDatabase database;
  final ApiClient httpClient;

  Future<Boulder> find({
    required String boulderAreaIri,
    required String boulderId,
  }) {
    return (database.select(database.dbBoulderAreas)
          ..where((tbl) => tbl.iri.equals(boulderAreaIri)))
        .getSingle()
        .then((dbBoulderArea) {
          final bouldersPath = dbBoulderArea.boulders;
          if (bouldersPath == null) {
            throw Exception('boulders property should be defined');
          }
          return httpClient.get(Uri.parse(bouldersPath), offlineFirst: true);
        })
        .then((response) {
          final boulderJson =
          // ignore: avoid_dynamic_calls
          (jsonDecode(response)['hydra:member'] as List<dynamic>)
          // ignore: avoid_dynamic_calls
          .singleWhere((json) => json['@id'] == '/boulders/$boulderId');
          return Boulder.fromJson(boulderJson as Map<String, dynamic>);
        });
  }
}
