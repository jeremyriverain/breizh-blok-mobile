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

  test('download then remove download', () async {
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

    // download
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

    const expectedBouldersRequestPath =
        '/boulders?order%5Bid%5D=desc&pagination=false&rock.boulderArea.id%5B%5D=3';
    const expectedGradesRequestPath =
        '/grades?exists%5Bboulders%5D=true&order%5Bname%5D=asc&pagination=false';
    expect(storedRequests.length, equals(3));
    expect(
      storedRequests,
      [
        const DbRequest(
          requestPath: expectedBouldersRequestPath,
          responseBody: '{}',
        ),
        DbRequest(
          requestPath: boulderArea.iri,
          responseBody: '{}',
        ),
        const DbRequest(
          requestPath: expectedGradesRequestPath,
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
          boulders: expectedBouldersRequestPath,
        ),
      ],
    );

    // remove download
    await downloadAreaService.removeDownload(boulderArea.iri);
    final storedBoulderAreasAfterRemovingDownload =
        await database.select(database.dbBoulderAreas).get();
    expect(storedBoulderAreasAfterRemovingDownload.length, equals(0));
    final storedRequetsAfterRemovingDownload =
        await database.select(database.dbRequests).get();
    expect(storedRequetsAfterRemovingDownload.length, equals(1));

    expect(
      storedRequetsAfterRemovingDownload,
      [
        const DbRequest(
          requestPath: expectedGradesRequestPath,
          responseBody: '{}',
        ),
      ],
    );
  });
}
