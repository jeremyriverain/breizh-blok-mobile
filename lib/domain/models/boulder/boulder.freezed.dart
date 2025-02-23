// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Boulder _$BoulderFromJson(Map<String, dynamic> json) {
  return _Boulder.fromJson(json);
}

/// @nodoc
mixin _$Boulder {
  @JsonKey(name: '@id')
  String get iri => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  Rock get rock => throw _privateConstructorUsedError;
  List<LineBoulder> get lineBoulders => throw _privateConstructorUsedError;
  Grade? get grade => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  HeightBoulder? get height => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BoulderCopyWith<Boulder> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoulderCopyWith<$Res> {
  factory $BoulderCopyWith(Boulder value, $Res Function(Boulder) then) =
      _$BoulderCopyWithImpl<$Res, Boulder>;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      String name,
      Rock rock,
      List<LineBoulder> lineBoulders,
      Grade? grade,
      String? description,
      HeightBoulder? height});

  $RockCopyWith<$Res> get rock;
  $GradeCopyWith<$Res>? get grade;
  $HeightBoulderCopyWith<$Res>? get height;
}

/// @nodoc
class _$BoulderCopyWithImpl<$Res, $Val extends Boulder>
    implements $BoulderCopyWith<$Res> {
  _$BoulderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? name = null,
    Object? rock = null,
    Object? lineBoulders = null,
    Object? grade = freezed,
    Object? description = freezed,
    Object? height = freezed,
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
      rock: null == rock
          ? _value.rock
          : rock // ignore: cast_nullable_to_non_nullable
              as Rock,
      lineBoulders: null == lineBoulders
          ? _value.lineBoulders
          : lineBoulders // ignore: cast_nullable_to_non_nullable
              as List<LineBoulder>,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as HeightBoulder?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $RockCopyWith<$Res> get rock {
    return $RockCopyWith<$Res>(_value.rock, (value) {
      return _then(_value.copyWith(rock: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $GradeCopyWith<$Res>? get grade {
    if (_value.grade == null) {
      return null;
    }

    return $GradeCopyWith<$Res>(_value.grade!, (value) {
      return _then(_value.copyWith(grade: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $HeightBoulderCopyWith<$Res>? get height {
    if (_value.height == null) {
      return null;
    }

    return $HeightBoulderCopyWith<$Res>(_value.height!, (value) {
      return _then(_value.copyWith(height: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$BoulderImplCopyWith<$Res> implements $BoulderCopyWith<$Res> {
  factory _$$BoulderImplCopyWith(
          _$BoulderImpl value, $Res Function(_$BoulderImpl) then) =
      __$$BoulderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri,
      String name,
      Rock rock,
      List<LineBoulder> lineBoulders,
      Grade? grade,
      String? description,
      HeightBoulder? height});

  @override
  $RockCopyWith<$Res> get rock;
  @override
  $GradeCopyWith<$Res>? get grade;
  @override
  $HeightBoulderCopyWith<$Res>? get height;
}

/// @nodoc
class __$$BoulderImplCopyWithImpl<$Res>
    extends _$BoulderCopyWithImpl<$Res, _$BoulderImpl>
    implements _$$BoulderImplCopyWith<$Res> {
  __$$BoulderImplCopyWithImpl(
      _$BoulderImpl _value, $Res Function(_$BoulderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? name = null,
    Object? rock = null,
    Object? lineBoulders = null,
    Object? grade = freezed,
    Object? description = freezed,
    Object? height = freezed,
  }) {
    return _then(_$BoulderImpl(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      rock: null == rock
          ? _value.rock
          : rock // ignore: cast_nullable_to_non_nullable
              as Rock,
      lineBoulders: null == lineBoulders
          ? _value._lineBoulders
          : lineBoulders // ignore: cast_nullable_to_non_nullable
              as List<LineBoulder>,
      grade: freezed == grade
          ? _value.grade
          : grade // ignore: cast_nullable_to_non_nullable
              as Grade?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as HeightBoulder?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BoulderImpl extends _Boulder {
  const _$BoulderImpl(
      {@JsonKey(name: '@id') required this.iri,
      required this.name,
      required this.rock,
      final List<LineBoulder> lineBoulders = const <LineBoulder>[],
      this.grade,
      this.description,
      this.height})
      : _lineBoulders = lineBoulders,
        super._();

  factory _$BoulderImpl.fromJson(Map<String, dynamic> json) =>
      _$$BoulderImplFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String iri;
  @override
  final String name;
  @override
  final Rock rock;
  final List<LineBoulder> _lineBoulders;
  @override
  @JsonKey()
  List<LineBoulder> get lineBoulders {
    if (_lineBoulders is EqualUnmodifiableListView) return _lineBoulders;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lineBoulders);
  }

  @override
  final Grade? grade;
  @override
  final String? description;
  @override
  final HeightBoulder? height;

  @override
  String toString() {
    return 'Boulder(iri: $iri, name: $name, rock: $rock, lineBoulders: $lineBoulders, grade: $grade, description: $description, height: $height)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoulderImpl &&
            (identical(other.iri, iri) || other.iri == iri) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.rock, rock) || other.rock == rock) &&
            const DeepCollectionEquality()
                .equals(other._lineBoulders, _lineBoulders) &&
            (identical(other.grade, grade) || other.grade == grade) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.height, height) || other.height == height));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      iri,
      name,
      rock,
      const DeepCollectionEquality().hash(_lineBoulders),
      grade,
      description,
      height);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoulderImplCopyWith<_$BoulderImpl> get copyWith =>
      __$$BoulderImplCopyWithImpl<_$BoulderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BoulderImplToJson(
      this,
    );
  }
}

abstract class _Boulder extends Boulder {
  const factory _Boulder(
      {@JsonKey(name: '@id') required final String iri,
      required final String name,
      required final Rock rock,
      final List<LineBoulder> lineBoulders,
      final Grade? grade,
      final String? description,
      final HeightBoulder? height}) = _$BoulderImpl;
  const _Boulder._() : super._();

  factory _Boulder.fromJson(Map<String, dynamic> json) = _$BoulderImpl.fromJson;

  @override
  @JsonKey(name: '@id')
  String get iri;
  @override
  String get name;
  @override
  Rock get rock;
  @override
  List<LineBoulder> get lineBoulders;
  @override
  Grade? get grade;
  @override
  String? get description;
  @override
  HeightBoulder? get height;
  @override
  @JsonKey(ignore: true)
  _$$BoulderImplCopyWith<_$BoulderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
