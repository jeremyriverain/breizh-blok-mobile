import 'dart:ui';

import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../mocks.dart';

void main() {
  group('MapScreenViewModel', () {
    test('default state', () {
      final container = ProviderContainer.test(
        overrides: [
          authProvider.overrideWith((_) => MockAuth()),
          sharedPreferencesProvider.overrideWith(
            (_) => MockSharedPreferences(),
          ),
          myLocaleProvider.overrideWithBuild((_, _) => const Locale('fr')),
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
  });
}
