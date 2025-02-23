// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'height_boulder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HeightBoulder _$HeightBoulderFromJson(Map<String, dynamic> json) {
  return _HeightBoulder.fromJson(json);
}

/// @nodoc
mixin _$HeightBoulder {
  @JsonKey(name: '@id')
  String get iri => throw _privateConstructorUsedError;
  int get min => throw _privateConstructorUsedError;
  int? get max => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $HeightBoulderCopyWith<HeightBoulder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HeightBoulderCopyWith<$Res> {
  factory $HeightBoulderCopyWith(
          HeightBoulder value, $Res Function(HeightBoulder) then) =
      _$HeightBoulderCopyWithImpl<$Res, HeightBoulder>;
  @useResult
  $Res call({@JsonKey(name: '@id') String iri, int min, int? max});
}

/// @nodoc
class _$HeightBoulderCopyWithImpl<$Res, $Val extends HeightBoulder>
    implements $HeightBoulderCopyWith<$Res> {
  _$HeightBoulderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? min = null,
    Object? max = freezed,
  }) {
    return _then(_value.copyWith(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HeightBoulderImplCopyWith<$Res>
    implements $HeightBoulderCopyWith<$Res> {
  factory _$$HeightBoulderImplCopyWith(
          _$HeightBoulderImpl value, $Res Function(_$HeightBoulderImpl) then) =
      __$$HeightBoulderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({@JsonKey(name: '@id') String iri, int min, int? max});
}

/// @nodoc
class __$$HeightBoulderImplCopyWithImpl<$Res>
    extends _$HeightBoulderCopyWithImpl<$Res, _$HeightBoulderImpl>
    implements _$$HeightBoulderImplCopyWith<$Res> {
  __$$HeightBoulderImplCopyWithImpl(
      _$HeightBoulderImpl _value, $Res Function(_$HeightBoulderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? min = null,
    Object? max = freezed,
  }) {
    return _then(_$HeightBoulderImpl(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      min: null == min
          ? _value.min
          : min // ignore: cast_nullable_to_non_nullable
              as int,
      max: freezed == max
          ? _value.max
          : max // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HeightBoulderImpl implements _HeightBoulder {
  const _$HeightBoulderImpl(
      {@JsonKey(name: '@id') required this.iri, required this.min, this.max});

  factory _$HeightBoulderImpl.fromJson(Map<String, dynamic> json) =>
      _$$HeightBoulderImplFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String iri;
  @override
  final int min;
  @override
  final int? max;

  @override
  String toString() {
    return 'HeightBoulder(iri: $iri, min: $min, max: $max)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HeightBoulderImpl &&
            (identical(other.iri, iri) || other.iri == iri) &&
            (identical(other.min, min) || other.min == min) &&
            (identical(other.max, max) || other.max == max));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iri, min, max);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$HeightBoulderImplCopyWith<_$HeightBoulderImpl> get copyWith =>
      __$$HeightBoulderImplCopyWithImpl<_$HeightBoulderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HeightBoulderImplToJson(
      this,
    );
  }
}

abstract class _HeightBoulder implements HeightBoulder {
  const factory _HeightBoulder(
      {@JsonKey(name: '@id') required final String iri,
      required final int min,
      final int? max}) = _$HeightBoulderImpl;

  factory _HeightBoulder.fromJson(Map<String, dynamic> json) =
      _$HeightBoulderImpl.fromJson;

  @override
  @JsonKey(name: '@id')
  String get iri;
  @override
  int get min;
  @override
  int? get max;
  @override
  @JsonKey(ignore: true)
  _$$HeightBoulderImplCopyWith<_$HeightBoulderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
