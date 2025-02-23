import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

part 'location.freezed.dart';
part 'location.g.dart';

const kDefaultInitialPosition = LatLng(
  48.066152,
  -2.967056,
);

@freezed
abstract class Location with _$Location {
  const factory Location({
    @JsonKey(fromJson: double.parse) required double latitude,
    @JsonKey(fromJson: double.parse) required double longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}
