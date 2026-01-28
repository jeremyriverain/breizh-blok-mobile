import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

part 'location.g.dart';

const kDefaultLatitude = 48.066152;
const kDefaultLongitude = -2.967056;

@freezed
abstract class Location with _$Location {
  const factory Location({
    @JsonKey(fromJson: double.parse, toJson: _toString)
    required double latitude,
    @JsonKey(fromJson: double.parse, toJson: _toString)
    required double longitude,
  }) = _Location;

  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);
}

String _toString(double value) => value.toString();
