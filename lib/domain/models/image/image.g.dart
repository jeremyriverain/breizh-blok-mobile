// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageImpl _$$ImageImplFromJson(Map<String, dynamic> json) => _$ImageImpl(
      contentUrl: json['contentUrl'] as String,
      filterUrl: json['filterUrl'] as String?,
      imageDimensions: (json['imageDimensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$$ImageImplToJson(_$ImageImpl instance) =>
    <String, dynamic>{
      'contentUrl': instance.contentUrl,
      'filterUrl': instance.filterUrl,
      'imageDimensions': instance.imageDimensions,
    };
