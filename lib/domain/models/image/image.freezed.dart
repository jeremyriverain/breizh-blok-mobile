// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Image {

 String get contentUrl; String? get filterUrl; List<String>? get imageDimensions;
/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ImageCopyWith<Image> get copyWith => _$ImageCopyWithImpl<Image>(this as Image, _$identity);

  /// Serializes this Image to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Image&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.filterUrl, filterUrl) || other.filterUrl == filterUrl)&&const DeepCollectionEquality().equals(other.imageDimensions, imageDimensions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentUrl,filterUrl,const DeepCollectionEquality().hash(imageDimensions));

@override
String toString() {
  return 'Image(contentUrl: $contentUrl, filterUrl: $filterUrl, imageDimensions: $imageDimensions)';
}


}

/// @nodoc
abstract mixin class $ImageCopyWith<$Res>  {
  factory $ImageCopyWith(Image value, $Res Function(Image) _then) = _$ImageCopyWithImpl;
@useResult
$Res call({
 String contentUrl, String? filterUrl, List<String>? imageDimensions
});



}
/// @nodoc
class _$ImageCopyWithImpl<$Res>
    implements $ImageCopyWith<$Res> {
  _$ImageCopyWithImpl(this._self, this._then);

  final Image _self;
  final $Res Function(Image) _then;

/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? contentUrl = null,Object? filterUrl = freezed,Object? imageDimensions = freezed,}) {
  return _then(_self.copyWith(
contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,filterUrl: freezed == filterUrl ? _self.filterUrl : filterUrl // ignore: cast_nullable_to_non_nullable
as String?,imageDimensions: freezed == imageDimensions ? _self.imageDimensions : imageDimensions // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Image extends Image {
  const _Image({required this.contentUrl, this.filterUrl, final  List<String>? imageDimensions}): _imageDimensions = imageDimensions,super._();
  factory _Image.fromJson(Map<String, dynamic> json) => _$ImageFromJson(json);

@override final  String contentUrl;
@override final  String? filterUrl;
 final  List<String>? _imageDimensions;
@override List<String>? get imageDimensions {
  final value = _imageDimensions;
  if (value == null) return null;
  if (_imageDimensions is EqualUnmodifiableListView) return _imageDimensions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ImageCopyWith<_Image> get copyWith => __$ImageCopyWithImpl<_Image>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ImageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Image&&(identical(other.contentUrl, contentUrl) || other.contentUrl == contentUrl)&&(identical(other.filterUrl, filterUrl) || other.filterUrl == filterUrl)&&const DeepCollectionEquality().equals(other._imageDimensions, _imageDimensions));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,contentUrl,filterUrl,const DeepCollectionEquality().hash(_imageDimensions));

@override
String toString() {
  return 'Image(contentUrl: $contentUrl, filterUrl: $filterUrl, imageDimensions: $imageDimensions)';
}


}

/// @nodoc
abstract mixin class _$ImageCopyWith<$Res> implements $ImageCopyWith<$Res> {
  factory _$ImageCopyWith(_Image value, $Res Function(_Image) _then) = __$ImageCopyWithImpl;
@override @useResult
$Res call({
 String contentUrl, String? filterUrl, List<String>? imageDimensions
});



}
/// @nodoc
class __$ImageCopyWithImpl<$Res>
    implements _$ImageCopyWith<$Res> {
  __$ImageCopyWithImpl(this._self, this._then);

  final _Image _self;
  final $Res Function(_Image) _then;

/// Create a copy of Image
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? contentUrl = null,Object? filterUrl = freezed,Object? imageDimensions = freezed,}) {
  return _then(_Image(
contentUrl: null == contentUrl ? _self.contentUrl : contentUrl // ignore: cast_nullable_to_non_nullable
as String,filterUrl: freezed == filterUrl ? _self.filterUrl : filterUrl // ignore: cast_nullable_to_non_nullable
as String?,imageDimensions: freezed == imageDimensions ? _self._imageDimensions : imageDimensions // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
