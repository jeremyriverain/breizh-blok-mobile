import 'package:breizh_blok_mobile/domain/entities/violation/violation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Violation', () {
    test('fromJson', () {
      final violation = Violation.fromJson(const {
        'propertyPath': 'foo',
        'message': 'bar',
      });
      expect(
        violation,
        equals(const Violation(propertyPath: 'foo', message: 'bar')),
      );
    });
  });
}
