import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Location', () {
    test('fromJson', () {
      final location = Location.fromJson(const {
        'latitude': '45.7',
        'longitude': '34',
      });
      expect(location.latitude, 45.7);
      expect(location.longitude, 34.0);
    });
  });
}
