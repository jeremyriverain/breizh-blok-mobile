// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Location _$LocationFromJson(Map<String, dynamic> json) => _Location(
  latitude: double.parse(json['latitude'] as String),
  longitude: double.parse(json['longitude'] as String),
);

Map<String, dynamic> _$LocationToJson(_Location instance) => <String, dynamic>{
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
