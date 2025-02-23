import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'department.freezed.dart';
part 'department.g.dart';

@freezed
abstract class Department with _$Department {
  const factory Department({
    @JsonKey(name: '@id') required String iri,
    required String name,
    @Default(<Municipality>[]) List<Municipality> municipalities,
  }) = _Department;

  factory Department.fromJson(Map<String, Object?> json) =>
      _$DepartmentFromJson(
        json,
      );
}
