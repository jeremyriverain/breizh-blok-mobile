// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'municipality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Municipality _$MunicipalityFromJson(Map<String, dynamic> json) {
  return _Municipality.fromJson(json);
}

/// @nodoc
mixin _$Municipality {
  @JsonKey(name: '@id')
  String get iri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  List<BoulderArea> get boulderAreas => throw _privateConstructorUsedError;
  Location? get centroid => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MunicipalityCopyWith<Municipality> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MunicipalityCopyWith<$Res> {
  factory $MunicipalityCopyWith(
          Municipality value, $Res Function(Municipality) then) =
      _$MunicipalityCopyWithImpl<$Res, Municipality>;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      String name,
      List<BoulderArea> boulderAreas,
      Location? centroid});

  $LocationCopyWith<$Res>? get centroid;
}

/// @nodoc
class _$MunicipalityCopyWithImpl<$Res, $Val extends Municipality>
    implements $MunicipalityCopyWith<$Res> {
  _$MunicipalityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? name = null,
    Object? boulderAreas = null,
    Object? centroid = freezed,
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
      boulderAreas: null == boulderAreas
          ? _value.boulderAreas
          : boulderAreas // ignore: cast_nullable_to_non_nullable
              as List<BoulderArea>,
      centroid: freezed == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Location?,
    ) as $Val);
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
}

/// @nodoc
abstract class _$$MunicipalityImplCopyWith<$Res>
    implements $MunicipalityCopyWith<$Res> {
  factory _$$MunicipalityImplCopyWith(
          _$MunicipalityImpl value, $Res Function(_$MunicipalityImpl) then) =
      __$$MunicipalityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      String name,
      List<BoulderArea> boulderAreas,
      Location? centroid});

  @override
  $LocationCopyWith<$Res>? get centroid;
}

/// @nodoc
class __$$MunicipalityImplCopyWithImpl<$Res>
    extends _$MunicipalityCopyWithImpl<$Res, _$MunicipalityImpl>
    implements _$$MunicipalityImplCopyWith<$Res> {
  __$$MunicipalityImplCopyWithImpl(
      _$MunicipalityImpl _value, $Res Function(_$MunicipalityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? name = null,
    Object? boulderAreas = null,
    Object? centroid = freezed,
  }) {
    return _then(_$MunicipalityImpl(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      boulderAreas: null == boulderAreas
          ? _value._boulderAreas
          : boulderAreas // ignore: cast_nullable_to_non_nullable
              as List<BoulderArea>,
      centroid: freezed == centroid
          ? _value.centroid
          : centroid // ignore: cast_nullable_to_non_nullable
              as Location?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MunicipalityImpl extends _Municipality {
  const _$MunicipalityImpl(
      {@JsonKey(name: '@id') required this.iri,
      required this.name,
      final List<BoulderArea> boulderAreas = const <BoulderArea>[],
      this.centroid})
      : _boulderAreas = boulderAreas,
        super._();

  factory _$MunicipalityImpl.fromJson(Map<String, dynamic> json) =>
      _$$MunicipalityImplFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String iri;
  @override
  final String name;
  final List<BoulderArea> _boulderAreas;
  @override
  @JsonKey()
  List<BoulderArea> get boulderAreas {
    if (_boulderAreas is EqualUnmodifiableListView) return _boulderAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_boulderAreas);
  }

  @override
  final Location? centroid;

  @override
  String toString() {
    return 'Municipality(iri: $iri, name: $name, boulderAreas: $boulderAreas, centroid: $centroid)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MunicipalityImpl &&
            (identical(other.iri, iri) || other.iri == iri) &&
            (identical(other.name, name) || other.name == name) &&
            const DeepCollectionEquality()
                .equals(other._boulderAreas, _boulderAreas) &&
            (identical(other.centroid, centroid) ||
                other.centroid == centroid));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iri, name,
      const DeepCollectionEquality().hash(_boulderAreas), centroid);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MunicipalityImplCopyWith<_$MunicipalityImpl> get copyWith =>
      __$$MunicipalityImplCopyWithImpl<_$MunicipalityImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MunicipalityImplToJson(
      this,
    );
  }
}

abstract class _Municipality extends Municipality {
  const factory _Municipality(
      {@JsonKey(name: '@id') required final String iri,
      required final String name,
      final List<BoulderArea> boulderAreas,
      final Location? centroid}) = _$MunicipalityImpl;
  const _Municipality._() : super._();

  factory _Municipality.fromJson(Map<String, dynamic> json) =
      _$MunicipalityImpl.fromJson;

  @override
  @JsonKey(name: '@id')
  String get iri;
  @override
  String get name;
  @override
  List<BoulderArea> get boulderAreas;
  @override
  Location? get centroid;
  @override
  @JsonKey(ignore: true)
  _$$MunicipalityImplCopyWith<_$MunicipalityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
