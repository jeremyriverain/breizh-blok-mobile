import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/models/downloaded_boulder_area.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  group('allDownloads', () {
    test('returns empty list if no entries in BoulderAreas table', () async {
      final database = AppDatabase(NativeDatabase.memory());

      expect(await database.allDownloads(), <DownloadedBoulderArea>[]);
    });

    test('returns empty list if no Request entry matches', () async {
      final database = AppDatabase(NativeDatabase.memory());

      await database.into(database.boulderAreas).insert(
            const BoulderArea(iri: '/foo', isDownloaded: true),
          );

      expect(await database.allDownloads(), <DownloadedBoulderArea>[]);
    });

    test('returns empty list if request body is invalid', () async {
      final database = AppDatabase(NativeDatabase.memory());

      await database.into(database.boulderAreas).insert(
            const BoulderArea(iri: '/foo', isDownloaded: true),
          );

      await database.into(database.requests).insert(
            const Request(
              requestPath: '/foo',
              responseBody: '''
{
}
''',
            ),
          );

      expect(await database.allDownloads(), <DownloadedBoulderArea>[]);
    });

    test('returns empty list if json from request body is not parseable',
        () async {
      final database = AppDatabase(NativeDatabase.memory());

      await database.into(database.boulderAreas).insert(
            const BoulderArea(iri: '/foo', isDownloaded: true),
          );

      await database.into(database.requests).insert(
            const Request(
              requestPath: '/foo',
              responseBody: '',
            ),
          );

      expect(await database.allDownloads(), <DownloadedBoulderArea>[]);
    });

    test('returns downloads if there is a matching request that is valid',
        () async {
      final database = AppDatabase(NativeDatabase.memory());

      await database.into(database.boulderAreas).insert(
            const BoulderArea(iri: '/foo', isDownloaded: true),
          );

      await database.into(database.requests).insert(
            const Request(
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
        await database.allDownloads(),
        [
          const DownloadedBoulderArea(
            boulderAreaName: 'Petit paradis',
            boulderAreaIri: '/foo',
            municipalityName: 'Kerlouan',
          ),
        ],
      );
    });

    test('does not return boulder areas that is not completely downloaded',
        () async {
      final database = AppDatabase(NativeDatabase.memory());

      await database.into(database.boulderAreas).insert(
            const BoulderArea(iri: '/foo', isDownloaded: false),
          );

      await database.into(database.requests).insert(
            const Request(
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
        await database.allDownloads(),
        <DownloadedBoulderArea>[],
      );
    });
  });
}
