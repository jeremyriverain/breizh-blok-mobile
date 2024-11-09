import 'package:breizh_blok_mobile/local_db/app_database.dart';
import 'package:breizh_blok_mobile/presentation/views/download_view.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  testWidgets('display fallback content if there is no downloads',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: DownloadView(
          database: AppDatabase(
            NativeDatabase.memory(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Aucun téléchargement'), findsOneWidget);
  });

  Future<void> createDownload(
    AppDatabase database, {
    required String boulerAreaName,
    required String municipalityName,
    required String boulderAreaIri,
  }) async {
    await Future.wait(
      [
        database.into(database.dbBoulderAreas).insert(
              DbBoulderAreasCompanion.insert(
                iri: boulderAreaIri,
                downloadProgress: 100,
              ),
            ),
        database.into(database.dbRequests).insert(
              DbRequest(
                requestPath: boulderAreaIri,
                responseBody: '''
{
  "name": "$boulerAreaName",
  "municipality": {
    "name": "$municipalityName"
  }
}
''',
              ),
            ),
      ],
    );
  }

  testWidgets('display downloads', (WidgetTester tester) async {
    final database = AppDatabase(
      NativeDatabase.memory(),
    );

    await createDownload(
      database,
      municipalityName: 'Kerlouan',
      boulerAreaName: 'Petit paradis',
      boulderAreaIri: '/foo',
    );

    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        locale: const Locale('fr'),
        home: Scaffold(
          body: DownloadView(
            database: database,
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ListTile), findsOneWidget);
    expect(
      find.descendant(
        of: find.byKey(const Key('/foo')),
        matching: find.textContaining(
          'Petit paradis',
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );

    expect(
      find.descendant(
        of: find.byKey(const Key('/foo')),
        matching: find.textContaining(
          'Kerlouan',
          findRichText: true,
        ),
      ),
      findsOneWidget,
    );
  });

  testWidgets('sort downloaded boulder areas', (WidgetTester tester) async {
    await tester.runAsync(() async {
      final database = AppDatabase(
        NativeDatabase.memory(),
      );

      await Future.wait([
        createDownload(
          database,
          municipalityName: 'Kerlouan',
          boulerAreaName: 'Petit paradis',
          boulderAreaIri: '/foo',
        ),
        // ignore: inference_failure_on_instance_creation
        Future.delayed(const Duration(milliseconds: 1)).then(
          (_) => createDownload(
            database,
            boulerAreaName: 'Bois de Keroual',
            municipalityName: 'Guilers',
            boulderAreaIri: '/bar',
          ),
        ),
        // ignore: inference_failure_on_instance_creation
        Future.delayed(const Duration(milliseconds: 2)).then(
          (_) => createDownload(
            database,
            boulerAreaName: 'Impératrice',
            municipalityName: 'Plougastel Daoulas',
            boulderAreaIri: '/baz',
          ),
        ),
        // ignore: inference_failure_on_instance_creation
        Future.delayed(const Duration(milliseconds: 3)).then(
          (_) => createDownload(
            database,
            boulerAreaName: 'La rivière',
            municipalityName: 'Kerlouan',
            boulderAreaIri: '/boo',
          ),
        ),
      ]);

      await tester.pumpWidget(
        MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
          home: Scaffold(
            body: DownloadView(
              database: database,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      expect(find.byType(ListTile), findsNWidgets(4));

      // displays the most recent downloads first
      expect(
        find.descendant(
          of: find.byType(ListTile).at(0),
          matching: find.text('Petit paradis'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(1),
          matching: find.text('Bois de Keroual'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(2),
          matching: find.text('Impératrice'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(3),
          matching: find.text('La rivière'),
        ),
        findsOneWidget,
      );

      // sort by boulderAreaName
      await tester.tap(find.text('Trier'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('A - Z (secteur)'));
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byType(ListTile).at(0),
          matching: find.text('Bois de Keroual'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(1),
          matching: find.text('Impératrice'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(2),
          matching: find.text('La rivière'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(3),
          matching: find.text('Petit paradis'),
        ),
        findsOneWidget,
      );

      // sort by municipalityName
      await tester.tap(find.text('Trier'));
      await tester.pumpAndSettle();

      await tester.tap(find.text('A - Z (commune)'));
      await tester.pumpAndSettle();

      expect(
        find.descendant(
          of: find.byType(ListTile).at(0),
          matching: find.text('Guilers'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(1),
          matching: find.text('La rivière'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(2),
          matching: find.text('Petit paradis'),
        ),
        findsOneWidget,
      );

      expect(
        find.descendant(
          of: find.byType(ListTile).at(3),
          matching: find.text('Plougastel Daoulas'),
        ),
        findsOneWidget,
      );
    });
  });
}
