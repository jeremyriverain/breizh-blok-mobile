// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'height_boulder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HeightBoulder _$HeightBoulderFromJson(Map<String, dynamic> json) =>
    _HeightBoulder(
      iri: json['@id'] as String,
      min: (json['min'] as num).toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$HeightBoulderToJson(_HeightBoulder instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'min': instance.min,
      'max': instance.max,
    };
