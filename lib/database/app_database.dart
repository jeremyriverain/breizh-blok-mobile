import 'dart:convert';

import 'package:breizh_blok_mobile/database/tables/boulder_areas.dart';
import 'package:breizh_blok_mobile/database/tables/requests.dart';
import 'package:breizh_blok_mobile/models/downloaded_boulder_area.dart';
import 'package:drift/drift.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Requests, BoulderAreas])
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  @override
  int get schemaVersion => 1;

  Future<int> createOrUpdateRequest(Request request) {
    return into(requests).insertOnConflictUpdate(request);
  }

  Future<Request?> requestById(String id) {
    return (select(requests)..where((t) => t.requestPath.equals(id)))
        .getSingleOrNull();
  }

  Future<int> createOrUpdateBoulderArea(BoulderArea boulderArea) {
    return into(boulderAreas).insertOnConflictUpdate(boulderArea);
  }

  Future<List<DownloadedBoulderArea>> allDownloads() async {
    final rows = await select(boulderAreas).join([
      innerJoin(
        requests,
        requests.requestPath.equalsExp(boulderAreas.iri),
      ),
    ]).get();

    return rows.where((row) {
      final request = row.readTable(requests);
      final boulderArea = row.readTable(boulderAreas);
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
      final json = jsonDecode(row.readTable(requests).responseBody)
          as Map<String, dynamic>;

      return DownloadedBoulderArea(
        boulderAreaName: json['name'] as String,
        boulderAreaIri: row.readTable(boulderAreas).iri,
        // ignore: avoid_dynamic_calls
        municipalityName: json['municipality']['name'] as String,
      );
    }).toList();
  }

  Stream<BoulderArea?> watchDownload(String iri) {
    return (select(boulderAreas)..where((t) => t.iri.equals(iri)))
        .watchSingleOrNull();
  }
}
