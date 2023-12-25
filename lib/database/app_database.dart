import 'dart:convert';

import 'package:breizh_blok_mobile/database/tables/db_boulder_areas.dart';
import 'package:breizh_blok_mobile/database/tables/db_requests.dart';
import 'package:breizh_blok_mobile/models/downloaded_boulder_area.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [DbRequests, DbBoulderAreas])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  Future<int> createOrUpdateRequest(DbRequest request) {
    return into(dbRequests).insertOnConflictUpdate(request);
  }

  Future<DbRequest?> requestById(String id) {
    return (select(dbRequests)..where((t) => t.requestPath.equals(id)))
        .getSingleOrNull();
  }

  Future<int> createOrUpdateBoulderArea(DbBoulderArea boulderArea) {
    return into(dbBoulderAreas).insertOnConflictUpdate(boulderArea);
  }

  Future<List<DownloadedBoulderArea>> allDownloads({
    OrderParam orderParam =
        const OrderParam(direction: kDescendantDirection, name: kIdOrderParam),
  }) async {
    final rows = await select(dbBoulderAreas).join([
      innerJoin(
        dbRequests,
        dbRequests.requestPath.equalsExp(dbBoulderAreas.iri),
      ),
    ]).get();

    return rows.where((row) {
      final request = row.readTable(dbRequests);
      final boulderArea = row.readTable(dbBoulderAreas);
      if (boulderArea.downloadProgress != 100) {
        return false;
      }
      try {
        final json = jsonDecode(request.responseBody);
        if (json
            case {
              'name': final String _,
              'municipality': final Map<String, dynamic> municipalityJson
            }) {
          if (municipalityJson case {'name': final String _}) {
            return true;
          }
          return false;
        }
        return false;
      } catch (e) {
        return false;
      }
    }).map((row) {
      final json = jsonDecode(row.readTable(dbRequests).responseBody)
          as Map<String, dynamic>;

      final dbBoulderArea = row.readTable(dbBoulderAreas);

      return DownloadedBoulderArea(
        boulderAreaName: json['name'] as String,
        boulderAreaIri: row.readTable(dbBoulderAreas).iri,
        // ignore: avoid_dynamic_calls
        municipalityName: json['municipality']['name'] as String,
        downloadedAt: dbBoulderArea.downloadedAt,
      );
    }).toList()
      ..sort((a, b) {
        final c = orderParam.direction == kAscendantDirection ? a : b;
        final d = orderParam.direction == kAscendantDirection ? b : a;
        return switch (orderParam.name) {
          'boulderAreaName' => c.boulderAreaName.compareTo(d.boulderAreaName),
          'municipalityName' => (c.municipalityName + c.boulderAreaName)
              .compareTo(d.municipalityName + d.boulderAreaName),
          _ => c.downloadedAt.compareTo(d.downloadedAt),
        };
      });
  }

  Stream<DbBoulderArea?> watchDownload(String iri) {
    return (select(dbBoulderAreas)..where((t) => t.iri.equals(iri)))
        .watchSingleOrNull();
  }
}
