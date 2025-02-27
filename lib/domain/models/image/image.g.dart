// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Image _$ImageFromJson(Map<String, dynamic> json) => _Image(
  contentUrl: json['contentUrl'] as String,
  filterUrl: json['filterUrl'] as String?,
  imageDimensions:
      (json['imageDimensions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
);

Map<String, dynamic> _$ImageToJson(_Image instance) => <String, dynamic>{
  'contentUrl': instance.contentUrl,
  'filterUrl': instance.filterUrl,
  'imageDimensions': instance.imageDimensions,
};
