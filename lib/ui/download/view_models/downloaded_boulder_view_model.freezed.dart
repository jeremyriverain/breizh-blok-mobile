// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloaded_boulder_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DownloadedBoulderEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderEvents()';
}


}

/// @nodoc
class $DownloadedBoulderEventsCopyWith<$Res>  {
$DownloadedBoulderEventsCopyWith(DownloadedBoulderEvents _, $Res Function(DownloadedBoulderEvents) __);
}


/// @nodoc


class DownloadedBoulderRequested extends DownloadedBoulderEvents {
  const DownloadedBoulderRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderEvents.requested()';
}


}




/// @nodoc
mixin _$DownloadedBoulderStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderStates()';
}


}

/// @nodoc
class $DownloadedBoulderStatesCopyWith<$Res>  {
$DownloadedBoulderStatesCopyWith(DownloadedBoulderStates _, $Res Function(DownloadedBoulderStates) __);
}


/// @nodoc


class DownloadedBoulderLoading extends DownloadedBoulderStates {
  const DownloadedBoulderLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderStates.loading()';
}


}




/// @nodoc


class DownloadedBoulderOK extends DownloadedBoulderStates {
  const DownloadedBoulderOK({required this.boulder}): super._();
  

 final  Boulder boulder;

/// Create a copy of DownloadedBoulderStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadedBoulderOKCopyWith<DownloadedBoulderOK> get copyWith => _$DownloadedBoulderOKCopyWithImpl<DownloadedBoulderOK>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderOK&&(identical(other.boulder, boulder) || other.boulder == boulder));
}


@override
int get hashCode => Object.hash(runtimeType,boulder);

@override
String toString() {
  return 'DownloadedBoulderStates.ok(boulder: $boulder)';
}


}

/// @nodoc
abstract mixin class $DownloadedBoulderOKCopyWith<$Res> implements $DownloadedBoulderStatesCopyWith<$Res> {
  factory $DownloadedBoulderOKCopyWith(DownloadedBoulderOK value, $Res Function(DownloadedBoulderOK) _then) = _$DownloadedBoulderOKCopyWithImpl;
@useResult
$Res call({
 Boulder boulder
});


$BoulderCopyWith<$Res> get boulder;

}
/// @nodoc
class _$DownloadedBoulderOKCopyWithImpl<$Res>
    implements $DownloadedBoulderOKCopyWith<$Res> {
  _$DownloadedBoulderOKCopyWithImpl(this._self, this._then);

  final DownloadedBoulderOK _self;
  final $Res Function(DownloadedBoulderOK) _then;

/// Create a copy of DownloadedBoulderStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? boulder = null,}) {
  return _then(DownloadedBoulderOK(
boulder: null == boulder ? _self.boulder : boulder // ignore: cast_nullable_to_non_nullable
as Boulder,
  ));
}

/// Create a copy of DownloadedBoulderStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoulderCopyWith<$Res> get boulder {
  
  return $BoulderCopyWith<$Res>(_self.boulder, (value) {
    return _then(_self.copyWith(boulder: value));
  });
}
}

/// @nodoc


class DownloadedBoulderError extends DownloadedBoulderStates {
  const DownloadedBoulderError({this.error}): super._();
  

 final  Object? error;

/// Create a copy of DownloadedBoulderStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadedBoulderErrorCopyWith<DownloadedBoulderError> get copyWith => _$DownloadedBoulderErrorCopyWithImpl<DownloadedBoulderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'DownloadedBoulderStates.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DownloadedBoulderErrorCopyWith<$Res> implements $DownloadedBoulderStatesCopyWith<$Res> {
  factory $DownloadedBoulderErrorCopyWith(DownloadedBoulderError value, $Res Function(DownloadedBoulderError) _then) = _$DownloadedBoulderErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$DownloadedBoulderErrorCopyWithImpl<$Res>
    implements $DownloadedBoulderErrorCopyWith<$Res> {
  _$DownloadedBoulderErrorCopyWithImpl(this._self, this._then);

  final DownloadedBoulderError _self;
  final $Res Function(DownloadedBoulderError) _then;

/// Create a copy of DownloadedBoulderStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(DownloadedBoulderError(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
