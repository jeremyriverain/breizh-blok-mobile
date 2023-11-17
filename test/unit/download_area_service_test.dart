import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/download_area_service.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  final mockClient = MockClient((request) async {
    return http.Response(
      json.encode({}),
      200,
      request: request,
      headers: {'content-type': 'application/json'},
    );
  });
  final database = AppDatabase(NativeDatabase.memory());
  final httpClient = AppHttpClient(
    database: database,
    httpClient: mockClient,
  );

  final boulderArea = BoulderArea(
    iri: '/boulder_areas/3',
    name: 'foo',
    municipality: Municipality(
      iri: '/bar',
      name: 'bar',
      boulderAreas: const <BoulderArea>[],
      centroid: Location(latitude: 0, longitude: 0),
    ),
  );

  test('download', () async {
    final downloadAreaService = DownloadAreaService(
      database: database,
      httpClient: httpClient,
    );

    final storedRequestsBeforeDownloading =
        await database.select(database.dbRequests).get();
    expect(storedRequestsBeforeDownloading.length, equals(0));

    final storedBoulderAreasBeforeDownloading =
        await database.select(database.dbBoulderAreas).get();
    expect(storedBoulderAreasBeforeDownloading.length, equals(0));

    await downloadAreaService.download(
      BoulderArea(
        iri: '/boulder_areas/3',
        name: 'foo',
        municipality: Municipality(
          iri: '/bar',
          name: 'bar',
          boulderAreas: const <BoulderArea>[],
          centroid: Location(latitude: 0, longitude: 0),
        ),
      ),
    );

    final storedRequests = await database.select(database.dbRequests).get();
    expect(storedRequests.length, equals(2));
    expect(
      storedRequests,
      [
        const DbRequest(
          requestPath:
              '/boulders?id=desc&pagination=false&rock.boulderArea.id%5B%5D=3',
          responseBody: '{}',
        ),
        DbRequest(
          requestPath: boulderArea.iri,
          responseBody: '{}',
        ),
      ],
    );

    final storedBoulderAreas =
        await database.select(database.dbBoulderAreas).get();
    expect(storedBoulderAreas.length, equals(1));
    expect(
      storedBoulderAreas,
      [
        DbBoulderArea(
          iri: boulderArea.iri,
          isDownloaded: true,
        ),
      ],
    );
  });
}