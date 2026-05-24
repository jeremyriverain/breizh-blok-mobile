import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/rock_marker/rock_marker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

void main() {
  group('BoulderMarker', () {
    test('fromJson', () {
      final boulderMarker = BoulderMarker.fromJson(const {
        'id': 1,
        'rock': {
          'location': {'latitude': '4', 'longitude': '2'},
        },
      });
      expect(boulderMarker.id, equals(1));
      expect(
        boulderMarker.rock.location,
        const Location(latitude: 4, longitude: 2),
      );
    });

    test('toFeature', () {
      const boulderMarker = BoulderMarker(
        id: 1,
        rock: RockMarker(location: Location(latitude: 2, longitude: 3)),
      );

      expect(
        boulderMarker.toFeature().id,
        equals(1),
      );

      expect(
        boulderMarker.toFeature().properties,
        equals({'id': 1}),
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
