// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Rock _$RockFromJson(Map<String, dynamic> json) => _Rock(
  iri: json['@id'] as String,
  boulderArea: BoulderArea.fromJson(
    json['boulderArea'] as Map<String, dynamic>,
  ),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
);

Map<String, dynamic> _$RockToJson(_Rock instance) => <String, dynamic>{
  '@id': instance.iri,
  'boulderArea': instance.boulderArea,
  'location': instance.location,
};
