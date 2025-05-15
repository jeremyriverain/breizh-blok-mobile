import 'package:breizh_blok_mobile/domain/models/grade/grade.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Grade', () {
    test('fromJson', () {
      final grade = Grade.fromJson(const {
        '@id': 'foo',
        'name': 'bar',
      });
      expect(grade.iri, 'foo');
      expect(grade.name, 'bar');
    });
  });
}
