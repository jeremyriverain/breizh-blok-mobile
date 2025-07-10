import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_exception.freezed.dart';

@freezed
sealed class DomainException with _$DomainException implements Exception {
  const DomainException._();

  const factory DomainException.unknwown({required String message}) =
      UnknownException;

  const factory DomainException.unprocessableEntity() =
      UnprocessableEntityException;
}
