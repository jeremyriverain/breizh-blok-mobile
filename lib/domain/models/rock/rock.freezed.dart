// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Rock _$RockFromJson(Map<String, dynamic> json) {
  return _Rock.fromJson(json);
}

/// @nodoc
mixin _$Rock {
  @JsonKey(name: '@id')
  String get iri => throw _privateConstructorUsedError;
  BoulderArea get boulderArea => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RockCopyWith<Rock> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RockCopyWith<$Res> {
  factory $RockCopyWith(Rock value, $Res Function(Rock) then) =
      _$RockCopyWithImpl<$Res, Rock>;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      BoulderArea boulderArea,
      Location location});

  $BoulderAreaCopyWith<$Res> get boulderArea;
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$RockCopyWithImpl<$Res, $Val extends Rock>
    implements $RockCopyWith<$Res> {
  _$RockCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? boulderArea = null,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      boulderArea: null == boulderArea
          ? _value.boulderArea
          : boulderArea // ignore: cast_nullable_to_non_nullable
              as BoulderArea,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $BoulderAreaCopyWith<$Res> get boulderArea {
    return $BoulderAreaCopyWith<$Res>(_value.boulderArea, (value) {
      return _then(_value.copyWith(boulderArea: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RockImplCopyWith<$Res> implements $RockCopyWith<$Res> {
  factory _$$RockImplCopyWith(
          _$RockImpl value, $Res Function(_$RockImpl) then) =
      __$$RockImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      BoulderArea boulderArea,
      Location location});

  @override
  $BoulderAreaCopyWith<$Res> get boulderArea;
  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$RockImplCopyWithImpl<$Res>
    extends _$RockCopyWithImpl<$Res, _$RockImpl>
    implements _$$RockImplCopyWith<$Res> {
  __$$RockImplCopyWithImpl(_$RockImpl _value, $Res Function(_$RockImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? boulderArea = null,
    Object? location = null,
  }) {
    return _then(_$RockImpl(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      boulderArea: null == boulderArea
          ? _value.boulderArea
          : boulderArea // ignore: cast_nullable_to_non_nullable
              as BoulderArea,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RockImpl extends _Rock {
  const _$RockImpl(
      {@JsonKey(name: '@id') required this.iri,
      required this.boulderArea,
      required this.location})
      : super._();

  factory _$RockImpl.fromJson(Map<String, dynamic> json) =>
      _$$RockImplFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String iri;
  @override
  final BoulderArea boulderArea;
  @override
  final Location location;

  @override
  String toString() {
    return 'Rock(iri: $iri, boulderArea: $boulderArea, location: $location)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RockImpl &&
            (identical(other.iri, iri) || other.iri == iri) &&
            (identical(other.boulderArea, boulderArea) ||
                other.boulderArea == boulderArea) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iri, boulderArea, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RockImplCopyWith<_$RockImpl> get copyWith =>
      __$$RockImplCopyWithImpl<_$RockImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RockImplToJson(
      this,
    );
  }
}

abstract class _Rock extends Rock {
  const factory _Rock(
      {@JsonKey(name: '@id') required final String iri,
      required final BoulderArea boulderArea,
      required final Location location}) = _$RockImpl;
  const _Rock._() : super._();

  factory _Rock.fromJson(Map<String, dynamic> json) = _$RockImpl.fromJson;

  @override
  @JsonKey(name: '@id')
  String get iri;
  @override
  BoulderArea get boulderArea;
  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$RockImplCopyWith<_$RockImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
