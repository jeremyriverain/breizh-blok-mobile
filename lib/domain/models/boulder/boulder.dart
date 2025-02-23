import 'package:breizh_blok_mobile/domain/models/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/models/height_boulder/height_boulder.dart';
import 'package:breizh_blok_mobile/domain/models/line_boulder/line_boulder.dart';
import 'package:breizh_blok_mobile/domain/models/rock/rock.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder.freezed.dart';
part 'boulder.g.dart';

@freezed
abstract class Boulder with _$Boulder {
  const factory Boulder({
    @JsonKey(name: '@id') required String iri,
    required String name,
    required Rock rock,
    @Default(<LineBoulder>[]) List<LineBoulder> lineBoulders,
    Grade? grade,
    String? description,
    HeightBoulder? height,
  }) = _Boulder;

  const Boulder._();

  factory Boulder.fromJson(Map<String, Object?> json) =>
      _$BoulderFromJson(json);

  String get id => iri.replaceAll('/boulders/', '');
}
