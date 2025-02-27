// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'department.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Department {

@JsonKey(name: '@id') String get iri; String get name; List<Municipality> get municipalities;
/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DepartmentCopyWith<Department> get copyWith => _$DepartmentCopyWithImpl<Department>(this as Department, _$identity);

  /// Serializes this Department to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Department&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.municipalities, municipalities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,const DeepCollectionEquality().hash(municipalities));

@override
String toString() {
  return 'Department(iri: $iri, name: $name, municipalities: $municipalities)';
}


}

/// @nodoc
abstract mixin class $DepartmentCopyWith<$Res>  {
  factory $DepartmentCopyWith(Department value, $Res Function(Department) _then) = _$DepartmentCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, List<Municipality> municipalities
});



}
/// @nodoc
class _$DepartmentCopyWithImpl<$Res>
    implements $DepartmentCopyWith<$Res> {
  _$DepartmentCopyWithImpl(this._self, this._then);

  final Department _self;
  final $Res Function(Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? name = null,Object? municipalities = null,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,municipalities: null == municipalities ? _self.municipalities : municipalities // ignore: cast_nullable_to_non_nullable
as List<Municipality>,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Department implements Department {
  const _Department({@JsonKey(name: '@id') required this.iri, required this.name, final  List<Municipality> municipalities = const <Municipality>[]}): _municipalities = municipalities;
  factory _Department.fromJson(Map<String, dynamic> json) => _$DepartmentFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  String name;
 final  List<Municipality> _municipalities;
@override@JsonKey() List<Municipality> get municipalities {
  if (_municipalities is EqualUnmodifiableListView) return _municipalities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_municipalities);
}


/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DepartmentCopyWith<_Department> get copyWith => __$DepartmentCopyWithImpl<_Department>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DepartmentToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Department&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._municipalities, _municipalities));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,const DeepCollectionEquality().hash(_municipalities));

@override
String toString() {
  return 'Department(iri: $iri, name: $name, municipalities: $municipalities)';
}


}

/// @nodoc
abstract mixin class _$DepartmentCopyWith<$Res> implements $DepartmentCopyWith<$Res> {
  factory _$DepartmentCopyWith(_Department value, $Res Function(_Department) _then) = __$DepartmentCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, List<Municipality> municipalities
});



}
/// @nodoc
class __$DepartmentCopyWithImpl<$Res>
    implements _$DepartmentCopyWith<$Res> {
  __$DepartmentCopyWithImpl(this._self, this._then);

  final _Department _self;
  final $Res Function(_Department) _then;

/// Create a copy of Department
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? name = null,Object? municipalities = null,}) {
  return _then(_Department(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,municipalities: null == municipalities ? _self._municipalities : municipalities // ignore: cast_nullable_to_non_nullable
as List<Municipality>,
  ));
}


}

// dart format on
