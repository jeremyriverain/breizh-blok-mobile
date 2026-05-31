import 'dart:ui';

import 'package:breizh_blok_mobile/domain/repositories/boulder_geo_point_repository.dart';
import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../database_utils.dart';
import '../../../mocks.dart';
import '../../../test_utils.dart';

void main() {
  group('MapScreenViewModel', () {
    late BoulderGeoPointRepository repository;
    late MapboxMap mapboxMap;
    late StyleManager styleManager;

    setUp(() {
      repository = MockBoulderGeoPointRepository();
      mapboxMap = MockMapboxMap();
      styleManager = MockStyleManager();
    });

    setUpAll(() {
      registerFallbackValue(MockMapboxMap());
    });

    test('default state', () {
      final container = ProviderContainer.test(
        overrides: [
          authProvider.overrideWith((_) => MockAuth()),
          sharedPreferencesProvider.overrideWith(
            (_) => MockSharedPreferences(),
          ),
          myLocaleProvider.overrideWithBuild((_, _) => const Locale('fr')),
          appDatabaseProvider.overrideWith((_) => createMemoryDatabase()),
        ],
      );
      expect(
        container.read(mapViewModelProvider),
        equals(
          const MapScreenState(
            initialized: false,
            boulderGeoPoints: [],
            mapboxMap: null,
          ),
        ),
      );
    });

    test('setMap', () async {
      final container = ProviderContainer.test(
        overrides: [
          authProvider.overrideWith((_) => MockAuth()),
          sharedPreferencesProvider.overrideWith(
            (_) => MockSharedPreferences(),
          ),
          myLocaleProvider.overrideWithBuild((_, _) => const Locale('fr')),
          appDatabaseProvider.overrideWith((_) => createMemoryDatabase()),
        ],
      );

      container.read(mapViewModelProvider.notifier).setMap(mapboxMap);

      expect(
        container.read(mapViewModelProvider).mapboxMap,
        isNotNull,
      );
    });

    test(
      'call showClusters when stream is initialized and map is not null',
      () async {
        when(
          () => repository.watchAll,
        ).thenAnswer((_) => Stream.value([fakeBoulderGeoPoint]));

        when(() => mapboxMap.style).thenReturn(styleManager);

        when(
          () => styleManager.removeStyleLayer(any()),
        ).thenThrow(Exception());

        when(
          () => styleManager.removeStyleSource('boulders'),
        ).thenThrow(Exception());

        when(
          () => styleManager.addStyleSource(any(), any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.addStyleLayer(any(), any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.setStyleSourceProperties('boulders', any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.setStyleSourceProperty(any(), any(), any()),
        ).thenAnswer((_) async => {});

        final container = ProviderContainer.test(
          overrides: [
            authProvider.overrideWith((_) => MockAuth()),
            sharedPreferencesProvider.overrideWith(
              (_) => MockSharedPreferences(),
            ),
            myLocaleProvider.overrideWithBuild((_, _) => const Locale('fr')),
            appDatabaseProvider.overrideWith((_) => createMemoryDatabase()),
            boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
          ],
        );

        final subscription = container.listen(
          mapViewModelProvider,
          (_, next) {},
        );

        expect(container.read(mapViewModelProvider).initialized, isFalse);

        container.read(mapViewModelProvider.notifier).setMap(mapboxMap);

        expect(
          container.read(mapViewModelProvider).mapboxMap,
          isNotNull,
        );

        await container.pump();

        verify(
          () => styleManager.removeStyleSource('boulders'),
        ).called(1);

        expect(container.read(mapViewModelProvider).initialized, isTrue);
        expect(
          container.read(mapViewModelProvider).boulderGeoPoints,
          equals([fakeBoulderGeoPoint]),
        );

        verify(
          () => repository.watchAll,
        ).called(1);

        verifyNoMoreInteractions(repository);

        subscription.close();
      },
    );
  });
}
