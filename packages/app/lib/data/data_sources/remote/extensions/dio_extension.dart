import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';

extension DioExceptionExt on DioException {
  DomainException get convertToDomainException {
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 422:
        final data = response?.data;
        if (data is Map<String, dynamic>) {
          return UnprocessableEntityException.fromJson(data);
        } else {
          return const UnprocessableEntityException();
        }
      default:
        return UnknownException(
          message:
              'status code: $statusCode, '
              // ignore: lines_longer_than_80_chars
              'path: ${requestOptions.path.isEmpty ? 'null' : requestOptions.path}',
        );
    }
  }
}
