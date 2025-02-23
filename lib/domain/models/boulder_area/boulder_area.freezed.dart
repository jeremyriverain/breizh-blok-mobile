// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BoulderArea _$BoulderAreaFromJson(Map<String, dynamic> json) {
  return _BoulderArea.fromJson(json);
}

/// @nodoc
mixin _$BoulderArea {
  @JsonKey(name: '@id')
  String get iri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Municipality? get municipality => throw _privateConstructorUsedError;
  Location? get centroid => throw _privateConstructorUsedError;
  Location? get parkingLocation => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  int? get numberOfBoulders => throw _privateConstructorUsedError;
  Grade? get lowestGrade => throw _privateConstructorUsedError;
  Grade? get highestGrade => throw _privateConstructorUsedError;
  Map<String, int>? get numberOfBouldersGroupedByGrade =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoulderAreaCopyWith<BoulderArea> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoulderAreaCopyWith<$Res> {
  factory $BoulderAreaCopyWith(
          BoulderArea value, $Res Function(BoulderArea) then) =
      _$BoulderAreaCopyWithImpl<$Res, BoulderArea>;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      String name,
      Municipality? municipality,
      Location? centroid,
      Location? parkingLocation,
      String? description,
      int? numberOfBoulders,
      Grade? lowestGrade,
      Grade? highestGrade,
      Map<String, int>? numberOfBouldersGroupedByGrade});

  $MunicipalityCopyWith<$Res>? get municipality;
  $LocationCopyWith<$Res>? get centroid;
  $LocationCopyWith<$Res>? get parkingLocation;
  $GradeCopyWith<$Res>? get lowestGrade;
  $GradeCopyWith<$Res>? get highestGrade;
}

