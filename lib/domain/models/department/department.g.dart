// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DepartmentImpl _$$DepartmentImplFromJson(Map<String, dynamic> json) =>
    _$DepartmentImpl(
      iri: json['@id'] as String,
      name: json['name'] as String,
      municipalities: (json['municipalities'] as List<dynamic>?)
              ?.map((e) => Municipality.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <Municipality>[],
    );

Map<String, dynamic> _$$DepartmentImplToJson(_$DepartmentImpl instance) =>
    <String, dynamic>{
      '@id': instance.iri,
      'name': instance.name,
      'municipalities': instance.municipalities,
    };
