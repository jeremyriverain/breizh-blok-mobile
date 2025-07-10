import 'package:breizh_blok_mobile/domain/entities/image/image.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'line_boulder.freezed.dart';
part 'line_boulder.g.dart';

@freezed
abstract class LineBoulder with _$LineBoulder {
  const factory LineBoulder({
    @JsonKey(name: '@id') required String iri,
    required String smoothLine,
    required Image rockImage,
  }) = _LineBoulder;

  factory LineBoulder.fromJson(Map<String, Object?> json) =>
      _$LineBoulderFromJson(json);
}
