// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'api_order_param.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ApiOrderParam {
  String get name => throw _privateConstructorUsedError;
  String get direction => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ApiOrderParamCopyWith<ApiOrderParam> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ApiOrderParamCopyWith<$Res> {
  factory $ApiOrderParamCopyWith(
          ApiOrderParam value, $Res Function(ApiOrderParam) then) =
      _$ApiOrderParamCopyWithImpl<$Res, ApiOrderParam>;
  @useResult
  $Res call({String name, String direction});
}

/// @nodoc
class _$ApiOrderParamCopyWithImpl<$Res, $Val extends ApiOrderParam>
    implements $ApiOrderParamCopyWith<$Res> {
  _$ApiOrderParamCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? direction = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ApiOrderParamImplCopyWith<$Res>
    implements $ApiOrderParamCopyWith<$Res> {
  factory _$$ApiOrderParamImplCopyWith(
          _$ApiOrderParamImpl value, $Res Function(_$ApiOrderParamImpl) then) =
      __$$ApiOrderParamImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, String direction});
}

/// @nodoc
class __$$ApiOrderParamImplCopyWithImpl<$Res>
    extends _$ApiOrderParamCopyWithImpl<$Res, _$ApiOrderParamImpl>
    implements _$$ApiOrderParamImplCopyWith<$Res> {
  __$$ApiOrderParamImplCopyWithImpl(
      _$ApiOrderParamImpl _value, $Res Function(_$ApiOrderParamImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? direction = null,
  }) {
    return _then(_$ApiOrderParamImpl(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      direction: null == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ApiOrderParamImpl implements _ApiOrderParam {
  const _$ApiOrderParamImpl({required this.name, required this.direction});

  @override
  final String name;
  @override
  final String direction;

  @override
  String toString() {
    return 'ApiOrderParam(name: $name, direction: $direction)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ApiOrderParamImpl &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.direction, direction) ||
                other.direction == direction));
  }

  @override
  int get hashCode => Object.hash(runtimeType, name, direction);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ApiOrderParamImplCopyWith<_$ApiOrderParamImpl> get copyWith =>
      __$$ApiOrderParamImplCopyWithImpl<_$ApiOrderParamImpl>(this, _$identity);
}

abstract class _ApiOrderParam implements ApiOrderParam {
  const factory _ApiOrderParam(
      {required final String name,
      required final String direction}) = _$ApiOrderParamImpl;

  @override
  String get name;
  @override
  String get direction;
  @override
  @JsonKey(ignore: true)
  _$$ApiOrderParamImplCopyWith<_$ApiOrderParamImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
