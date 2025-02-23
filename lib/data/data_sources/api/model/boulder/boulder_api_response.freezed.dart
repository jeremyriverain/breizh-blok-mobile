// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_api_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoulderApiResponse {
  PaginatedCollection<Boulder>? get data => throw _privateConstructorUsedError;
  Object? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoulderApiResponseCopyWith<BoulderApiResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoulderApiResponseCopyWith<$Res> {
  factory $BoulderApiResponseCopyWith(
          BoulderApiResponse value, $Res Function(BoulderApiResponse) then) =
      _$BoulderApiResponseCopyWithImpl<$Res, BoulderApiResponse>;
  @useResult
  $Res call({PaginatedCollection<Boulder>? data, Object? error});
}

/// @nodoc
class _$BoulderApiResponseCopyWithImpl<$Res, $Val extends BoulderApiResponse>
    implements $BoulderApiResponseCopyWith<$Res> {
  _$BoulderApiResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaginatedCollection<Boulder>?,
      error: freezed == error ? _value.error : error,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoulderApiResponseImplCopyWith<$Res>
    implements $BoulderApiResponseCopyWith<$Res> {
  factory _$$BoulderApiResponseImplCopyWith(_$BoulderApiResponseImpl value,
          $Res Function(_$BoulderApiResponseImpl) then) =
      __$$BoulderApiResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PaginatedCollection<Boulder>? data, Object? error});
}

/// @nodoc
class __$$BoulderApiResponseImplCopyWithImpl<$Res>
    extends _$BoulderApiResponseCopyWithImpl<$Res, _$BoulderApiResponseImpl>
    implements _$$BoulderApiResponseImplCopyWith<$Res> {
  __$$BoulderApiResponseImplCopyWithImpl(_$BoulderApiResponseImpl _value,
      $Res Function(_$BoulderApiResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? error = freezed,
  }) {
    return _then(_$BoulderApiResponseImpl(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as PaginatedCollection<Boulder>?,
      error: freezed == error ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$BoulderApiResponseImpl implements _BoulderApiResponse {
  const _$BoulderApiResponseImpl({this.data, this.error});

  @override
  final PaginatedCollection<Boulder>? data;
  @override
  final Object? error;

  @override
  String toString() {
    return 'BoulderApiResponse(data: $data, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoulderApiResponseImpl &&
            (identical(other.data, data) || other.data == data) &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, data, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoulderApiResponseImplCopyWith<_$BoulderApiResponseImpl> get copyWith =>
      __$$BoulderApiResponseImplCopyWithImpl<_$BoulderApiResponseImpl>(
          this, _$identity);
}

abstract class _BoulderApiResponse implements BoulderApiResponse {
  const factory _BoulderApiResponse(
      {final PaginatedCollection<Boulder>? data,
      final Object? error}) = _$BoulderApiResponseImpl;

  @override
  PaginatedCollection<Boulder>? get data;
  @override
  Object? get error;
  @override
  @JsonKey(ignore: true)
  _$$BoulderApiResponseImplCopyWith<_$BoulderApiResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
