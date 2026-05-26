import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/mapbox_map_extension.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  group('showClusters', () {
    late MapboxMap mapboxMap;
    late StyleManager styleManager;

    setUp(() {
      mapboxMap = MockMapboxMap();
      styleManager = MockStyleManager();
    });

    setUpAll(() {
      registerFallbackValue(CircleLayer(id: 'foo', sourceId: 'bar'));
      registerFallbackValue(GeoJsonSource(id: 'foo'));
    });

    test(
      'add layers and style source even if removals throw exception',
      () async {
        when(() => mapboxMap.style).thenReturn(styleManager);
        when(
          () => styleManager.removeStyleLayer(any()),
        ).thenThrow(Exception());

        when(
          () => styleManager.removeStyleSource('foo'),
        ).thenThrow(Exception());

        when(
          () => styleManager.addStyleSource(any(), any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.addStyleLayer(any(), any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.setStyleSourceProperties('foo', any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.setStyleSourceProperty(any(), any(), any()),
        ).thenAnswer((_) async => {});

        final result = await showClusters(
          mapboxMap: mapboxMap,
          features: [
            Feature(id: 2, geometry: Point(coordinates: Position(45, 7))),
          ],
          geoJsonSourceId: 'foo',
        ).run();

        verify(() => styleManager.removeStyleLayer(any())).called(3);
        verify(() => styleManager.removeStyleSource(any())).called(1);

        verify(() => styleManager.addStyleSource('foo', any())).called(1);

        verify(() => styleManager.addStyleLayer(any(), any())).called(3);

        expect(result.isRight(), isTrue);
      },
    );

    test(
      'is left if adding source throws exception',
      () async {
        when(() => mapboxMap.style).thenReturn(styleManager);
        when(
          () => styleManager.removeStyleLayer(any()),
        ).thenThrow(Exception());

        when(
          () => styleManager.removeStyleSource('foo'),
        ).thenThrow(Exception());

        when(
          () => styleManager.addStyleSource(any(), any()),
        ).thenThrow(Exception('foo'));

        when(
          () => styleManager.addStyleLayer(any(), any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.setStyleSourceProperties('foo', any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.setStyleSourceProperty(any(), any(), any()),
        ).thenAnswer((_) async => {});

        final result = await showClusters(
          mapboxMap: mapboxMap,
          features: [
            Feature(id: 2, geometry: Point(coordinates: Position(45, 7))),
          ],
          geoJsonSourceId: 'foo',
        ).run();

        verify(() => styleManager.removeStyleLayer(any())).called(3);
        verify(() => styleManager.removeStyleSource(any())).called(1);

        verify(() => styleManager.addStyleSource('foo', any())).called(1);

        verify(() => styleManager.addStyleLayer(any(), any())).called(3);

        expect(result.isLeft(), isTrue);
        expect(
          result.getLeft().toNullable(),
          isA<UnknownException>().having(
            (e) => e.message,
            'message',
            equals('Exception: foo'),
          ),
        );
      },
    );

    test(
      'is left if adding layers throws exception',
      () async {
        when(() => mapboxMap.style).thenReturn(styleManager);
        when(
          () => styleManager.removeStyleLayer(any()),
        ).thenThrow(Exception());

        when(
          () => styleManager.removeStyleSource('foo'),
        ).thenThrow(Exception());

        when(
          () => styleManager.addStyleSource(any(), any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.addStyleLayer(any(), any()),
        ).thenThrow(Exception('foo'));

        when(
          () => styleManager.setStyleSourceProperties('foo', any()),
        ).thenAnswer((_) async => {});

        when(
          () => styleManager.setStyleSourceProperty(any(), any(), any()),
        ).thenAnswer((_) async => {});

        final result = await showClusters(
          mapboxMap: mapboxMap,
          features: [
            Feature(id: 2, geometry: Point(coordinates: Position(45, 7))),
          ],
          geoJsonSourceId: 'foo',
        ).run();

        verify(() => styleManager.removeStyleLayer(any())).called(3);
        verify(() => styleManager.removeStyleSource(any())).called(1);

        verify(() => styleManager.addStyleSource('foo', any())).called(1);

        verify(() => styleManager.addStyleLayer(any(), any())).called(3);

        expect(result.isLeft(), isTrue);
        expect(
          result.getLeft().toNullable(),
          isA<UnknownException>().having(
            (e) => e.message,
            'message',
            equals('Exception: foo'),
          ),
        );
      },
    );
  });
}
