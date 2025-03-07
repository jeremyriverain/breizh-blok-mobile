// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloaded_boulder_area_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$DownloadedBoulderAreaEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderAreaEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderAreaEvents()';
}


}

/// @nodoc
class $DownloadedBoulderAreaEventsCopyWith<$Res>  {
$DownloadedBoulderAreaEventsCopyWith(DownloadedBoulderAreaEvents _, $Res Function(DownloadedBoulderAreaEvents) __);
}


/// @nodoc


class DownloadedBoulderAreaRequested extends DownloadedBoulderAreaEvents {
  const DownloadedBoulderAreaRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderAreaRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderAreaEvents.requested()';
}


}




/// @nodoc
mixin _$DownloadedBoulderAreaStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderAreaStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderAreaStates()';
}


}

/// @nodoc
class $DownloadedBoulderAreaStatesCopyWith<$Res>  {
$DownloadedBoulderAreaStatesCopyWith(DownloadedBoulderAreaStates _, $Res Function(DownloadedBoulderAreaStates) __);
}


/// @nodoc


class DownloadedBoulderAreaLoading extends DownloadedBoulderAreaStates {
  const DownloadedBoulderAreaLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderAreaLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'DownloadedBoulderAreaStates.loading()';
}


}




/// @nodoc


class DownloadedBoulderAreaOK extends DownloadedBoulderAreaStates {
  const DownloadedBoulderAreaOK({required this.boulderArea}): super._();
  

 final  BoulderArea boulderArea;

/// Create a copy of DownloadedBoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadedBoulderAreaOKCopyWith<DownloadedBoulderAreaOK> get copyWith => _$DownloadedBoulderAreaOKCopyWithImpl<DownloadedBoulderAreaOK>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderAreaOK&&(identical(other.boulderArea, boulderArea) || other.boulderArea == boulderArea));
}


@override
int get hashCode => Object.hash(runtimeType,boulderArea);

@override
String toString() {
  return 'DownloadedBoulderAreaStates.ok(boulderArea: $boulderArea)';
}


}

/// @nodoc
abstract mixin class $DownloadedBoulderAreaOKCopyWith<$Res> implements $DownloadedBoulderAreaStatesCopyWith<$Res> {
  factory $DownloadedBoulderAreaOKCopyWith(DownloadedBoulderAreaOK value, $Res Function(DownloadedBoulderAreaOK) _then) = _$DownloadedBoulderAreaOKCopyWithImpl;
@useResult
$Res call({
 BoulderArea boulderArea
});


$BoulderAreaCopyWith<$Res> get boulderArea;

}
/// @nodoc
class _$DownloadedBoulderAreaOKCopyWithImpl<$Res>
    implements $DownloadedBoulderAreaOKCopyWith<$Res> {
  _$DownloadedBoulderAreaOKCopyWithImpl(this._self, this._then);

  final DownloadedBoulderAreaOK _self;
  final $Res Function(DownloadedBoulderAreaOK) _then;

/// Create a copy of DownloadedBoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? boulderArea = null,}) {
  return _then(DownloadedBoulderAreaOK(
boulderArea: null == boulderArea ? _self.boulderArea : boulderArea // ignore: cast_nullable_to_non_nullable
as BoulderArea,
  ));
}

/// Create a copy of DownloadedBoulderAreaStates
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


class DownloadedBoulderAreaError extends DownloadedBoulderAreaStates {
  const DownloadedBoulderAreaError({this.error}): super._();
  

 final  Object? error;

/// Create a copy of DownloadedBoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DownloadedBoulderAreaErrorCopyWith<DownloadedBoulderAreaError> get copyWith => _$DownloadedBoulderAreaErrorCopyWithImpl<DownloadedBoulderAreaError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DownloadedBoulderAreaError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'DownloadedBoulderAreaStates.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $DownloadedBoulderAreaErrorCopyWith<$Res> implements $DownloadedBoulderAreaStatesCopyWith<$Res> {
  factory $DownloadedBoulderAreaErrorCopyWith(DownloadedBoulderAreaError value, $Res Function(DownloadedBoulderAreaError) _then) = _$DownloadedBoulderAreaErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$DownloadedBoulderAreaErrorCopyWithImpl<$Res>
    implements $DownloadedBoulderAreaErrorCopyWith<$Res> {
  _$DownloadedBoulderAreaErrorCopyWithImpl(this._self, this._then);

  final DownloadedBoulderAreaError _self;
  final $Res Function(DownloadedBoulderAreaError) _then;

/// Create a copy of DownloadedBoulderAreaStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(DownloadedBoulderAreaError(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
