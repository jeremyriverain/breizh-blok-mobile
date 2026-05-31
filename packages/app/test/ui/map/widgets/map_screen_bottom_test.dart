import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_geo_point_repository.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen_bottom.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen_error_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  late BoulderGeoPointRepository repository;

  setUp(() {
    repository = MockBoulderGeoPointRepository();
  });
  group('MapScreenBottom', () {
    testWidgets('display nothing when async data', (tester) async {
      when(() => repository.findAll()).thenReturn(TaskEither.right(null));
      await tester.myPumpWidget(
        widget: const MapScreenBottom(),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );
      await tester.pump();
      final sizedBox = tester.widget<SizedBox>(find.byType(SizedBox));
      expect(sizedBox.height, equals(0));
      expect(sizedBox.width, equals(0));

      verify(() => repository.findAll()).called(1);
      verifyNoMoreInteractions(repository);
    });

    testWidgets('display circular progress indicator while fetching data', (
      tester,
    ) async {
      when(() => repository.findAll()).thenReturn(TaskEither.right(null));
      await tester.myPumpWidget(
        widget: const MapScreenBottom(),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      verify(() => repository.findAll()).called(1);
      verifyNoMoreInteractions(repository);
    });

    testWidgets('display MapScreenErrorBanner if error', (
      tester,
    ) async {
      when(
        () => repository.findAll(),
      ).thenReturn(
        TaskEither.left(const UnknownException(message: 'foo')),
      );
      await tester.myPumpWidget(
        widget: const MapScreenBottom(),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );

      await tester.pump();

      verify(() => repository.findAll()).called(1);
      verifyNoMoreInteractions(repository);

      expect(find.byType(MapScreenErrorBanner), findsOneWidget);
    });

    testWidgets('display MapScreenErrorBanner if error', (
      tester,
    ) async {
      when(
        () => repository.findAll(),
      ).thenThrow(
        Exception('foo'),
      );
      await tester.myPumpWidget(
        widget: const MapScreenBottom(),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );

      await tester.pumpAndSettle();

      verify(() => repository.findAll()).called(1);
      verifyNoMoreInteractions(repository);

      expect(find.byType(MapScreenErrorBanner), findsOneWidget);
    });

    testWidgets('Given MapScreenErrorBanner is displayed '
        'When I click on the close icon '
        'Then MapScreenErrorBanner disappears', (
      tester,
    ) async {
      when(
        () => repository.findAll(),
      ).thenThrow(
        Exception('foo'),
      );
      await tester.myPumpWidget(
        widget: const MapScreenBottom(),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );

      await tester.pumpAndSettle();

      verify(() => repository.findAll()).called(1);
      verifyNoMoreInteractions(repository);

      expect(find.byType(MapScreenErrorBanner), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(find.byType(MapScreenErrorBanner), findsNothing);
    });
  });
}
