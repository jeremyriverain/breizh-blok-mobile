// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'line_boulder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LineBoulder _$LineBoulderFromJson(Map<String, dynamic> json) => _LineBoulder(
  iri: json['@id'] as String,
  smoothLine: json['smoothLine'] as String,
  rockImage: Image.fromJson(json['rockImage'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LineBoulderToJson(_LineBoulder instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'smoothLine': instance.smoothLine,
      'rockImage': instance.rockImage,
    };
