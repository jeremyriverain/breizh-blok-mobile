import 'package:breizh_blok_mobile/domain/entities/rock_marker/rock_marker.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

part 'boulder_marker.freezed.dart';
part 'boulder_marker.g.dart';

@freezed
abstract class BoulderMarker with _$BoulderMarker {
  const factory BoulderMarker({required int id, required RockMarker rock}) =
      _BoulderMarker;

  const BoulderMarker._();

  factory BoulderMarker.fromJson(Map<String, Object?> json) =>
      _$BoulderMarkerFromJson(json);

  Feature toFeature() {
    return Feature(
      id: id,
      properties: {'id': id},
      geometry: Point(
        coordinates: Position(rock.location.longitude, rock.location.latitude),
      ),
    );
  }
}
