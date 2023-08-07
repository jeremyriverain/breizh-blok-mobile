import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:equatable/equatable.dart';

class Municipality extends Equatable {
  final String iri;
  final String name;
  final List<BoulderArea> boulderAreas;
  final Location? centroid;

  Municipality({
    required this.iri,
    required this.name,
    List<BoulderArea>? boulderAreas,
    this.centroid,
  }) : boulderAreas = boulderAreas ?? [];

  @override
  List<Object?> get props => [iri];

  factory Municipality.fromJson(Map<String, dynamic> json) {
    return Municipality(
      iri: json['@id'],
      name: json['name'],
      boulderAreas: json['boulderAreas'] != null
          ? json['boulderAreas'].map<BoulderArea>((boulderArea) {
              var el = BoulderArea.fromJson(boulderArea);
              return el.copyWith(
                municipality: Municipality(
                  name: json['name'],
                  iri: json['@id'],
                ),
              );
            }).toList()
          : [],
      centroid:
          json['centroid'] != null ? Location.fromJson(json['centroid']) : null,
    );
  }

  Location resolveLocation() {
    final centroid = this.centroid;
    if (centroid != null) {
      return Location(
          latitude: centroid.latitude, longitude: centroid.longitude);
    } else {
      return Location(
        latitude: kDefaultInitialPosition.latitude,
        longitude: kDefaultInitialPosition.longitude,
      );
    }
  }
}
