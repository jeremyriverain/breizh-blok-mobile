import 'package:freezed_annotation/freezed_annotation.dart';

part 'violation.freezed.dart';

part 'violation.g.dart';

@freezed
abstract class Violation with _$Violation {
  const factory Violation({
    required String propertyPath,
    required String message,
  }) = _Violation;

  const Violation._();

  factory Violation.fromJson(Map<String, Object?> json) =>
      _$ViolationFromJson(json);
}
