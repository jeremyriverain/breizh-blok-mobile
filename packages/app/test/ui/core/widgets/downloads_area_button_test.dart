import 'dart:async';

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/services/local/download_area_service.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:breizh_blok_mobile/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/downloads_area_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  late AppDatabase appDatabase;
  late ApiClient apiClient;
  late ImageBoulderCache imageBoulderCache;

  setUp(() {
    appDatabase = MockAppDatabase();
    apiClient = MockApiClient();
    imageBoulderCache = MockImageBoulderCache();
  });

  testWidgets('displays status download information', (
    WidgetTester tester,
  ) async {
    final streamController = StreamController<DbBoulderArea?>();

    final downloadAreaService = DownloadAreaService(
      database: appDatabase,
      httpClient: apiClient,
      imageBoulderCache: imageBoulderCache,
    );

    when(
      () => appDatabase.watchDownload('/foo'),
    ).thenAnswer((_) => streamController.stream);

    streamController.add(null);

    await tester.runAsync(() async {
      await tester.myPumpWidget(
        overrides: [appDatabaseProvider.overrideWith((_) => appDatabase)],
        widget: MultiRepositoryProvider(
          providers: [
            RepositoryProvider(create: (context) => downloadAreaService),
          ],
          child: const DownloadsAreaButton(
            boulderArea: BoulderArea(
              iri: '/foo',
              name: 'foo',
              municipality: Municipality(
                iri: '/bar',
                name: 'bar',
                centroid: Location(latitude: 0, longitude: 0),
              ),
            ),
          ),
        ),
      );
      await tester.idle();

      await tester.pump(Duration.zero);

      verify(() => appDatabase.watchDownload('/foo'));
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

    expect(find.byType(CircularProgressIndicator), findsOneWidget);

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
