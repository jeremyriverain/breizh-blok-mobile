import 'package:breizh_blok_mobile/domain/models/height_boulder.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('HeightBoulder', () {
    test('fromJson - max null', () {
      final height = HeightBoulder.fromJson(const {
        '@id': 'foo',
        'min': 0,
        'max': null,
      });
      expect(height.iri, 'foo');
      expect(height.min, 0);
      expect(height.max, isNull);
    });

    test('fromJson - max not null', () {
      final height = HeightBoulder.fromJson(const {
        '@id': 'foo',
        'min': 0,
        'max': 1,
      });
      expect(height.iri, 'foo');
      expect(height.min, 0);
      expect(height.max, 1);
    });
  });
}
