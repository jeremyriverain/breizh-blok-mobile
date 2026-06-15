import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_geo_point_repository.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_map_bottom.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_error_banner.dart';
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

  const areaId = 1;
  group('MapScreenBottom', () {
    testWidgets('display nothing when async data', (tester) async {
      when(
        () => repository.findByArea(areaId),
      ).thenReturn(TaskEither.right(null));
      await tester.myPumpWidget(
        widget: const BoulderAreaDetailsMapBottom(
          areaId: areaId,
          child: SizedBox(
            key: ValueKey('foo'),
          ),
        ),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );
      await tester.pump();
      expect(find.byKey(const ValueKey('foo')), findsOneWidget);

      verify(() => repository.findByArea(areaId)).called(1);
      verifyNoMoreInteractions(repository);
    });

    testWidgets('display circular progress indicator while fetching data', (
      tester,
    ) async {
      when(
        () => repository.findByArea(areaId),
      ).thenReturn(TaskEither.right(null));
      await tester.myPumpWidget(
        widget: const BoulderAreaDetailsMapBottom(
          areaId: areaId,
          child: SizedBox(
            key: ValueKey('foo'),
          ),
        ),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );
      expect(find.byType(CircularProgressIndicator), findsOneWidget);

      verify(() => repository.findByArea(areaId)).called(1);
      verifyNoMoreInteractions(repository);
    });

    testWidgets('display MapErrorBanner if error', (
      tester,
    ) async {
      when(
        () => repository.findByArea(areaId),
      ).thenReturn(
        TaskEither.left(const UnknownException(message: 'foo')),
      );
      await tester.myPumpWidget(
        widget: const BoulderAreaDetailsMapBottom(
          areaId: areaId,
          child: SizedBox(
            key: ValueKey('foo'),
          ),
        ),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );

      await tester.pump();

      verify(() => repository.findByArea(areaId)).called(1);
      verifyNoMoreInteractions(repository);

      expect(find.byType(MapErrorBanner), findsOneWidget);
    });

    testWidgets('display MapErrorBanner if error', (
      tester,
    ) async {
      when(
        () => repository.findByArea(areaId),
      ).thenThrow(
        Exception('foo'),
      );
      await tester.myPumpWidget(
        widget: const BoulderAreaDetailsMapBottom(
          areaId: areaId,
          child: SizedBox(
            key: ValueKey('foo'),
          ),
        ),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );

      await tester.pumpAndSettle();

      verify(() => repository.findByArea(areaId)).called(1);
      verifyNoMoreInteractions(repository);

      expect(find.byType(MapErrorBanner), findsOneWidget);
    });

    testWidgets('Given MapErrorBanner is displayed '
        'When I click on the close icon '
        'Then MapScreenErrorBanner disappears', (
      tester,
    ) async {
      when(
        () => repository.findByArea(areaId),
      ).thenThrow(
        Exception('foo'),
      );
      await tester.myPumpWidget(
        widget: const BoulderAreaDetailsMapBottom(
          areaId: areaId,
          child: SizedBox(
            key: ValueKey('foo'),
          ),
        ),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) => repository),
        ],
      );

      await tester.pumpAndSettle();

      verify(() => repository.findByArea(areaId)).called(1);
      verifyNoMoreInteractions(repository);

      expect(find.byType(MapErrorBanner), findsOneWidget);

      await tester.tap(find.byIcon(Icons.close));
      await tester.pump();

      expect(find.byType(MapErrorBanner), findsNothing);
    });

    testWidgets('Given MapErrorBanner is displayed '
        'When I click on the try again button '
        'Then the repository is called again', (
      tester,
    ) async {
      var called = 0;
      when(
        () => repository.findByArea(areaId),
      ).thenAnswer((_) {
        called++;
        throw Exception('foo');
      });

      await tester.myPumpWidget(
        widget: const BoulderAreaDetailsMapBottom(
          areaId: areaId,
          child: SizedBox(
            key: ValueKey('foo'),
          ),
        ),
        overrides: [
          boulderGeoPointRepositoryProvider.overrideWith((_) {
            return repository;
          }),
        ],
      );

      await tester.pumpAndSettle();

      verify(() => repository.findByArea(areaId)).called(1);
      verifyNoMoreInteractions(repository);

      expect(find.byType(MapErrorBanner), findsOneWidget);
      expect(called, equals(1));

      await tester.tap(find.text('Essayer à nouveau'));
      await tester.pump();
      expect(called, equals(2));
    });
  });
}
