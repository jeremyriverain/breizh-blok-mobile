import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:equatable/equatable.dart';

class BoulderArea extends Equatable {
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

  factory BoulderArea.fromJson(Map<String, dynamic> json) {
    if (json case {'@id': final String iri, 'name': final String name}) {
      final jsonDescription = json['description'];
      final description = jsonDescription is String ? jsonDescription : null;
      return BoulderArea(
        iri: iri,
        name: name,
        municipality: json['municipality'] != null
            ? Municipality.fromJson(
                json['municipality'] as Map<String, dynamic>,
              )
            : Municipality(iri: '/municipalities/0', name: 'generic'),
        description: description,
        centroid: json['centroid'] != null
            ? Location.fromJson(json['centroid'] as Map<String, dynamic>)
            : null,
        parkingLocation: json['parkingLocation'] != null
            ? Location.fromJson(
                json['parkingLocation'] as Map<String, dynamic>,
              )
            : null,
        numberOfBoulders: json['numberOfBoulders'] as int?,
        lowestGrade: json['lowestGrade'] != null
            ? Grade.fromJson(json['lowestGrade'] as Map<String, dynamic>)
            : null,
        highestGrade: json['highestGrade'] != null
            ? Grade.fromJson(json['highestGrade'] as Map<String, dynamic>)
            : null,
        numberOfBouldersGroupedByGrade:
            json['numberOfBouldersGroupedByGrade'] != null
                ? (json['numberOfBouldersGroupedByGrade']
                        as Map<String, dynamic>)
                    .map(
                    (key, value) {
                      return MapEntry(
                        key,
                        (value as num).toInt(),
                      );
                    },
                  )
                : null,
      );
    }
    throw const FormatException();
  }

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
      numberOfBouldersGroupedByGrade:
          numberOfBouldersGroupedByGrade ?? this.numberOfBouldersGroupedByGrade,
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
        longitude: parkingLocation.longitude,
      );
    } else if (centroid != null) {
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

  String? computeStatsAsString() {
    final numBoulders = numberOfBoulders;
    final minGrade = lowestGrade;
    final maxGrade = highestGrade;
    if (numBoulders != null && numBoulders > 0) {
      final result = '$numBoulders bloc${numBoulders > 1 ? 's' : ''}';
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
