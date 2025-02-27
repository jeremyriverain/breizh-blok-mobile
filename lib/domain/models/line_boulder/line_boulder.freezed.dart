// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'line_boulder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LineBoulder {

@JsonKey(name: '@id') String get iri; String get smoothLine; Image get rockImage;
/// Create a copy of LineBoulder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LineBoulderCopyWith<LineBoulder> get copyWith => _$LineBoulderCopyWithImpl<LineBoulder>(this as LineBoulder, _$identity);

  /// Serializes this LineBoulder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LineBoulder&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.smoothLine, smoothLine) || other.smoothLine == smoothLine)&&(identical(other.rockImage, rockImage) || other.rockImage == rockImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,smoothLine,rockImage);

@override
String toString() {
  return 'LineBoulder(iri: $iri, smoothLine: $smoothLine, rockImage: $rockImage)';
}


}

/// @nodoc
abstract mixin class $LineBoulderCopyWith<$Res>  {
  factory $LineBoulderCopyWith(LineBoulder value, $Res Function(LineBoulder) _then) = _$LineBoulderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, String smoothLine, Image rockImage
});


$ImageCopyWith<$Res> get rockImage;

}
/// @nodoc
class _$LineBoulderCopyWithImpl<$Res>
    implements $LineBoulderCopyWith<$Res> {
  _$LineBoulderCopyWithImpl(this._self, this._then);

  final LineBoulder _self;
  final $Res Function(LineBoulder) _then;

/// Create a copy of LineBoulder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? smoothLine = null,Object? rockImage = null,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,smoothLine: null == smoothLine ? _self.smoothLine : smoothLine // ignore: cast_nullable_to_non_nullable
as String,rockImage: null == rockImage ? _self.rockImage : rockImage // ignore: cast_nullable_to_non_nullable
as Image,
  ));
}
/// Create a copy of LineBoulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageCopyWith<$Res> get rockImage {
  
  return $ImageCopyWith<$Res>(_self.rockImage, (value) {
    return _then(_self.copyWith(rockImage: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _LineBoulder implements LineBoulder {
  const _LineBoulder({@JsonKey(name: '@id') required this.iri, required this.smoothLine, required this.rockImage});
  factory _LineBoulder.fromJson(Map<String, dynamic> json) => _$LineBoulderFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  String smoothLine;
@override final  Image rockImage;

/// Create a copy of LineBoulder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LineBoulderCopyWith<_LineBoulder> get copyWith => __$LineBoulderCopyWithImpl<_LineBoulder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LineBoulderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LineBoulder&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.smoothLine, smoothLine) || other.smoothLine == smoothLine)&&(identical(other.rockImage, rockImage) || other.rockImage == rockImage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,smoothLine,rockImage);

@override
String toString() {
  return 'LineBoulder(iri: $iri, smoothLine: $smoothLine, rockImage: $rockImage)';
}


}

/// @nodoc
abstract mixin class _$LineBoulderCopyWith<$Res> implements $LineBoulderCopyWith<$Res> {
  factory _$LineBoulderCopyWith(_LineBoulder value, $Res Function(_LineBoulder) _then) = __$LineBoulderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, String smoothLine, Image rockImage
});


@override $ImageCopyWith<$Res> get rockImage;

}
/// @nodoc
class __$LineBoulderCopyWithImpl<$Res>
    implements _$LineBoulderCopyWith<$Res> {
  __$LineBoulderCopyWithImpl(this._self, this._then);

  final _LineBoulder _self;
  final $Res Function(_LineBoulder) _then;

/// Create a copy of LineBoulder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? smoothLine = null,Object? rockImage = null,}) {
  return _then(_LineBoulder(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,smoothLine: null == smoothLine ? _self.smoothLine : smoothLine // ignore: cast_nullable_to_non_nullable
as String,rockImage: null == rockImage ? _self.rockImage : rockImage // ignore: cast_nullable_to_non_nullable
as Image,
  ));
}

/// Create a copy of LineBoulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ImageCopyWith<$Res> get rockImage {
  
  return $ImageCopyWith<$Res>(_self.rockImage, (value) {
    return _then(_self.copyWith(rockImage: value));
  });
}
}

// dart format on
