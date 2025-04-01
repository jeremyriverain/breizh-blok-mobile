import 'package:breizh_blok_mobile/domain/models/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
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
  });
}
