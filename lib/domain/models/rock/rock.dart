import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock.freezed.dart';
part 'rock.g.dart';

@freezed
abstract class Rock with _$Rock {
  const factory Rock({
    @JsonKey(name: '@id') required String iri,
    required BoulderArea boulderArea,
    required Location location,
  }) = _Rock;

  const Rock._();

  factory Rock.fromJson(Map<String, Object?> json) => _$RockFromJson(json);

  String get id => iri.replaceAll('/rocks/', '');
}
