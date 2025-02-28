// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'municipality.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Municipality {

@JsonKey(name: '@id') String get iri; String get name; List<BoulderArea> get boulderAreas; Location? get centroid;
/// Create a copy of Municipality
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MunicipalityCopyWith<Municipality> get copyWith => _$MunicipalityCopyWithImpl<Municipality>(this as Municipality, _$identity);

  /// Serializes this Municipality to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Municipality&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other.boulderAreas, boulderAreas)&&(identical(other.centroid, centroid) || other.centroid == centroid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,const DeepCollectionEquality().hash(boulderAreas),centroid);

@override
String toString() {
  return 'Municipality(iri: $iri, name: $name, boulderAreas: $boulderAreas, centroid: $centroid)';
}


}

/// @nodoc
abstract mixin class $MunicipalityCopyWith<$Res>  {
  factory $MunicipalityCopyWith(Municipality value, $Res Function(Municipality) _then) = _$MunicipalityCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, List<BoulderArea> boulderAreas, Location? centroid
});


$LocationCopyWith<$Res>? get centroid;

}
/// @nodoc
class _$MunicipalityCopyWithImpl<$Res>
    implements $MunicipalityCopyWith<$Res> {
  _$MunicipalityCopyWithImpl(this._self, this._then);

  final Municipality _self;
  final $Res Function(Municipality) _then;

/// Create a copy of Municipality
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? name = null,Object? boulderAreas = null,Object? centroid = freezed,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boulderAreas: null == boulderAreas ? _self.boulderAreas : boulderAreas // ignore: cast_nullable_to_non_nullable
as List<BoulderArea>,centroid: freezed == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}
/// Create a copy of Municipality
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get centroid {
    if (_self.centroid == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.centroid!, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Municipality extends Municipality {
  const _Municipality({@JsonKey(name: '@id') required this.iri, required this.name, final  List<BoulderArea> boulderAreas = const <BoulderArea>[], this.centroid}): _boulderAreas = boulderAreas,super._();
  factory _Municipality.fromJson(Map<String, dynamic> json) => _$MunicipalityFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  String name;
 final  List<BoulderArea> _boulderAreas;
@override@JsonKey() List<BoulderArea> get boulderAreas {
  if (_boulderAreas is EqualUnmodifiableListView) return _boulderAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boulderAreas);
}

@override final  Location? centroid;

/// Create a copy of Municipality
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MunicipalityCopyWith<_Municipality> get copyWith => __$MunicipalityCopyWithImpl<_Municipality>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MunicipalityToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Municipality&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&const DeepCollectionEquality().equals(other._boulderAreas, _boulderAreas)&&(identical(other.centroid, centroid) || other.centroid == centroid));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,const DeepCollectionEquality().hash(_boulderAreas),centroid);

@override
String toString() {
  return 'Municipality(iri: $iri, name: $name, boulderAreas: $boulderAreas, centroid: $centroid)';
}


}

/// @nodoc
abstract mixin class _$MunicipalityCopyWith<$Res> implements $MunicipalityCopyWith<$Res> {
  factory _$MunicipalityCopyWith(_Municipality value, $Res Function(_Municipality) _then) = __$MunicipalityCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, List<BoulderArea> boulderAreas, Location? centroid
});


@override $LocationCopyWith<$Res>? get centroid;

}
/// @nodoc
class __$MunicipalityCopyWithImpl<$Res>
    implements _$MunicipalityCopyWith<$Res> {
  __$MunicipalityCopyWithImpl(this._self, this._then);

  final _Municipality _self;
  final $Res Function(_Municipality) _then;

/// Create a copy of Municipality
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? name = null,Object? boulderAreas = null,Object? centroid = freezed,}) {
  return _then(_Municipality(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,boulderAreas: null == boulderAreas ? _self._boulderAreas : boulderAreas // ignore: cast_nullable_to_non_nullable
as List<BoulderArea>,centroid: freezed == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Location?,
  ));
}

/// Create a copy of Municipality
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get centroid {
    if (_self.centroid == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.centroid!, (value) {
    return _then(_self.copyWith(centroid: value));
  });
}
}

// dart format on
