import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/views/download_view.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;

  testWidgets('display fallback content if there is no downloads',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: DownloadView(
          database: AppDatabase(
            NativeDatabase.memory(),
          ),
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.text('Aucun secteur téléchargé'), findsOneWidget);
  });

  testWidgets('display downloads', (WidgetTester tester) async {
    final database = AppDatabase(
      NativeDatabase.memory(),
    );

    await Future.wait(
      [
        database.into(database.dbBoulderAreas).insert(
              const DbBoulderArea(iri: '/foo', isDownloaded: true),
            ),
        database.into(database.dbRequests).insert(
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
            ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
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
}
