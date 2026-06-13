import 'dart:async';

import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/available_maps_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('AvailableMapsSheet', () {
    late MapLauncher mapLauncher;
    late AvailableMap map;

    setUp(() {
      mapLauncher = MockMapLauncher();
      map = MockAvailableMap();
    });
    testWidgets('displays circular progress indicator while loading maps', (
      tester,
    ) async {
      await tester.myPumpWidget(
        widget: AvailableMapsSheet(onMapSelected: ({required map}) => {}),
      );

      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('when there is no available maps', (tester) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer((_) => TaskEither.right([]));

      await tester.myPumpWidget(
        widget: AvailableMapsSheet(onMapSelected: ({required map}) => {}),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      expect(
        find.text(
          'Aucune application de cartographie '
          "n'a été détectée sur votre appareil.",
        ),
        findsOneWidget,
      );

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);
    });

    testWidgets('when there is available maps', (tester) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer((_) => TaskEither.right([map]));

      when(() => map.icon).thenReturn('foo');
      when(() => map.name).thenReturn('bar');

      await tester.myPumpWidget(
        widget: AvailableMapsSheet(onMapSelected: ({required map}) => {}),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      expect(
        find.text('bar'),
        findsOneWidget,
      );

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);
    });

    testWidgets('onMapSelected callback is invoked when I click on a map', (
      tester,
    ) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer((_) => TaskEither.right([map]));

      when(() => map.icon).thenReturn('foo');
      when(() => map.name).thenReturn('bar');

      final completer = Completer<String>();

      await tester.myPumpWidget(
        widget: AvailableMapsSheet(
          onMapSelected: ({required map}) => completer.complete(map.name),
        ),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      expect(
        find.text('bar'),
        findsOneWidget,
      );

      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);

      await tester.tap(find.text('bar'));
      await tester.pump();

      expect(completer.isCompleted, isTrue);

      expect(await completer.future, equals('bar'));
    });

    testWidgets('when error while loading maps', (tester) async {
      when(
        () => mapLauncher.availableMaps,
      ).thenAnswer(
        (_) => TaskEither.left(
          const MapLauncherException.unknwown(message: 'foo'),
        ),
      );

      await tester.myPumpWidget(
        widget: AvailableMapsSheet(onMapSelected: ({required map}) => {}),
        overrides: [mapLauncherProvider.overrideWith((_) => mapLauncher)],
      );

      await tester.pump();

      expect(find.text('Une erreur est survenue'), findsOneWidget);
      verify(
        () => mapLauncher.availableMaps,
      ).called(1);

      verifyNoMoreInteractions(mapLauncher);
    });
  });
}
