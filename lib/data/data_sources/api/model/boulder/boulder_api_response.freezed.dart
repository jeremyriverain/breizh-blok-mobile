// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoulderApiResponse {

 PaginatedCollection<Boulder>? get data; Object? get error;
/// Create a copy of BoulderApiResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderApiResponseCopyWith<BoulderApiResponse> get copyWith => _$BoulderApiResponseCopyWithImpl<BoulderApiResponse>(this as BoulderApiResponse, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderApiResponse&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BoulderApiResponse(data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class $BoulderApiResponseCopyWith<$Res>  {
  factory $BoulderApiResponseCopyWith(BoulderApiResponse value, $Res Function(BoulderApiResponse) _then) = _$BoulderApiResponseCopyWithImpl;
@useResult
$Res call({
 PaginatedCollection<Boulder>? data, Object? error
});




}
/// @nodoc
class _$BoulderApiResponseCopyWithImpl<$Res>
    implements $BoulderApiResponseCopyWith<$Res> {
  _$BoulderApiResponseCopyWithImpl(this._self, this._then);

  final BoulderApiResponse _self;
  final $Res Function(BoulderApiResponse) _then;

/// Create a copy of BoulderApiResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = freezed,Object? error = freezed,}) {
  return _then(_self.copyWith(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaginatedCollection<Boulder>?,error: freezed == error ? _self.error : error ,
  ));
}

}


/// @nodoc


class _BoulderApiResponse implements BoulderApiResponse {
  const _BoulderApiResponse({this.data, this.error});
  

@override final  PaginatedCollection<Boulder>? data;
@override final  Object? error;

/// Create a copy of BoulderApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoulderApiResponseCopyWith<_BoulderApiResponse> get copyWith => __$BoulderApiResponseCopyWithImpl<_BoulderApiResponse>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoulderApiResponse&&(identical(other.data, data) || other.data == data)&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,data,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'BoulderApiResponse(data: $data, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BoulderApiResponseCopyWith<$Res> implements $BoulderApiResponseCopyWith<$Res> {
  factory _$BoulderApiResponseCopyWith(_BoulderApiResponse value, $Res Function(_BoulderApiResponse) _then) = __$BoulderApiResponseCopyWithImpl;
@override @useResult
$Res call({
 PaginatedCollection<Boulder>? data, Object? error
});




}
/// @nodoc
class __$BoulderApiResponseCopyWithImpl<$Res>
    implements _$BoulderApiResponseCopyWith<$Res> {
  __$BoulderApiResponseCopyWithImpl(this._self, this._then);

  final _BoulderApiResponse _self;
  final $Res Function(_BoulderApiResponse) _then;

/// Create a copy of BoulderApiResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = freezed,Object? error = freezed,}) {
  return _then(_BoulderApiResponse(
data: freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as PaginatedCollection<Boulder>?,error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
