import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/entities/height_boulder/height_boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/line_boulder/line_boulder.dart';
import 'package:breizh_blok_mobile/domain/entities/rock/rock.dart';
import 'package:breizh_blok_mobile/domain/entities/video_link/video_link.dart';
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
    @Default(<VideoLink>[]) List<VideoLink> videoLinks,
  }) = _Boulder;

  const Boulder._();

  factory Boulder.fromJson(Map<String, Object?> json) =>
      _$BoulderFromJson(json);

  String get id => iri.replaceAll('/boulders/', '');
}
