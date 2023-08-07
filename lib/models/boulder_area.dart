import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:equatable/equatable.dart';

class BoulderArea extends Equatable {
  final String iri;
  final String name;
  final Municipality municipality;
  final Location? centroid;
  final Location? parkingLocation;
  final String? description;
  final int? numberOfBoulders;
  final Grade? lowestGrade;
  final Grade? highestGrade;
  final Map<String, int>? numberOfBouldersGroupedByGrade;

  const BoulderArea({
    required this.iri,
    required this.name,
    required this.municipality,
    this.centroid,
    this.parkingLocation,
    this.description,
    this.numberOfBoulders,
    this.lowestGrade,
    this.highestGrade,
    this.numberOfBouldersGroupedByGrade,
  });

  BoulderArea copyWith({
    Municipality? municipality,
    Location? centroid,
    Location? parkingLocation,
    int? numberOfBoulders,
    Grade? lowestGrade,
    Grade? highestGrade,
    Map<String, int>? numberOfBouldersGroupedByGrade,
  }) {
    return BoulderArea(
        iri: iri,
        name: name,
        centroid: centroid ?? this.centroid,
        parkingLocation: parkingLocation ?? this.parkingLocation,
        description: description,
        municipality: municipality ?? this.municipality,
        numberOfBoulders: numberOfBoulders ?? this.numberOfBoulders,
        lowestGrade: lowestGrade ?? this.lowestGrade,
        highestGrade: highestGrade ?? this.highestGrade,
        numberOfBouldersGroupedByGrade: numberOfBouldersGroupedByGrade ??
            this.numberOfBouldersGroupedByGrade);
  }

  factory BoulderArea.fromJson(Map<String, dynamic> json) {
    return BoulderArea(
      iri: json['@id'],
      name: json['name'],
      municipality: json['municipality'] != null
          ? Municipality.fromJson(json['municipality'])
          : Municipality(iri: '/municipalities/0', name: 'generic'),
      description: json['description'],
      centroid:
          json['centroid'] != null ? Location.fromJson(json['centroid']) : null,
      parkingLocation: json['parkingLocation'] != null
          ? Location.fromJson(json['parkingLocation'])
          : null,
      numberOfBoulders: json['numberOfBoulders'],
      lowestGrade: json['lowestGrade'] != null
          ? Grade.fromJson(json['lowestGrade'])
          : null,
      highestGrade: json['highestGrade'] != null
          ? Grade.fromJson(json['highestGrade'])
          : null,
      numberOfBouldersGroupedByGrade:
          json['numberOfBouldersGroupedByGrade'] != null
              ? (json['numberOfBouldersGroupedByGrade'] as Map<String, dynamic>)
                  .map(
                  (key, value) {
                    return MapEntry(
                      key,
                      value.toInt(),
                    );
                  },
                )
              : null,
    );
  }

  @override
  List<Object?> get props => [iri];

  Location resolveLocation() {
    final centroid = this.centroid;
    final parkingLocation = this.parkingLocation;
    if (parkingLocation != null) {
      return Location(
          latitude: parkingLocation.latitude,
          longitude: parkingLocation.longitude);
    } else if (centroid != null) {
      return Location(
          latitude: centroid.latitude, longitude: centroid.longitude);
    } else {
      return Location(
        latitude: kDefaultInitialPosition.latitude,
        longitude: kDefaultInitialPosition.longitude,
      );
    }
  }

  String? computeStatsAsString() {
    final numBoulders = numberOfBoulders;
    final minGrade = lowestGrade;
    final maxGrade = highestGrade;
    if (numBoulders != null && numBoulders > 0) {
      var result = '$numBoulders bloc${numBoulders > 1 ? 's' : ''}';
      if (minGrade == null || maxGrade == null) {
        return result;
      }
      if (minGrade.name == maxGrade.name) {
        return '$result en ${minGrade.name}';
      }
      return '$result du ${minGrade.name} au ${maxGrade.name}';
    }
    return null;
  }
}
