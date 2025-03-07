// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_area_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoulderAreaEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderAreaEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderAreaEvents()';
}


}

/// @nodoc
class $BoulderAreaEventsCopyWith<$Res>  {
$BoulderAreaEventsCopyWith(BoulderAreaEvents _, $Res Function(BoulderAreaEvents) __);
}


/// @nodoc


class BoulderAreaRequested extends BoulderAreaEvents {
  const BoulderAreaRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderAreaRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderAreaEvents.requested()';
}


}




/// @nodoc
mixin _$BoulderAreaStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderAreaStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderAreaStates()';
}


}

/// @nodoc
class $BoulderAreaStatesCopyWith<$Res>  {
$BoulderAreaStatesCopyWith(BoulderAreaStates _, $Res Function(BoulderAreaStates) __);
}


/// @nodoc


class BoulderAreaLoading extends BoulderAreaStates {
  const BoulderAreaLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderAreaLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BoulderAreaStates.loading()';
}


}




/// @nodoc


class BoulderAreaOK extends BoulderAreaStates {
  const BoulderAreaOK({required this.boulderArea}): super._();
  

 final  BoulderArea boulderArea;

/// Create a copy of BoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderAreaOKCopyWith<BoulderAreaOK> get copyWith => _$BoulderAreaOKCopyWithImpl<BoulderAreaOK>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderAreaOK&&(identical(other.boulderArea, boulderArea) || other.boulderArea == boulderArea));
}


@override
int get hashCode => Object.hash(runtimeType,boulderArea);

@override
String toString() {
  return 'BoulderAreaStates.ok(boulderArea: $boulderArea)';
}


}

/// @nodoc
abstract mixin class $BoulderAreaOKCopyWith<$Res> implements $BoulderAreaStatesCopyWith<$Res> {
  factory $BoulderAreaOKCopyWith(BoulderAreaOK value, $Res Function(BoulderAreaOK) _then) = _$BoulderAreaOKCopyWithImpl;
@useResult
$Res call({
 BoulderArea boulderArea
});


$BoulderAreaCopyWith<$Res> get boulderArea;

}
/// @nodoc
class _$BoulderAreaOKCopyWithImpl<$Res>
    implements $BoulderAreaOKCopyWith<$Res> {
  _$BoulderAreaOKCopyWithImpl(this._self, this._then);

  final BoulderAreaOK _self;
  final $Res Function(BoulderAreaOK) _then;

/// Create a copy of BoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? boulderArea = null,}) {
  return _then(BoulderAreaOK(
boulderArea: null == boulderArea ? _self.boulderArea : boulderArea // ignore: cast_nullable_to_non_nullable
as BoulderArea,
  ));
}

/// Create a copy of BoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BoulderAreaCopyWith<$Res> get boulderArea {
  
  return $BoulderAreaCopyWith<$Res>(_self.boulderArea, (value) {
    return _then(_self.copyWith(boulderArea: value));
  });
}
}

/// @nodoc


class BoulderAreaError extends BoulderAreaStates {
  const BoulderAreaError({this.error}): super._();
  

 final  Object? error;

/// Create a copy of BoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderAreaErrorCopyWith<BoulderAreaError> get copyWith => _$BoulderAreaErrorCopyWithImpl<BoulderAreaError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderAreaError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BoulderAreaStates.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $BoulderAreaErrorCopyWith<$Res> implements $BoulderAreaStatesCopyWith<$Res> {
  factory $BoulderAreaErrorCopyWith(BoulderAreaError value, $Res Function(BoulderAreaError) _then) = _$BoulderAreaErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$BoulderAreaErrorCopyWithImpl<$Res>
    implements $BoulderAreaErrorCopyWith<$Res> {
  _$BoulderAreaErrorCopyWithImpl(this._self, this._then);

  final BoulderAreaError _self;
  final $Res Function(BoulderAreaError) _then;

/// Create a copy of BoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(BoulderAreaError(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
