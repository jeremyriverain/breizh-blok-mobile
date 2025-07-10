import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:breizh_blok_mobile/domain/entities/rock_marker/rock_marker.dart';
import 'package:flutter_test/flutter_test.dart';

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

    test('toGeojson', () {
      const boulderMarker = BoulderMarker(
        id: 1,
        rock: RockMarker(location: Location(latitude: 2, longitude: 3)),
      );

      expect(boulderMarker.toGeojson(), {
        'type': 'Feature',
        'properties': {'id': 1},
        'geometry': {
          'type': 'Point',
          'coordinates': [3.0, 2.0, 0.0],
        },
      });
    });
  });
}