/// @nodoc
class _$BoulderAreaCopyWithImpl<$Res, $Val extends BoulderArea>
    implements $BoulderAreaCopyWith<$Res> {
  _$BoulderAreaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? name = null,
    Object? municipality = freezed,
    Object? centroid = freezed,
    Object? parkingLocation = freezed,
    Object? description = freezed,
    Object? numberOfBoulders = freezed,
    Object? lowestGrade = freezed,
    Object? highestGrade = freezed,
    Object? numberOfBouldersGroupedByGrade = freezed,
  }) {
    return _then(_value.copyWith(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as Municipality?,
      centroid: freezed == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Location?,
      parkingLocation: freezed == parkingLocation
          ? _value.parkingLocation
          : parkingLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfBoulders: freezed == numberOfBoulders
          ? _value.numberOfBoulders
          : numberOfBoulders // ignore: cast_nullable_to_non_nullable
              as int?,
      lowestGrade: freezed == lowestGrade
          ? _value.lowestGrade
          : lowestGrade // ignore: cast_nullable_to_non_nullable
              as Grade?,
      highestGrade: freezed == highestGrade
          ? _value.highestGrade
          : highestGrade // ignore: cast_nullable_to_non_nullable
              as Grade?,
      numberOfBouldersGroupedByGrade: freezed == numberOfBouldersGroupedByGrade
          ? _value.numberOfBouldersGroupedByGrade
          : numberOfBouldersGroupedByGrade // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MunicipalityCopyWith<$Res>? get municipality {
    if (_value.municipality == null) {
      return null;
    }

    return $MunicipalityCopyWith<$Res>(_value.municipality!, (value) {
      return _then(_value.copyWith(municipality: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get centroid {
    if (_value.centroid == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.centroid!, (value) {
      return _then(_value.copyWith(centroid: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res>? get parkingLocation {
    if (_value.parkingLocation == null) {
      return null;
    }

    return $LocationCopyWith<$Res>(_value.parkingLocation!, (value) {
      return _then(_value.copyWith(parkingLocation: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GradeCopyWith<$Res>? get lowestGrade {
    if (_value.lowestGrade == null) {
      return null;
    }

    return $GradeCopyWith<$Res>(_value.lowestGrade!, (value) {
      return _then(_value.copyWith(lowestGrade: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GradeCopyWith<$Res>? get highestGrade {
    if (_value.highestGrade == null) {
      return null;
    }

    return $GradeCopyWith<$Res>(_value.highestGrade!, (value) {
      return _then(_value.copyWith(highestGrade: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoulderAreaImplCopyWith<$Res>
    implements $BoulderAreaCopyWith<$Res> {
  factory _$$BoulderAreaImplCopyWith(
          _$BoulderAreaImpl value, $Res Function(_$BoulderAreaImpl) then) =
      __$$BoulderAreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      String name,
      Municipality? municipality,
      Location? centroid,
      Location? parkingLocation,
      String? description,
      int? numberOfBoulders,
      Grade? lowestGrade,
      Grade? highestGrade,
      Map<String, int>? numberOfBouldersGroupedByGrade});

  @override
  $MunicipalityCopyWith<$Res>? get municipality;
  @override
  $LocationCopyWith<$Res>? get centroid;
  @override
  $LocationCopyWith<$Res>? get parkingLocation;
  @override
  $GradeCopyWith<$Res>? get lowestGrade;
  @override
  $GradeCopyWith<$Res>? get highestGrade;
}

/// @nodoc
class __$$BoulderAreaImplCopyWithImpl<$Res>
    extends _$BoulderAreaCopyWithImpl<$Res, _$BoulderAreaImpl>
    implements _$$BoulderAreaImplCopyWith<$Res> {
  __$$BoulderAreaImplCopyWithImpl(
      _$BoulderAreaImpl _value, $Res Function(_$BoulderAreaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? name = null,
    Object? municipality = freezed,
    Object? centroid = freezed,
    Object? parkingLocation = freezed,
    Object? description = freezed,
    Object? numberOfBoulders = freezed,
    Object? lowestGrade = freezed,
    Object? highestGrade = freezed,
    Object? numberOfBouldersGroupedByGrade = freezed,
  }) {
    return _then(_$BoulderAreaImpl(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      municipality: freezed == municipality
          ? _value.municipality
          : municipality // ignore: cast_nullable_to_non_nullable
              as Municipality?,
      centroid: freezed == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Location?,
      parkingLocation: freezed == parkingLocation
          ? _value.parkingLocation
          : parkingLocation // ignore: cast_nullable_to_non_nullable
              as Location?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      numberOfBoulders: freezed == numberOfBoulders
          ? _value.numberOfBoulders
          : numberOfBoulders // ignore: cast_nullable_to_non_nullable
              as int?,
      lowestGrade: freezed == lowestGrade
          ? _value.lowestGrade
          : lowestGrade // ignore: cast_nullable_to_non_nullable
              as Grade?,
      highestGrade: freezed == highestGrade
          ? _value.highestGrade
          : highestGrade // ignore: cast_nullable_to_non_nullable
              as Grade?,
      numberOfBouldersGroupedByGrade: freezed == numberOfBouldersGroupedByGrade
          ? _value._numberOfBouldersGroupedByGrade
          : numberOfBouldersGroupedByGrade // ignore: cast_nullable_to_non_nullable
              as Map<String, int>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoulderAreaImpl extends _BoulderArea {
  const _$BoulderAreaImpl(
      {@JsonKey(name: '@id') required this.iri,
      required this.name,
      this.municipality,
      this.centroid,
      this.parkingLocation,
      this.description,
      this.numberOfBoulders,
      this.lowestGrade,
      this.highestGrade,
      final Map<String, int>? numberOfBouldersGroupedByGrade})
      : _numberOfBouldersGroupedByGrade = numberOfBouldersGroupedByGrade,
        super._();

  factory _$BoulderAreaImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoulderAreaImplFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String iri;
  @override
  final String name;
  @override
  final Municipality? municipality;
  @override
  final Location? centroid;
  @override
  final Location? parkingLocation;
  @override
  final String? description;
  @override
  final int? numberOfBoulders;
  @override
  final Grade? lowestGrade;
  @override
  final Grade? highestGrade;
  final Map<String, int>? _numberOfBouldersGroupedByGrade;
  @override
  Map<String, int>? get numberOfBouldersGroupedByGrade {
    final value = _numberOfBouldersGroupedByGrade;
    if (value == null) return null;
    if (_numberOfBouldersGroupedByGrade is EqualUnmodifiableMapView)
      return _numberOfBouldersGroupedByGrade;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'BoulderArea(iri: $iri, name: $name, municipality: $municipality, centroid: $centroid, parkingLocation: $parkingLocation, description: $description, numberOfBoulders: $numberOfBoulders, lowestGrade: $lowestGrade, highestGrade: $highestGrade, numberOfBouldersGroupedByGrade: $numberOfBouldersGroupedByGrade)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoulderAreaImpl &&
            (identical(other.iri, iri) || other.iri == iri) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.municipality, municipality) ||
                other.municipality == municipality) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid) &&
            (identical(other.parkingLocation, parkingLocation) ||
                other.parkingLocation == parkingLocation) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.numberOfBoulders, numberOfBoulders) ||
                other.numberOfBoulders == numberOfBoulders) &&
            (identical(other.lowestGrade, lowestGrade) ||
                other.lowestGrade == lowestGrade) &&
            (identical(other.highestGrade, highestGrade) ||
                other.highestGrade == highestGrade) &&
            const DeepCollectionEquality().equals(
                other._numberOfBouldersGroupedByGrade,
                _numberOfBouldersGroupedByGrade));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      iri,
      name,
      municipality,
      centroid,
      parkingLocation,
      description,
      numberOfBoulders,
      lowestGrade,
      highestGrade,
      const DeepCollectionEquality().hash(_numberOfBouldersGroupedByGrade));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoulderAreaImplCopyWith<_$BoulderAreaImpl> get copyWith =>
      __$$BoulderAreaImplCopyWithImpl<_$BoulderAreaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoulderAreaImplToJson(
      this,
    );
  }
}

abstract class _BoulderArea extends BoulderArea {
  const factory _BoulderArea(
          {@JsonKey(name: '@id') required final String iri,
          required final String name,
          final Municipality? municipality,
          final Location? centroid,
          final Location? parkingLocation,
          final String? description,
          final int? numberOfBoulders,
          final Grade? lowestGrade,
          final Grade? highestGrade,
          final Map<String, int>? numberOfBouldersGroupedByGrade}) =
      _$BoulderAreaImpl;
  const _BoulderArea._() : super._();

  factory _BoulderArea.fromJson(Map<String, dynamic> json) =
      _$BoulderAreaImpl.fromJson;

  @override
  @JsonKey(name: '@id')
  String get iri;
  @override
  String get name;
  @override
  Municipality? get municipality;
  @override
  Location? get centroid;
  @override
  Location? get parkingLocation;
  @override
  String? get description;
  @override
  int? get numberOfBoulders;
  @override
  Grade? get lowestGrade;
  @override
  Grade? get highestGrade;
  @override
  Map<String, int>? get numberOfBouldersGroupedByGrade;
  @override
  @JsonKey(ignore: true)
  _$$BoulderAreaImplCopyWith<_$BoulderAreaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
