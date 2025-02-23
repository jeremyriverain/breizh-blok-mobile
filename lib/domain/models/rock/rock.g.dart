// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rock.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RockImpl _$$RockImplFromJson(Map<String, dynamic> json) => _$RockImpl(
      iri: json['@id'] as String,
      boulderArea:
          BoulderArea.fromJson(json['boulderArea'] as Map<String, dynamic>),
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$RockImplToJson(_$RockImpl instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'boulderArea': instance.boulderArea,
      'location': instance.location,
    };
