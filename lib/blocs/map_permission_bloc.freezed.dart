// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_permission_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapPermissionState {

 bool get hasRequested; bool get hasDenied;
/// Create a copy of MapPermissionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapPermissionStateCopyWith<MapPermissionState> get copyWith => _$MapPermissionStateCopyWithImpl<MapPermissionState>(this as MapPermissionState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapPermissionState&&(identical(other.hasRequested, hasRequested) || other.hasRequested == hasRequested)&&(identical(other.hasDenied, hasDenied) || other.hasDenied == hasDenied));
}


@override
int get hashCode => Object.hash(runtimeType,hasRequested,hasDenied);

@override
String toString() {
  return 'MapPermissionState(hasRequested: $hasRequested, hasDenied: $hasDenied)';
}


}

/// @nodoc
abstract mixin class $MapPermissionStateCopyWith<$Res>  {
  factory $MapPermissionStateCopyWith(MapPermissionState value, $Res Function(MapPermissionState) _then) = _$MapPermissionStateCopyWithImpl;
@useResult
$Res call({
 bool hasRequested, bool hasDenied
});




}
/// @nodoc
class _$MapPermissionStateCopyWithImpl<$Res>
    implements $MapPermissionStateCopyWith<$Res> {
  _$MapPermissionStateCopyWithImpl(this._self, this._then);

  final MapPermissionState _self;
  final $Res Function(MapPermissionState) _then;

/// Create a copy of MapPermissionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? hasRequested = null,Object? hasDenied = null,}) {
  return _then(_self.copyWith(
hasRequested: null == hasRequested ? _self.hasRequested : hasRequested // ignore: cast_nullable_to_non_nullable
as bool,hasDenied: null == hasDenied ? _self.hasDenied : hasDenied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// @nodoc


class _MapPermissionState extends MapPermissionState {
  const _MapPermissionState({this.hasRequested = false, this.hasDenied = false}): super._();
  

@override@JsonKey() final  bool hasRequested;
@override@JsonKey() final  bool hasDenied;

/// Create a copy of MapPermissionState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapPermissionStateCopyWith<_MapPermissionState> get copyWith => __$MapPermissionStateCopyWithImpl<_MapPermissionState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapPermissionState&&(identical(other.hasRequested, hasRequested) || other.hasRequested == hasRequested)&&(identical(other.hasDenied, hasDenied) || other.hasDenied == hasDenied));
}


@override
int get hashCode => Object.hash(runtimeType,hasRequested,hasDenied);

@override
String toString() {
  return 'MapPermissionState(hasRequested: $hasRequested, hasDenied: $hasDenied)';
}


}

/// @nodoc
abstract mixin class _$MapPermissionStateCopyWith<$Res> implements $MapPermissionStateCopyWith<$Res> {
  factory _$MapPermissionStateCopyWith(_MapPermissionState value, $Res Function(_MapPermissionState) _then) = __$MapPermissionStateCopyWithImpl;
@override @useResult
$Res call({
 bool hasRequested, bool hasDenied
});




}
/// @nodoc
class __$MapPermissionStateCopyWithImpl<$Res>
    implements _$MapPermissionStateCopyWith<$Res> {
  __$MapPermissionStateCopyWithImpl(this._self, this._then);

  final _MapPermissionState _self;
  final $Res Function(_MapPermissionState) _then;

/// Create a copy of MapPermissionState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? hasRequested = null,Object? hasDenied = null,}) {
  return _then(_MapPermissionState(
hasRequested: null == hasRequested ? _self.hasRequested : hasRequested // ignore: cast_nullable_to_non_nullable
as bool,hasDenied: null == hasDenied ? _self.hasDenied : hasDenied // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
