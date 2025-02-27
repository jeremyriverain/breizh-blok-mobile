// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_marker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoulderMarkerState {

 List<BoulderMarker> get markers; bool get isLoading; String get error;
/// Create a copy of BoulderMarkerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderMarkerStateCopyWith<BoulderMarkerState> get copyWith => _$BoulderMarkerStateCopyWithImpl<BoulderMarkerState>(this as BoulderMarkerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderMarkerState&&const DeepCollectionEquality().equals(other.markers, markers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(markers),isLoading,error);

@override
String toString() {
  return 'BoulderMarkerState(markers: $markers, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $BoulderMarkerStateCopyWith<$Res>  {
  factory $BoulderMarkerStateCopyWith(BoulderMarkerState value, $Res Function(BoulderMarkerState) _then) = _$BoulderMarkerStateCopyWithImpl;
@useResult
$Res call({
 List<BoulderMarker> markers, bool isLoading, String error
});



}
/// @nodoc
class _$BoulderMarkerStateCopyWithImpl<$Res>
    implements $BoulderMarkerStateCopyWith<$Res> {
  _$BoulderMarkerStateCopyWithImpl(this._self, this._then);

  final BoulderMarkerState _self;
  final $Res Function(BoulderMarkerState) _then;

/// Create a copy of BoulderMarkerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? markers = null,Object? isLoading = null,Object? error = null,}) {
  return _then(_self.copyWith(
markers: null == markers ? _self.markers : markers // ignore: cast_nullable_to_non_nullable
as List<BoulderMarker>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// @nodoc


class _BoulderMarkerState implements BoulderMarkerState {
  const _BoulderMarkerState({required final  List<BoulderMarker> markers, required this.isLoading, required this.error}): _markers = markers;
  

 final  List<BoulderMarker> _markers;
@override List<BoulderMarker> get markers {
  if (_markers is EqualUnmodifiableListView) return _markers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_markers);
}

@override final  bool isLoading;
@override final  String error;

/// Create a copy of BoulderMarkerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoulderMarkerStateCopyWith<_BoulderMarkerState> get copyWith => __$BoulderMarkerStateCopyWithImpl<_BoulderMarkerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoulderMarkerState&&const DeepCollectionEquality().equals(other._markers, _markers)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_markers),isLoading,error);

@override
String toString() {
  return 'BoulderMarkerState(markers: $markers, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BoulderMarkerStateCopyWith<$Res> implements $BoulderMarkerStateCopyWith<$Res> {
  factory _$BoulderMarkerStateCopyWith(_BoulderMarkerState value, $Res Function(_BoulderMarkerState) _then) = __$BoulderMarkerStateCopyWithImpl;
@override @useResult
$Res call({
 List<BoulderMarker> markers, bool isLoading, String error
});



}
/// @nodoc
class __$BoulderMarkerStateCopyWithImpl<$Res>
    implements _$BoulderMarkerStateCopyWith<$Res> {
  __$BoulderMarkerStateCopyWithImpl(this._self, this._then);

  final _BoulderMarkerState _self;
  final $Res Function(_BoulderMarkerState) _then;

/// Create a copy of BoulderMarkerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? markers = null,Object? isLoading = null,Object? error = null,}) {
  return _then(_BoulderMarkerState(
markers: null == markers ? _self._markers : markers // ignore: cast_nullable_to_non_nullable
as List<BoulderMarker>,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
