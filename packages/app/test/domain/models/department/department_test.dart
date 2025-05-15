import 'package:breizh_blok_mobile/domain/models/department/department.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Department', () {
    test('fromJson', () {
      final department = Department.fromJson(const {
        '@id': '/departments/departmentId',
        'name': 'Morbihan',
        'municipalities': [],
      });
      expect(department.iri, equals('/departments/departmentId'));
      expect(department.name, equals('Morbihan'));
      expect(
        department.municipalities,
        equals(
          const <Municipality>[],
        ),
      );
    });
  });
}
