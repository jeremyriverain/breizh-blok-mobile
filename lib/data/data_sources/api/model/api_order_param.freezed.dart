// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_order_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ApiOrderParam {

 String get name; String get direction;
/// Create a copy of ApiOrderParam
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ApiOrderParamCopyWith<ApiOrderParam> get copyWith => _$ApiOrderParamCopyWithImpl<ApiOrderParam>(this as ApiOrderParam, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ApiOrderParam&&(identical(other.name, name) || other.name == name)&&(identical(other.direction, direction) || other.direction == direction));
}


@override
int get hashCode => Object.hash(runtimeType,name,direction);

@override
String toString() {
  return 'ApiOrderParam(name: $name, direction: $direction)';
}


}

/// @nodoc
abstract mixin class $ApiOrderParamCopyWith<$Res>  {
  factory $ApiOrderParamCopyWith(ApiOrderParam value, $Res Function(ApiOrderParam) _then) = _$ApiOrderParamCopyWithImpl;
@useResult
$Res call({
 String name, String direction
});




}
/// @nodoc
class _$ApiOrderParamCopyWithImpl<$Res>
    implements $ApiOrderParamCopyWith<$Res> {
  _$ApiOrderParamCopyWithImpl(this._self, this._then);

  final ApiOrderParam _self;
  final $Res Function(ApiOrderParam) _then;

/// Create a copy of ApiOrderParam
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? name = null,Object? direction = null,}) {
  return _then(_self.copyWith(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _ApiOrderParam implements ApiOrderParam {
  const _ApiOrderParam({required this.name, required this.direction});
  

@override final  String name;
@override final  String direction;

/// Create a copy of ApiOrderParam
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ApiOrderParamCopyWith<_ApiOrderParam> get copyWith => __$ApiOrderParamCopyWithImpl<_ApiOrderParam>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ApiOrderParam&&(identical(other.name, name) || other.name == name)&&(identical(other.direction, direction) || other.direction == direction));
}


@override
int get hashCode => Object.hash(runtimeType,name,direction);

@override
String toString() {
  return 'ApiOrderParam(name: $name, direction: $direction)';
}


}

/// @nodoc
abstract mixin class _$ApiOrderParamCopyWith<$Res> implements $ApiOrderParamCopyWith<$Res> {
  factory _$ApiOrderParamCopyWith(_ApiOrderParam value, $Res Function(_ApiOrderParam) _then) = __$ApiOrderParamCopyWithImpl;
@override @useResult
$Res call({
 String name, String direction
});




}
/// @nodoc
class __$ApiOrderParamCopyWithImpl<$Res>
    implements _$ApiOrderParamCopyWith<$Res> {
  __$ApiOrderParamCopyWithImpl(this._self, this._then);

  final _ApiOrderParam _self;
  final $Res Function(_ApiOrderParam) _then;

/// Create a copy of ApiOrderParam
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? name = null,Object? direction = null,}) {
  return _then(_ApiOrderParam(
name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,direction: null == direction ? _self.direction : direction // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
