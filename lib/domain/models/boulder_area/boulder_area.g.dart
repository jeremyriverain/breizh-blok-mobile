// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boulder_area.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoulderAreaImpl _$$BoulderAreaImplFromJson(Map<String, dynamic> json) =>
    _$BoulderAreaImpl(
      iri: json['@id'] as String,
      name: json['name'] as String,
      municipality: json['municipality'] == null
          ? null
          : Municipality.fromJson(json['municipality'] as Map<String, dynamic>),
      centroid: json['centroid'] == null
          ? null
          : Location.fromJson(json['centroid'] as Map<String, dynamic>),
      parkingLocation: json['parkingLocation'] == null
          ? null
          : Location.fromJson(json['parkingLocation'] as Map<String, dynamic>),
      description: json['description'] as String?,
      numberOfBoulders: (json['numberOfBoulders'] as num?)?.toInt(),
      lowestGrade: json['lowestGrade'] == null
          ? null
          : Grade.fromJson(json['lowestGrade'] as Map<String, dynamic>),
      highestGrade: json['highestGrade'] == null
          ? null
          : Grade.fromJson(json['highestGrade'] as Map<String, dynamic>),
      numberOfBouldersGroupedByGrade:
          (json['numberOfBouldersGroupedByGrade'] as Map<String, dynamic>?)
              ?.map(
        (k, e) => MapEntry(k, (e as num).toInt()),
      ),
    );

Map<String, dynamic> _$$BoulderAreaImplToJson(_$BoulderAreaImpl instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'name': instance.name,
      'municipality': instance.municipality,
      'centroid': instance.centroid,
      'parkingLocation': instance.parkingLocation,
      'description': instance.description,
      'numberOfBoulders': instance.numberOfBoulders,
      'lowestGrade': instance.lowestGrade,
      'highestGrade': instance.highestGrade,
      'numberOfBouldersGroupedByGrade': instance.numberOfBouldersGroupedByGrade,
    };
