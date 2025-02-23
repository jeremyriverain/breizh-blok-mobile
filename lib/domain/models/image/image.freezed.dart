// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Image _$ImageFromJson(Map<String, dynamic> json) {
  return _Image.fromJson(json);
}

/// @nodoc
mixin _$Image {
  String get contentUrl => throw _privateConstructorUsedError;
  String? get filterUrl => throw _privateConstructorUsedError;
  List<String>? get imageDimensions => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ImageCopyWith<Image> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageCopyWith<$Res> {
  factory $ImageCopyWith(Image value, $Res Function(Image) then) =
      _$ImageCopyWithImpl<$Res, Image>;
  @useResult
  $Res call(
      {String contentUrl, String? filterUrl, List<String>? imageDimensions});
}

/// @nodoc
class _$ImageCopyWithImpl<$Res, $Val extends Image>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentUrl = null,
    Object? filterUrl = freezed,
    Object? imageDimensions = freezed,
  }) {
    return _then(_value.copyWith(
      contentUrl: null == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      filterUrl: freezed == filterUrl
          ? _value.filterUrl
          : filterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageDimensions: freezed == imageDimensions
          ? _value.imageDimensions
          : imageDimensions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ImageImplCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$$ImageImplCopyWith(
          _$ImageImpl value, $Res Function(_$ImageImpl) then) =
      __$$ImageImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String contentUrl, String? filterUrl, List<String>? imageDimensions});
}

/// @nodoc
class __$$ImageImplCopyWithImpl<$Res>
    extends _$ImageCopyWithImpl<$Res, _$ImageImpl>
    implements _$$ImageImplCopyWith<$Res> {
  __$$ImageImplCopyWithImpl(
      _$ImageImpl _value, $Res Function(_$ImageImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? contentUrl = null,
    Object? filterUrl = freezed,
    Object? imageDimensions = freezed,
  }) {
    return _then(_$ImageImpl(
      contentUrl: null == contentUrl
          ? _value.contentUrl
          : contentUrl // ignore: cast_nullable_to_non_nullable
              as String,
      filterUrl: freezed == filterUrl
          ? _value.filterUrl
          : filterUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      imageDimensions: freezed == imageDimensions
          ? _value._imageDimensions
          : imageDimensions // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageImpl extends _Image {
  const _$ImageImpl(
      {required this.contentUrl,
      this.filterUrl,
      final List<String>? imageDimensions})
      : _imageDimensions = imageDimensions,
        super._();

  factory _$ImageImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageImplFromJson(json);

  @override
  final String contentUrl;
  @override
  final String? filterUrl;
  final List<String>? _imageDimensions;
  @override
  List<String>? get imageDimensions {
    final value = _imageDimensions;
    if (value == null) return null;
    if (_imageDimensions is EqualUnmodifiableListView) return _imageDimensions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Image(contentUrl: $contentUrl, filterUrl: $filterUrl, imageDimensions: $imageDimensions)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageImpl &&
            (identical(other.contentUrl, contentUrl) ||
                other.contentUrl == contentUrl) &&
            (identical(other.filterUrl, filterUrl) ||
                other.filterUrl == filterUrl) &&
            const DeepCollectionEquality()
                .equals(other._imageDimensions, _imageDimensions));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, contentUrl, filterUrl,
      const DeepCollectionEquality().hash(_imageDimensions));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      __$$ImageImplCopyWithImpl<_$ImageImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageImplToJson(
      this,
    );
  }
}

abstract class _Image extends Image {
  const factory _Image(
      {required final String contentUrl,
      final String? filterUrl,
      final List<String>? imageDimensions}) = _$ImageImpl;
  const _Image._() : super._();

  factory _Image.fromJson(Map<String, dynamic> json) = _$ImageImpl.fromJson;

  @override
  String get contentUrl;
  @override
  String? get filterUrl;
  @override
  List<String>? get imageDimensions;
  @override
  @JsonKey(ignore: true)
  _$$ImageImplCopyWith<_$ImageImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
