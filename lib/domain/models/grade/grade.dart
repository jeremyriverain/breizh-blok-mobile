import 'package:freezed_annotation/freezed_annotation.dart';

part 'grade.freezed.dart';
part 'grade.g.dart';

@freezed
abstract class Grade with _$Grade {
  const factory Grade({
    @JsonKey(name: '@id') required String iri,
    required String name,
  }) = _Grade;

  factory Grade.fromJson(Map<String, Object?> json) => _$GradeFromJson(json);
}
