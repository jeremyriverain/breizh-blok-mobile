// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'grade.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Grade {

@JsonKey(name: '@id') String get iri; String get name;
/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GradeCopyWith<Grade> get copyWith => _$GradeCopyWithImpl<Grade>(this as Grade, _$identity);

  /// Serializes this Grade to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Grade&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name);

@override
String toString() {
  return 'Grade(iri: $iri, name: $name)';
}


}

/// @nodoc
abstract mixin class $GradeCopyWith<$Res>  {
  factory $GradeCopyWith(Grade value, $Res Function(Grade) _then) = _$GradeCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, String name
});




}
/// @nodoc
class _$GradeCopyWithImpl<$Res>
    implements $GradeCopyWith<$Res> {
  _$GradeCopyWithImpl(this._self, this._then);

  final Grade _self;
  final $Res Function(Grade) _then;

/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? name = null,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Grade implements Grade {
  const _Grade({@JsonKey(name: '@id') required this.iri, required this.name});
  factory _Grade.fromJson(Map<String, dynamic> json) => _$GradeFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  String name;

/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GradeCopyWith<_Grade> get copyWith => __$GradeCopyWithImpl<_Grade>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GradeToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Grade&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name);

@override
String toString() {
  return 'Grade(iri: $iri, name: $name)';
}


}

/// @nodoc
abstract mixin class _$GradeCopyWith<$Res> implements $GradeCopyWith<$Res> {
  factory _$GradeCopyWith(_Grade value, $Res Function(_Grade) _then) = __$GradeCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, String name
});




}
/// @nodoc
class __$GradeCopyWithImpl<$Res>
    implements _$GradeCopyWith<$Res> {
  __$GradeCopyWithImpl(this._self, this._then);

  final _Grade _self;
  final $Res Function(_Grade) _then;

/// Create a copy of Grade
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? name = null,}) {
  return _then(_Grade(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
