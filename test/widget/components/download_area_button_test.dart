import 'dart:async';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/components/download_area_button.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/download_area_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([MockSpec<AppHttpClient>(), MockSpec<AppDatabase>()])
import './download_area_button_test.mocks.dart';

void main() {
  testWidgets('displays status download information',
      (WidgetTester tester) async {
    final streamController = StreamController<BoulderArea?>();

    final database = MockAppDatabase();
    final downloadAreaService = DownloadAreaService(
      database: database,
      httpClient: MockAppHttpClient(),
    );

    when(
      database.watchDownload('/foo'),
    ).thenAnswer(
      (_) => streamController.stream,
    );

    streamController.add(null);

    await tester.runAsync(() async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MultiRepositoryProvider(
              providers: [
                RepositoryProvider(
                  // ignore: unnecessary_cast
                  create: (context) => database as AppDatabase,
                ),
                RepositoryProvider(
                  create: (context) => downloadAreaService,
                ),
              ],
              child: const DownloadAreaButton(
                boulderAreaIri: '/foo',
              ),
            ),
          ),
        ),
      );
      await tester.idle();

      await tester.pump(Duration.zero);

      verify(database.watchDownload('/foo'));
      expect(find.text('TÉLÉCHARGER'), findsOneWidget);
    });

    streamController.add(
      const BoulderArea(
        iri: '/foo',
        isDownloaded: false,
      ),
    );

    await tester.pump(Duration.zero);

    expect(
      find.text('TÉLÉCHARGEMENT EN COURS'),
      findsOneWidget,
    );

    streamController.add(
      const BoulderArea(
        iri: '/foo',
        isDownloaded: true,
      ),
    );

    await tester.pump(Duration.zero);

    expect(find.text('TÉLÉCHARGÉ'), findsOneWidget);
  });
}
