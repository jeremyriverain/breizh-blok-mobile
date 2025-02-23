// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'height_boulder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$HeightBoulderImpl _$$HeightBoulderImplFromJson(Map<String, dynamic> json) =>
    _$HeightBoulderImpl(
      iri: json['@id'] as String,
      min: (json['min'] as num).toInt(),
      max: (json['max'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$HeightBoulderImplToJson(_$HeightBoulderImpl instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'min': instance.min,
      'max': instance.max,
    };
