import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'municipality.freezed.dart';
part 'municipality.g.dart';

@freezed
abstract class Municipality with _$Municipality {
  const factory Municipality({
    @JsonKey(name: '@id') required String iri,
    required String name,
    @Default(<BoulderArea>[]) List<BoulderArea> boulderAreas,
    Location? centroid,
  }) = _Municipality;

  const Municipality._();

  factory Municipality.fromJson(Map<String, Object?> json) =>
      _$MunicipalityFromJson(json);

  String get id => iri.replaceAll('/municipalities/', '');

  Location resolveLocation() {
    final centroid = this.centroid;
    if (centroid != null) {
      return Location(
        latitude: centroid.latitude,
        longitude: centroid.longitude,
      );
    } else {
      return const Location(
        latitude: kDefaultLatitude,
        longitude: kDefaultLongitude,
      );
    }
  }
}
