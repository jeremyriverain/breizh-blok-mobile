import 'package:breizh_blok_mobile/data/data_sources/api/extensions/dio_extension.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/violation/violation.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DioExtension', () {
    test('convertToDomainException', () {
      expect(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(statusCode: 403, requestOptions: RequestOptions()),
        ).convertToDomainException,
        isA<UnknownException>(),
      );

      expect(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(statusCode: 422, requestOptions: RequestOptions()),
        ).convertToDomainException,
        equals(const UnprocessableEntityException()),
      );

      expect(
        DioException(
          requestOptions: RequestOptions(),
          response: Response(
            statusCode: 422,
            requestOptions: RequestOptions(),
            data: {
              'violations': [
                {'propertyPath': 'foo', 'message': 'bar'},
              ],
            },
          ),
        ).convertToDomainException,
        equals(
          const UnprocessableEntityException(
            violations: [Violation(propertyPath: 'foo', message: 'bar')],
          ),
        ),
      );
    });
  });
}
