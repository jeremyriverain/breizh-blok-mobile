import 'package:breizh_blok_mobile/domain/models/rock_marker/rock_marker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_marker.freezed.dart';
part 'boulder_marker.g.dart';

@freezed
abstract class BoulderMarker with _$BoulderMarker {
  const factory BoulderMarker({required int id, required RockMarker rock}) =
      _BoulderMarker;

  const BoulderMarker._();

  factory BoulderMarker.fromJson(Map<String, Object?> json) =>
      _$BoulderMarkerFromJson(json);
}
