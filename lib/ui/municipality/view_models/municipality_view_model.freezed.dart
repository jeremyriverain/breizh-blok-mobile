// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'municipality_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MunicipalityEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MunicipalityEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MunicipalityEvents()';
}


}

/// @nodoc
class $MunicipalityEventsCopyWith<$Res>  {
$MunicipalityEventsCopyWith(MunicipalityEvents _, $Res Function(MunicipalityEvents) __);
}


/// @nodoc


class MunicipalityRequested extends MunicipalityEvents {
  const MunicipalityRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MunicipalityRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MunicipalityEvents.requested()';
}


}




/// @nodoc
mixin _$MunicipalityStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MunicipalityStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MunicipalityStates()';
}


}

/// @nodoc
class $MunicipalityStatesCopyWith<$Res>  {
$MunicipalityStatesCopyWith(MunicipalityStates _, $Res Function(MunicipalityStates) __);
}


/// @nodoc


class MunicipalityLoading extends MunicipalityStates {
  const MunicipalityLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MunicipalityLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'MunicipalityStates.loading()';
}


}




/// @nodoc


class MunicipalityOK extends MunicipalityStates {
  const MunicipalityOK({required this.municipality}): super._();
  

 final  Municipality municipality;

/// Create a copy of MunicipalityStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MunicipalityOKCopyWith<MunicipalityOK> get copyWith => _$MunicipalityOKCopyWithImpl<MunicipalityOK>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MunicipalityOK&&(identical(other.municipality, municipality) || other.municipality == municipality));
}


@override
int get hashCode => Object.hash(runtimeType,municipality);

@override
String toString() {
  return 'MunicipalityStates.ok(municipality: $municipality)';
}


}

/// @nodoc
abstract mixin class $MunicipalityOKCopyWith<$Res> implements $MunicipalityStatesCopyWith<$Res> {
  factory $MunicipalityOKCopyWith(MunicipalityOK value, $Res Function(MunicipalityOK) _then) = _$MunicipalityOKCopyWithImpl;
@useResult
$Res call({
 Municipality municipality
});


$MunicipalityCopyWith<$Res> get municipality;

}
/// @nodoc
class _$MunicipalityOKCopyWithImpl<$Res>
    implements $MunicipalityOKCopyWith<$Res> {
  _$MunicipalityOKCopyWithImpl(this._self, this._then);

  final MunicipalityOK _self;
  final $Res Function(MunicipalityOK) _then;

/// Create a copy of MunicipalityStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? municipality = null,}) {
  return _then(MunicipalityOK(
municipality: null == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as Municipality,
  ));
}

/// Create a copy of MunicipalityStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MunicipalityCopyWith<$Res> get municipality {
  
  return $MunicipalityCopyWith<$Res>(_self.municipality, (value) {
    return _then(_self.copyWith(municipality: value));
  });
}
}

/// @nodoc


class MunicipalityError extends MunicipalityStates {
  const MunicipalityError({this.error}): super._();
  

 final  Object? error;

/// Create a copy of MunicipalityStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MunicipalityErrorCopyWith<MunicipalityError> get copyWith => _$MunicipalityErrorCopyWithImpl<MunicipalityError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MunicipalityError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'MunicipalityStates.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $MunicipalityErrorCopyWith<$Res> implements $MunicipalityStatesCopyWith<$Res> {
  factory $MunicipalityErrorCopyWith(MunicipalityError value, $Res Function(MunicipalityError) _then) = _$MunicipalityErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$MunicipalityErrorCopyWithImpl<$Res>
    implements $MunicipalityErrorCopyWith<$Res> {
  _$MunicipalityErrorCopyWithImpl(this._self, this._then);

  final MunicipalityError _self;
  final $Res Function(MunicipalityError) _then;

/// Create a copy of MunicipalityStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(MunicipalityError(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
