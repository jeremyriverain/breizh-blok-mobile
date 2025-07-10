import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'rock_marker.freezed.dart';
part 'rock_marker.g.dart';

@freezed
abstract class RockMarker with _$RockMarker {
  const factory RockMarker({required Location location}) = _RockMarker;

  const RockMarker._();

  factory RockMarker.fromJson(Map<String, Object?> json) =>
      _$RockMarkerFromJson(json);
}
