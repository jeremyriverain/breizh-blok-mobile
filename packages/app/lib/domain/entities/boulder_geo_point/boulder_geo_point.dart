import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_geo_point.freezed.dart';
part 'boulder_geo_point.g.dart';

@freezed
abstract class BoulderGeoPoint with _$BoulderGeoPoint {
  const factory BoulderGeoPoint({
    required int id,
    @JsonKey(fromJson: double.parse, toJson: _toString) required double lat,
    @JsonKey(fromJson: double.parse, toJson: _toString) required double lng,
    required int areaId,
  }) = _BoulderGeoPoint;

  const BoulderGeoPoint._();

  factory BoulderGeoPoint.fromJson(Map<String, Object?> json) =>
      _$BoulderGeoPointFromJson(json);

  Map<String, dynamic> toGeojson() {
    return {
      'type': 'Feature',
      'properties': {'id': id, 'areaId': areaId},
      'geometry': {
        'type': 'Point',
        'coordinates': [lng, lat, 0.0],
      },
    };
  }
}

String _toString(double value) => value.toString();
