import 'package:freezed_annotation/freezed_annotation.dart';

part 'height_boulder.freezed.dart';
part 'height_boulder.g.dart';

@freezed
abstract class HeightBoulder with _$HeightBoulder {
  const factory HeightBoulder({
    @JsonKey(name: '@id') required String iri,
    required int min,
    int? max,
  }) = _HeightBoulder;

  factory HeightBoulder.fromJson(Map<String, Object?> json) =>
      _$HeightBoulderFromJson(json);
}
