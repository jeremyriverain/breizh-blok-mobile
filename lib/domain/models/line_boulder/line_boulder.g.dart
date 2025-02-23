// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_boulder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LineBoulderImpl _$$LineBoulderImplFromJson(Map<String, dynamic> json) =>
    _$LineBoulderImpl(
      iri: json['@id'] as String,
      smoothLine: json['smoothLine'] as String,
      rockImage: Image.fromJson(json['rockImage'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LineBoulderImplToJson(_$LineBoulderImpl instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'smoothLine': instance.smoothLine,
      'rockImage': instance.rockImage,
    };
