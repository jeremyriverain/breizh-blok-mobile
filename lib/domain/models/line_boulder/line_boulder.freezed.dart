// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_boulder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LineBoulder _$LineBoulderFromJson(Map<String, dynamic> json) {
  return _LineBoulder.fromJson(json);
}

/// @nodoc
mixin _$LineBoulder {
  @JsonKey(name: '@id')
  String get iri => throw _privateConstructorUsedError;
  String get smoothLine => throw _privateConstructorUsedError;
  Image get rockImage => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LineBoulderCopyWith<LineBoulder> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LineBoulderCopyWith<$Res> {
  factory $LineBoulderCopyWith(
          LineBoulder value, $Res Function(LineBoulder) then) =
      _$LineBoulderCopyWithImpl<$Res, LineBoulder>;
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri, String smoothLine, Image rockImage});

  $ImageCopyWith<$Res> get rockImage;
}

/// @nodoc
class _$LineBoulderCopyWithImpl<$Res, $Val extends LineBoulder>
    implements $LineBoulderCopyWith<$Res> {
  _$LineBoulderCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? smoothLine = null,
    Object? rockImage = null,
  }) {
    return _then(_value.copyWith(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      smoothLine: null == smoothLine
          ? _value.smoothLine
          : smoothLine // ignore: cast_nullable_to_non_nullable
              as String,
      rockImage: null == rockImage
          ? _value.rockImage
          : rockImage // ignore: cast_nullable_to_non_nullable
              as Image,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ImageCopyWith<$Res> get rockImage {
    return $ImageCopyWith<$Res>(_value.rockImage, (value) {
      return _then(_value.copyWith(rockImage: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LineBoulderImplCopyWith<$Res>
    implements $LineBoulderCopyWith<$Res> {
  factory _$$LineBoulderImplCopyWith(
          _$LineBoulderImpl value, $Res Function(_$LineBoulderImpl) then) =
      __$$LineBoulderImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: '@id') String iri, String smoothLine, Image rockImage});

  @override
  $ImageCopyWith<$Res> get rockImage;
}

/// @nodoc
class __$$LineBoulderImplCopyWithImpl<$Res>
    extends _$LineBoulderCopyWithImpl<$Res, _$LineBoulderImpl>
    implements _$$LineBoulderImplCopyWith<$Res> {
  __$$LineBoulderImplCopyWithImpl(
      _$LineBoulderImpl _value, $Res Function(_$LineBoulderImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? iri = null,
    Object? smoothLine = null,
    Object? rockImage = null,
  }) {
    return _then(_$LineBoulderImpl(
      iri: null == iri
          ? _value.iri
          : iri // ignore: cast_nullable_to_non_nullable
              as String,
      smoothLine: null == smoothLine
          ? _value.smoothLine
          : smoothLine // ignore: cast_nullable_to_non_nullable
              as String,
      rockImage: null == rockImage
          ? _value.rockImage
          : rockImage // ignore: cast_nullable_to_non_nullable
              as Image,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LineBoulderImpl implements _LineBoulder {
  const _$LineBoulderImpl(
      {@JsonKey(name: '@id') required this.iri,
      required this.smoothLine,
      required this.rockImage});

  factory _$LineBoulderImpl.fromJson(Map<String, dynamic> json) =>
      _$$LineBoulderImplFromJson(json);

  @override
  @JsonKey(name: '@id')
  final String iri;
  @override
  final String smoothLine;
  @override
  final Image rockImage;

  @override
  String toString() {
    return 'LineBoulder(iri: $iri, smoothLine: $smoothLine, rockImage: $rockImage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LineBoulderImpl &&
            (identical(other.iri, iri) || other.iri == iri) &&
            (identical(other.smoothLine, smoothLine) ||
                other.smoothLine == smoothLine) &&
            (identical(other.rockImage, rockImage) ||
                other.rockImage == rockImage));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, iri, smoothLine, rockImage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LineBoulderImplCopyWith<_$LineBoulderImpl> get copyWith =>
      __$$LineBoulderImplCopyWithImpl<_$LineBoulderImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LineBoulderImplToJson(
      this,
    );
  }
}

abstract class _LineBoulder implements LineBoulder {
  const factory _LineBoulder(
      {@JsonKey(name: '@id') required final String iri,
      required final String smoothLine,
      required final Image rockImage}) = _$LineBoulderImpl;

  factory _LineBoulder.fromJson(Map<String, dynamic> json) =
      _$LineBoulderImpl.fromJson;

  @override
  @JsonKey(name: '@id')
  String get iri;
  @override
  String get smoothLine;
  @override
  Image get rockImage;
  @override
  @JsonKey(ignore: true)
  _$$LineBoulderImplCopyWith<_$LineBoulderImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
