// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'municipality.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Municipality _$MunicipalityFromJson(Map<String, dynamic> json) =>
    _Municipality(
      iri: json['@id'] as String,
      name: json['name'] as String,
      boulderAreas:
          (json['boulderAreas'] as List<dynamic>?)
              ?.map((e) => BoulderArea.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <BoulderArea>[],
      centroid:
          json['centroid'] == null
              ? null
              : Location.fromJson(json['centroid'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MunicipalityToJson(_Municipality instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'name': instance.name,
      'boulderAreas': instance.boulderAreas,
      'centroid': instance.centroid,
    };
