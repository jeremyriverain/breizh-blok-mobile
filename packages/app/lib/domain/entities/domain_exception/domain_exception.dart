import 'package:breizh_blok_mobile/domain/entities/violation/violation.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'domain_exception.freezed.dart';

part 'domain_exception.g.dart';

@freezed
sealed class DomainException with _$DomainException implements Exception {
  const DomainException._();

  const factory DomainException.unknown({required String message}) =
      UnknownException;

  const factory DomainException.unprocessableEntity({
    @Default(<Violation>[]) List<Violation> violations,
  }) = UnprocessableEntityException;

  factory DomainException.fromJson(Map<String, Object?> json) =>
      _$DomainExceptionFromJson(json);
}

extension UnprocessableEntityExceptionExtension
    on UnprocessableEntityException {
  Violation? findViolation({required String propertyPath}) {
    return violations.firstWhereOrNull((v) => v.propertyPath == propertyPath);
  }
}
