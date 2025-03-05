// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoulderEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderEvents()';
}


}

/// @nodoc
class $BoulderEventsCopyWith<$Res>  {
$BoulderEventsCopyWith(BoulderEvents _, $Res Function(BoulderEvents) __);
}


/// @nodoc


class BoulderRequested extends BoulderEvents {
  const BoulderRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderEvents.requested()';
}


}




/// @nodoc
mixin _$BoulderStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderStates()';
}


}

/// @nodoc
class $BoulderStatesCopyWith<$Res>  {
$BoulderStatesCopyWith(BoulderStates _, $Res Function(BoulderStates) __);
}


/// @nodoc


class BoulderLoading extends BoulderStates {
  const BoulderLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderStates.loading()';
}


}




/// @nodoc


class BoulderOK extends BoulderStates {
  const BoulderOK({required this.boulder}): super._();
  

 final  Boulder boulder;

/// Create a copy of BoulderStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderOKCopyWith<BoulderOK> get copyWith => _$BoulderOKCopyWithImpl<BoulderOK>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderOK&&(identical(other.boulder, boulder) || other.boulder == boulder));
}


@override
int get hashCode => Object.hash(runtimeType,boulder);

@override
String toString() {
  return 'BoulderStates.ok(boulder: $boulder)';
}


}

/// @nodoc
abstract mixin class $BoulderOKCopyWith<$Res> implements $BoulderStatesCopyWith<$Res> {
  factory $BoulderOKCopyWith(BoulderOK value, $Res Function(BoulderOK) _then) = _$BoulderOKCopyWithImpl;
@useResult
$Res call({
 Boulder boulder
});


$BoulderCopyWith<$Res> get boulder;

}
/// @nodoc
class _$BoulderOKCopyWithImpl<$Res>
    implements $BoulderOKCopyWith<$Res> {
  _$BoulderOKCopyWithImpl(this._self, this._then);

  final BoulderOK _self;
  final $Res Function(BoulderOK) _then;

/// Create a copy of BoulderStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? boulder = null,}) {
  return _then(BoulderOK(
boulder: null == boulder ? _self.boulder : boulder // ignore: cast_nullable_to_non_nullable
as Boulder,
  ));
}

/// Create a copy of BoulderStates
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


class BoulderError extends BoulderStates {
  const BoulderError({this.error}): super._();
  

 final  Object? error;

/// Create a copy of BoulderStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderErrorCopyWith<BoulderError> get copyWith => _$BoulderErrorCopyWithImpl<BoulderError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BoulderStates.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $BoulderErrorCopyWith<$Res> implements $BoulderStatesCopyWith<$Res> {
  factory $BoulderErrorCopyWith(BoulderError value, $Res Function(BoulderError) _then) = _$BoulderErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$BoulderErrorCopyWithImpl<$Res>
    implements $BoulderErrorCopyWith<$Res> {
  _$BoulderErrorCopyWithImpl(this._self, this._then);

  final BoulderError _self;
  final $Res Function(BoulderError) _then;

/// Create a copy of BoulderStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(BoulderError(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
