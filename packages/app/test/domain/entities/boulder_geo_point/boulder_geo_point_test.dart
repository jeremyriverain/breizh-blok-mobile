// ignore_for_file: prefer_single_quotes

import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

void main() {
  group('BoulderGeoPoint', () {
    group('fromJson', () {
      test('fromJson yield BoulderGeoPoint', () {
        expect(
          BoulderGeoPoint.fromJson({
            "id": 2,
            "lat": "48.673149748436",
            "lng": "-4.3580819451625",
            "areaId": 1,
          }),
          equals(
            const BoulderGeoPoint(
              id: 2,
              lat: 48.673149748436,
              lng: -4.3580819451625,
              areaId: 1,
            ),
          ),
        );
      });
    });

    test('toFeature', () {
      const boulderMarker = BoulderGeoPoint(id: 1, lat: 2, lng: 3, areaId: 4);

      expect(
        boulderMarker.toFeature().id,
        equals(1),
      );

      expect(
        boulderMarker.toFeature().properties,
        equals({'id': 1, 'areaId': 4}),
      );

      expect(
        boulderMarker.toFeature().geometry,
        isA<Point>().having((p) => p.coordinates.lat, 'lat', 2),
      );

      expect(
        boulderMarker.toFeature().geometry,
        isA<Point>().having((p) => p.coordinates.lng, 'lng', 3),
      );
    });
  });
}
