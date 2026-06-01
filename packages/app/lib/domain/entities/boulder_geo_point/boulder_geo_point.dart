import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

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

  Feature toFeature() {
    return Feature(
      id: id,
      properties: {'id': id, 'areaId': areaId},
      geometry: Point(
        coordinates: Position(lng, lat),
      ),
    );
  }
}

String _toString(double value) => value.toString();
