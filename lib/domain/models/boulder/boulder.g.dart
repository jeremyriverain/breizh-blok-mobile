// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boulder.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoulderImpl _$$BoulderImplFromJson(Map<String, dynamic> json) =>
    _$BoulderImpl(
      iri: json['@id'] as String,
      name: json['name'] as String,
      rock: Rock.fromJson(json['rock'] as Map<String, dynamic>),
      lineBoulders: (json['lineBoulders'] as List<dynamic>?)
              ?.map((e) => LineBoulder.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <LineBoulder>[],
      grade: json['grade'] == null
          ? null
          : Grade.fromJson(json['grade'] as Map<String, dynamic>),
      description: json['description'] as String?,
      height: json['height'] == null
          ? null
          : HeightBoulder.fromJson(json['height'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$BoulderImplToJson(_$BoulderImpl instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'name': instance.name,
      'rock': instance.rock,
      'lineBoulders': instance.lineBoulders,
      'grade': instance.grade,
      'description': instance.description,
      'height': instance.height,
    };
