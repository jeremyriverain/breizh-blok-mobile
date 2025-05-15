import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/downloaded_boulder_area.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('allDownloads', () {
    test('returns empty list if no entries in BoulderAreas table', () async {
      final database = AppDatabase(NativeDatabase.memory());

      expect(database.allDownloads(), emits(<DownloadedBoulderArea>[]));
    });

    test('returns empty list if no Request entry matches', () async {
      final database = AppDatabase(NativeDatabase.memory());

      await database
          .into(database.dbBoulderAreas)
          .insert(
            DbBoulderAreasCompanion.insert(iri: '/foo', downloadProgress: 100),
          );

      expect(database.allDownloads(), emits(<DownloadedBoulderArea>[]));
    });

    test('returns empty list if request body is invalid', () async {
      final database = AppDatabase(NativeDatabase.memory());

      await database
          .into(database.dbBoulderAreas)
          .insert(
            DbBoulderAreasCompanion.insert(iri: '/foo', downloadProgress: 100),
          );

      await database
          .into(database.dbRequests)
          .insert(
            const DbRequest(
              requestPath: '/foo',
              responseBody: '''
{
}
''',
            ),
          );

      expect(database.allDownloads(), emits(<DownloadedBoulderArea>[]));
    });

    test(
      'returns empty list if json from request body is not parseable',
      () async {
        final database = AppDatabase(NativeDatabase.memory());

        await database
            .into(database.dbBoulderAreas)
            .insert(
              DbBoulderAreasCompanion.insert(
                iri: '/foo',
                downloadProgress: 100,
              ),
            );

        await database
            .into(database.dbRequests)
            .insert(const DbRequest(requestPath: '/foo', responseBody: ''));

        expect(database.allDownloads(), emits(<DownloadedBoulderArea>[]));
      },
    );

    test(
      'returns downloads if there is a matching request that is valid',
      () async {
        final database = AppDatabase(NativeDatabase.memory());

        final mockDate = DateTime.now();

        await database
            .into(database.dbBoulderAreas)
            .insert(
              DbBoulderAreasCompanion.insert(
                iri: '/foo',
                downloadProgress: 100,
                downloadedAt: Value(mockDate),
              ),
            );

        await database
            .into(database.dbRequests)
            .insert(
              const DbRequest(
                requestPath: '/foo',
                responseBody: '''
{
  "name": "Petit paradis",
  "municipality": {
    "name": "Kerlouan"
  }
}
''',
              ),
            );

        expect(
          database.allDownloads(),
          emits([
            DownloadedBoulderArea(
              boulderAreaName: 'Petit paradis',
              boulderAreaIri: '/foo',
              municipalityName: 'Kerlouan',
              downloadedAt: mockDate,
            ),
          ]),
        );
      },
    );

    test(
      'does not return boulder areas that is not completely downloaded',
      () async {
        final database = AppDatabase(NativeDatabase.memory());

        await database
            .into(database.dbBoulderAreas)
            .insert(
              DbBoulderAreasCompanion.insert(iri: '/foo', downloadProgress: 0),
            );

        await database
            .into(database.dbRequests)
            .insert(
              const DbRequest(
                requestPath: '/foo',
                responseBody: '''
{
  "name": "Petit paradis",
  "municipality": {
    "name": "Kerlouan"
  }
}
''',
              ),
            );

        expect(database.allDownloads(), emits(<DownloadedBoulderArea>[]));
      },
    );
  });
}
