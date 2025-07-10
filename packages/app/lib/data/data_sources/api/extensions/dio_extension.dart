import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:dio/dio.dart';

extension DioExceptionExt on DioException {
  DomainException get convertToDomainException {
    final statusCode = response?.statusCode;

    switch (statusCode) {
      case 422:
        return const UnprocessableEntityException();
      default:
        return UnknownException(
          message: '$statusCode on ${requestOptions.path}',
        );
    }
  }
}
