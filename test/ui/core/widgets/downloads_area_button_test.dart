import 'dart:async';

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/services/local/download_area_service.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location.dart';
import 'package:breizh_blok_mobile/domain/models/municipality.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/downloads_area_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<ApiClient>(),
  MockSpec<AppDatabase>(),
  MockSpec<ImageBoulderCache>(),
])
import 'downloads_area_button_test.mocks.dart';

void main() {
  testWidgets('displays status download information',
      (WidgetTester tester) async {
    final streamController = StreamController<DbBoulderArea?>();

    final database = MockAppDatabase();
    final downloadAreaService = DownloadAreaService(
      database: database,
      httpClient: MockApiClient(),
      imageBoulderCache: MockImageBoulderCache(),
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
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          locale: const Locale('fr'),
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
              child: DownloadsAreaButton(
                boulderArea: BoulderArea(
                  iri: '/foo',
                  name: 'foo',
                  municipality: Municipality(
                    iri: '/bar',
                    name: 'bar',
                    boulderAreas: const <BoulderArea>[],
                    centroid: Location(latitude: 0, longitude: 0),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
      await tester.idle();

      await tester.pump(Duration.zero);

      verify(database.watchDownload('/foo'));
      expect(find.text('TÉLÉCHARGER'), findsOneWidget);
      expect(find.byKey(const Key('area_downloaded')), findsNothing);
    });

    streamController.add(
      DbBoulderArea(
        iri: '/foo',
        downloadProgress: 0,
        downloadedAt: DateTime.now(),
      ),
    );

    await tester.pump(Duration.zero);

    expect(
      find.byType(CircularProgressIndicator),
      findsOneWidget,
    );

    streamController.add(
      DbBoulderArea(
        iri: '/foo',
        downloadProgress: 100,
        downloadedAt: DateTime.now(),
      ),
    );

    await tester.pump(Duration.zero);

    expect(find.byKey(const Key('area_downloaded')), findsOneWidget);
  });
}
