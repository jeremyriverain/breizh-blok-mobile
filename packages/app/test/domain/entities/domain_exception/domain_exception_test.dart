import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/violation/violation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DomainException', () {
    group('UnprocessableEntityException', () {
      test('fromJson', () {
        expect(
          UnprocessableEntityException.fromJson(const {
            'violations': [
              {
                'propertyPath': 'foo',
                'message': 'bar',
              },
            ],
          }),
          equals(
            const UnprocessableEntityException(
              violations: [Violation(propertyPath: 'foo', message: 'bar')],
            ),
          ),
        );

        expect(
          UnprocessableEntityException.fromJson(const {}),
          equals(
            const UnprocessableEntityException(),
          ),
        );
      });

      test('findViolation', () {
        expect(
          const UnprocessableEntityException(
            violations: [Violation(propertyPath: 'foo', message: 'bar')],
          ).findViolation(propertyPath: 'foo'),
          equals(const Violation(propertyPath: 'foo', message: 'bar')),
        );

        expect(
          const UnprocessableEntityException().findViolation(
            propertyPath: 'foo',
          ),
          isNull,
        );
      });
    });
  });
}
