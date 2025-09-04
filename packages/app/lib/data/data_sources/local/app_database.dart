import 'dart:convert';

import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/downloaded_boulder_area.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/tables/db_boulder_areas.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/tables/db_requests.dart';
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
    return (select(
      dbRequests,
    )..where((t) => t.requestPath.equals(id))).getSingleOrNull();
  }

  Future<int> createOrUpdateBoulderArea(DbBoulderArea boulderArea) {
    return into(dbBoulderAreas).insertOnConflictUpdate(boulderArea);
  }

  Stream<List<DownloadedBoulderArea>> allDownloads({
    ApiOrderParam orderParam = const ApiOrderParam(
      direction: kDescendantDirection,
      name: kIdOrderParam,
    ),
  }) {
    return select(dbBoulderAreas)
        .join([
          innerJoin(
            dbRequests,
            dbRequests.requestPath.equalsExp(dbBoulderAreas.iri),
          ),
        ])
        .watch()
        .map((rows) {
          final filteredRows =
              rows.where((row) {
                final request = row.readTable(dbRequests);
                final boulderArea = row.readTable(dbBoulderAreas);
                if (boulderArea.downloadProgress != 100) {
                  return false;
                }
                try {
                  final json = jsonDecode(request.responseBody);
                  if (json case {
                    'name': final String _,
                    'municipality': final Map<String, dynamic> municipalityJson,
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
              }).toList()..sort((a, b) {
                final requestA = a.readTable(dbRequests);
                final requestB = b.readTable(dbRequests);
                final jsonA =
                    jsonDecode(requestA.responseBody) as Map<String, dynamic>;
                final jsonB =
                    jsonDecode(requestB.responseBody) as Map<String, dynamic>;
                final dbBoulderAreaA = a.readTable(dbBoulderAreas);
                final dbBoulderAreaB = a.readTable(dbBoulderAreas);

                final downloadedBoulderAreaA = DownloadedBoulderArea(
                  boulderAreaName: jsonA['name'] as String,
                  boulderAreaIri: dbBoulderAreaA.iri,
                  // ignore: avoid_dynamic_calls
                  municipalityName: jsonA['municipality']['name'] as String,
                  downloadedAt: dbBoulderAreaA.downloadedAt,
                );

                final downloadedBoulderAreaB = DownloadedBoulderArea(
                  boulderAreaName: jsonB['name'] as String,
                  boulderAreaIri: dbBoulderAreaB.iri,
                  // ignore: avoid_dynamic_calls
                  municipalityName: jsonB['municipality']['name'] as String,
                  downloadedAt: dbBoulderAreaB.downloadedAt,
                );

                final c = orderParam.direction == kAscendantDirection
                    ? downloadedBoulderAreaA
                    : downloadedBoulderAreaB;
                final d = orderParam.direction == kAscendantDirection
                    ? downloadedBoulderAreaB
                    : downloadedBoulderAreaA;

                return switch (orderParam.name) {
                  'boulderAreaName' => c.boulderAreaName.compareTo(
                    d.boulderAreaName,
                  ),
                  'municipalityName' =>
                    (c.municipalityName + c.boulderAreaName).compareTo(
                      d.municipalityName + d.boulderAreaName,
                    ),
                  _ => c.downloadedAt.compareTo(d.downloadedAt),
                };
              });

          return filteredRows.map((row) {
            final request = row.readTable(dbRequests);
            final json =
                jsonDecode(request.responseBody) as Map<String, dynamic>;
            final dbBoulderArea = row.readTable(dbBoulderAreas);

            return DownloadedBoulderArea(
              boulderAreaName: json['name'] as String,
              boulderAreaIri: dbBoulderArea.iri,
              // ignore: avoid_dynamic_calls
              municipalityName: json['municipality']['name'] as String,
              downloadedAt: dbBoulderArea.downloadedAt,
            );
          }).toList();
        });
  }

  Stream<DbBoulderArea?> watchDownload(String iri) {
    return (select(
      dbBoulderAreas,
    )..where((t) => t.iri.equals(iri))).watchSingleOrNull();
  }
}
