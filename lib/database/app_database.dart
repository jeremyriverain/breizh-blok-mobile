import 'dart:convert';

import 'package:breizh_blok_mobile/database/tables/db_boulder_areas.dart';
import 'package:breizh_blok_mobile/database/tables/db_requests.dart';
import 'package:breizh_blok_mobile/models/downloaded_boulder_area.dart';
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

  Future<List<DownloadedBoulderArea>> allDownloads() async {
    final rows = await select(dbBoulderAreas).join([
      innerJoin(
        dbRequests,
        dbRequests.requestPath.equalsExp(dbBoulderAreas.iri),
      ),
    ]).get();

    return rows.where((row) {
      final request = row.readTable(dbRequests);
      final boulderArea = row.readTable(dbBoulderAreas);
      if (!boulderArea.isDownloaded) {
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

      return DownloadedBoulderArea(
        boulderAreaName: json['name'] as String,
        boulderAreaIri: row.readTable(dbBoulderAreas).iri,
        // ignore: avoid_dynamic_calls
        municipalityName: json['municipality']['name'] as String,
      );
    }).toList();
  }

  Stream<DbBoulderArea?> watchDownload(String iri) {
    return (select(dbBoulderAreas)..where((t) => t.iri.equals(iri)))
        .watchSingleOrNull();
  }
}
