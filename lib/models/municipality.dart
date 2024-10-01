import 'package:breizh_blok_mobile/constants.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:equatable/equatable.dart';

class Municipality extends Equatable {
  Municipality({
    required this.iri,
    required this.name,
    List<BoulderArea>? boulderAreas,
    this.centroid,
  }) : boulderAreas = boulderAreas ?? [];

  factory Municipality.fromJson(Map<String, dynamic> json) {
    if (json case {'@id': final String iri, 'name': final String name}) {
      var boulderAreas = <BoulderArea>[];
      if (json
          case {
            'boulderAreas': final List<dynamic> jsonBoulderAreas,
          }) {
        boulderAreas = jsonBoulderAreas
            .map(
              (e) => BoulderArea.fromJson(e as Map<String, dynamic>).copyWith(
                municipality: Municipality(
                  name: name,
                  iri: iri,
                ),
              ),
            )
            .toList();
      }

      Location? centroid;
      if (json case {'centroid': final Map<String, dynamic> jsonCentroid}) {
        centroid = Location.fromJson(jsonCentroid);
      }
      return Municipality(
        iri: iri,
        name: name,
        boulderAreas: boulderAreas,
        centroid: centroid,
      );
    }

    throw const FormatException();
  }
  final String iri;
  final String name;
  final List<BoulderArea> boulderAreas;
  final Location? centroid;

  @override
  List<Object?> get props => [iri];

  Location resolveLocation() {
    final centroid = this.centroid;
    if (centroid != null) {
      return Location(
        latitude: centroid.latitude,
        longitude: centroid.longitude,
      );
    } else {
      return Location(
        latitude: kDefaultInitialPosition.latitude,
        longitude: kDefaultInitialPosition.longitude,
      );
    }
  }
}
