// ignore_for_file: prefer_single_quotes

import 'package:breizh_blok_mobile/domain/entities/boulder_geo_point/boulder_geo_point.dart';
import 'package:flutter_test/flutter_test.dart';

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

    test('toGeojson', () {
      const boulderMarker = BoulderGeoPoint(id: 1, lat: 2, lng: 3, areaId: 4);

      expect(boulderMarker.toGeojson(), {
        'type': 'Feature',
        'properties': {'id': 1, 'areaId': 4},
        'geometry': {
          'type': 'Point',
          'coordinates': [3.0, 2.0, 0.0],
        },
      });
    });
  });
}
