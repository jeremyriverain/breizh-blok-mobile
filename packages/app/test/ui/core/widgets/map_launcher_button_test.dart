import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/service_locator/map_launcher.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/available_maps_sheet.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_launcher_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('MapLauncherButton', () {
    late AvailableMap map;
    late MapLauncher mapLauncher;

    setUp(() {
      map = MockAvailableMap();
      mapLauncher = MockMapLauncher();
    });

    testWidgets('nothing displays when there is no map', (tester) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer((_) => TaskEither.right([]));
      await tester.myPumpWidget(
        widget: const MapLauncherButton(
          destination: Location(latitude: 1, longitude: 2),
          destinationTitle: 'foo',
        ),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);

      final box = tester.widget<SizedBox>(find.byType(SizedBox));

      expect(box.height, equals(0));
      expect(box.width, equals(0));
    });

    testWidgets('nothing displays when there is no map', (tester) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer(
        (_) => TaskEither.left(
          const MapLauncherException.unknwown(message: 'foo'),
        ),
      );
      await tester.myPumpWidget(
        widget: const MapLauncherButton(
          destination: Location(latitude: 1, longitude: 2),
          destinationTitle: 'foo',
        ),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);

      final box = tester.widget<SizedBox>(find.byType(SizedBox));

      expect(box.height, equals(0));
      expect(box.width, equals(0));
    });

    testWidgets('nothing displays when provider throws', (tester) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenThrow(Exception('foo'));
      await tester.myPumpWidget(
        widget: const MapLauncherButton(
          destination: Location(latitude: 1, longitude: 2),
          destinationTitle: 'foo',
        ),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);

      final box = tester.widget<SizedBox>(find.byType(SizedBox));

      expect(box.height, equals(0));
      expect(box.width, equals(0));
    });

    testWidgets('displays button when there is map', (tester) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer((_) => TaskEither.right([map]));

      await tester.myPumpWidget(
        widget: const MapLauncherButton(
          destination: Location(latitude: 1, longitude: 2),
          destinationTitle: 'foo',
        ),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);

      expect(find.widgetWithText(FilledButton, 'Itinéraire'), findsOneWidget);
    });

    testWidgets('open AvailableMapsSheet when I click on the button', (
      tester,
    ) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer((_) => TaskEither.right([map]));

      when(() => map.name).thenReturn('foo');
      when(() => map.icon).thenReturn('bar');

      await tester.myPumpWidget(
        widget: const MapLauncherButton(
          destination: Location(latitude: 1, longitude: 2),
          destinationTitle: 'foo',
        ),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);
      expect(find.byType(AvailableMapsSheet), findsNothing);

      await tester.tap(find.widgetWithText(FilledButton, 'Itinéraire'));
      await tester.pump();

      expect(find.byType(AvailableMapsSheet), findsOneWidget);
    });
  });
}
