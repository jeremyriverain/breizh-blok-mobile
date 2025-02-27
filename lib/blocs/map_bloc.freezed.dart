// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MapState {

 double get mapZoom; LatLng get mapLatLng;
/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MapStateCopyWith<MapState> get copyWith => _$MapStateCopyWithImpl<MapState>(this as MapState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MapState&&(identical(other.mapZoom, mapZoom) || other.mapZoom == mapZoom)&&(identical(other.mapLatLng, mapLatLng) || other.mapLatLng == mapLatLng));
}


@override
int get hashCode => Object.hash(runtimeType,mapZoom,mapLatLng);

@override
String toString() {
  return 'MapState(mapZoom: $mapZoom, mapLatLng: $mapLatLng)';
}


}

/// @nodoc
abstract mixin class $MapStateCopyWith<$Res>  {
  factory $MapStateCopyWith(MapState value, $Res Function(MapState) _then) = _$MapStateCopyWithImpl;
@useResult
$Res call({
 double mapZoom, LatLng mapLatLng
});



}
/// @nodoc
class _$MapStateCopyWithImpl<$Res>
    implements $MapStateCopyWith<$Res> {
  _$MapStateCopyWithImpl(this._self, this._then);

  final MapState _self;
  final $Res Function(MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? mapZoom = null,Object? mapLatLng = null,}) {
  return _then(_self.copyWith(
mapZoom: null == mapZoom ? _self.mapZoom : mapZoom // ignore: cast_nullable_to_non_nullable
as double,mapLatLng: null == mapLatLng ? _self.mapLatLng : mapLatLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}

}


/// @nodoc


class _MapState implements MapState {
  const _MapState({required this.mapZoom, required this.mapLatLng});
  

@override final  double mapZoom;
@override final  LatLng mapLatLng;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MapStateCopyWith<_MapState> get copyWith => __$MapStateCopyWithImpl<_MapState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MapState&&(identical(other.mapZoom, mapZoom) || other.mapZoom == mapZoom)&&(identical(other.mapLatLng, mapLatLng) || other.mapLatLng == mapLatLng));
}


@override
int get hashCode => Object.hash(runtimeType,mapZoom,mapLatLng);

@override
String toString() {
  return 'MapState(mapZoom: $mapZoom, mapLatLng: $mapLatLng)';
}


}

/// @nodoc
abstract mixin class _$MapStateCopyWith<$Res> implements $MapStateCopyWith<$Res> {
  factory _$MapStateCopyWith(_MapState value, $Res Function(_MapState) _then) = __$MapStateCopyWithImpl;
@override @useResult
$Res call({
 double mapZoom, LatLng mapLatLng
});



}
/// @nodoc
class __$MapStateCopyWithImpl<$Res>
    implements _$MapStateCopyWith<$Res> {
  __$MapStateCopyWithImpl(this._self, this._then);

  final _MapState _self;
  final $Res Function(_MapState) _then;

/// Create a copy of MapState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? mapZoom = null,Object? mapLatLng = null,}) {
  return _then(_MapState(
mapZoom: null == mapZoom ? _self.mapZoom : mapZoom // ignore: cast_nullable_to_non_nullable
as double,mapLatLng: null == mapLatLng ? _self.mapLatLng : mapLatLng // ignore: cast_nullable_to_non_nullable
as LatLng,
  ));
}


}

// dart format on
