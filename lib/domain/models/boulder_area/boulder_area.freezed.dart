// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoulderArea {

@JsonKey(name: '@id') String get iri; String get name; Municipality? get municipality; Location? get centroid; Location? get parkingLocation; String? get description; int? get numberOfBoulders; Grade? get lowestGrade; Grade? get highestGrade; Map<String, int>? get numberOfBouldersGroupedByGrade;
/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderAreaCopyWith<BoulderArea> get copyWith => _$BoulderAreaCopyWithImpl<BoulderArea>(this as BoulderArea, _$identity);

  /// Serializes this BoulderArea to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderArea&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.centroid, centroid) || other.centroid == centroid)&&(identical(other.parkingLocation, parkingLocation) || other.parkingLocation == parkingLocation)&&(identical(other.description, description) || other.description == description)&&(identical(other.numberOfBoulders, numberOfBoulders) || other.numberOfBoulders == numberOfBoulders)&&(identical(other.lowestGrade, lowestGrade) || other.lowestGrade == lowestGrade)&&(identical(other.highestGrade, highestGrade) || other.highestGrade == highestGrade)&&const DeepCollectionEquality().equals(other.numberOfBouldersGroupedByGrade, numberOfBouldersGroupedByGrade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,municipality,centroid,parkingLocation,description,numberOfBoulders,lowestGrade,highestGrade,const DeepCollectionEquality().hash(numberOfBouldersGroupedByGrade));

@override
String toString() {
  return 'BoulderArea(iri: $iri, name: $name, municipality: $municipality, centroid: $centroid, parkingLocation: $parkingLocation, description: $description, numberOfBoulders: $numberOfBoulders, lowestGrade: $lowestGrade, highestGrade: $highestGrade, numberOfBouldersGroupedByGrade: $numberOfBouldersGroupedByGrade)';
}


}

/// @nodoc
abstract mixin class $BoulderAreaCopyWith<$Res>  {
  factory $BoulderAreaCopyWith(BoulderArea value, $Res Function(BoulderArea) _then) = _$BoulderAreaCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, Municipality? municipality, Location? centroid, Location? parkingLocation, String? description, int? numberOfBoulders, Grade? lowestGrade, Grade? highestGrade, Map<String, int>? numberOfBouldersGroupedByGrade
});


$MunicipalityCopyWith<$Res>? get municipality;$LocationCopyWith<$Res>? get centroid;$LocationCopyWith<$Res>? get parkingLocation;$GradeCopyWith<$Res>? get lowestGrade;$GradeCopyWith<$Res>? get highestGrade;

}
/// @nodoc
class _$BoulderAreaCopyWithImpl<$Res>
    implements $BoulderAreaCopyWith<$Res> {
  _$BoulderAreaCopyWithImpl(this._self, this._then);

  final BoulderArea _self;
  final $Res Function(BoulderArea) _then;

/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? name = null,Object? municipality = freezed,Object? centroid = freezed,Object? parkingLocation = freezed,Object? description = freezed,Object? numberOfBoulders = freezed,Object? lowestGrade = freezed,Object? highestGrade = freezed,Object? numberOfBouldersGroupedByGrade = freezed,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,municipality: freezed == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as Municipality?,centroid: freezed == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Location?,parkingLocation: freezed == parkingLocation ? _self.parkingLocation : parkingLocation // ignore: cast_nullable_to_non_nullable
as Location?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,numberOfBoulders: freezed == numberOfBoulders ? _self.numberOfBoulders : numberOfBoulders // ignore: cast_nullable_to_non_nullable
as int?,lowestGrade: freezed == lowestGrade ? _self.lowestGrade : lowestGrade // ignore: cast_nullable_to_non_nullable
as Grade?,highestGrade: freezed == highestGrade ? _self.highestGrade : highestGrade // ignore: cast_nullable_to_non_nullable
as Grade?,numberOfBouldersGroupedByGrade: freezed == numberOfBouldersGroupedByGrade ? _self.numberOfBouldersGroupedByGrade : numberOfBouldersGroupedByGrade // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}
/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MunicipalityCopyWith<$Res>? get municipality {
    if (_self.municipality == null) {
    return null;
  }

  return $MunicipalityCopyWith<$Res>(_self.municipality!, (value) {
    return _then(_self.copyWith(municipality: value));
  });
}/// Create a copy of BoulderArea
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
}/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get parkingLocation {
    if (_self.parkingLocation == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.parkingLocation!, (value) {
    return _then(_self.copyWith(parkingLocation: value));
  });
}/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeCopyWith<$Res>? get lowestGrade {
    if (_self.lowestGrade == null) {
    return null;
  }

  return $GradeCopyWith<$Res>(_self.lowestGrade!, (value) {
    return _then(_self.copyWith(lowestGrade: value));
  });
}/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeCopyWith<$Res>? get highestGrade {
    if (_self.highestGrade == null) {
    return null;
  }

  return $GradeCopyWith<$Res>(_self.highestGrade!, (value) {
    return _then(_self.copyWith(highestGrade: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _BoulderArea extends BoulderArea {
  const _BoulderArea({@JsonKey(name: '@id') required this.iri, required this.name, this.municipality, this.centroid, this.parkingLocation, this.description, this.numberOfBoulders, this.lowestGrade, this.highestGrade, final  Map<String, int>? numberOfBouldersGroupedByGrade}): _numberOfBouldersGroupedByGrade = numberOfBouldersGroupedByGrade,super._();
  factory _BoulderArea.fromJson(Map<String, dynamic> json) => _$BoulderAreaFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  String name;
@override final  Municipality? municipality;
@override final  Location? centroid;
@override final  Location? parkingLocation;
@override final  String? description;
@override final  int? numberOfBoulders;
@override final  Grade? lowestGrade;
@override final  Grade? highestGrade;
 final  Map<String, int>? _numberOfBouldersGroupedByGrade;
@override Map<String, int>? get numberOfBouldersGroupedByGrade {
  final value = _numberOfBouldersGroupedByGrade;
  if (value == null) return null;
  if (_numberOfBouldersGroupedByGrade is EqualUnmodifiableMapView) return _numberOfBouldersGroupedByGrade;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoulderAreaCopyWith<_BoulderArea> get copyWith => __$BoulderAreaCopyWithImpl<_BoulderArea>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoulderAreaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoulderArea&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&(identical(other.municipality, municipality) || other.municipality == municipality)&&(identical(other.centroid, centroid) || other.centroid == centroid)&&(identical(other.parkingLocation, parkingLocation) || other.parkingLocation == parkingLocation)&&(identical(other.description, description) || other.description == description)&&(identical(other.numberOfBoulders, numberOfBoulders) || other.numberOfBoulders == numberOfBoulders)&&(identical(other.lowestGrade, lowestGrade) || other.lowestGrade == lowestGrade)&&(identical(other.highestGrade, highestGrade) || other.highestGrade == highestGrade)&&const DeepCollectionEquality().equals(other._numberOfBouldersGroupedByGrade, _numberOfBouldersGroupedByGrade));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,municipality,centroid,parkingLocation,description,numberOfBoulders,lowestGrade,highestGrade,const DeepCollectionEquality().hash(_numberOfBouldersGroupedByGrade));

@override
String toString() {
  return 'BoulderArea(iri: $iri, name: $name, municipality: $municipality, centroid: $centroid, parkingLocation: $parkingLocation, description: $description, numberOfBoulders: $numberOfBoulders, lowestGrade: $lowestGrade, highestGrade: $highestGrade, numberOfBouldersGroupedByGrade: $numberOfBouldersGroupedByGrade)';
}


}

/// @nodoc
abstract mixin class _$BoulderAreaCopyWith<$Res> implements $BoulderAreaCopyWith<$Res> {
  factory _$BoulderAreaCopyWith(_BoulderArea value, $Res Function(_BoulderArea) _then) = __$BoulderAreaCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, Municipality? municipality, Location? centroid, Location? parkingLocation, String? description, int? numberOfBoulders, Grade? lowestGrade, Grade? highestGrade, Map<String, int>? numberOfBouldersGroupedByGrade
});


@override $MunicipalityCopyWith<$Res>? get municipality;@override $LocationCopyWith<$Res>? get centroid;@override $LocationCopyWith<$Res>? get parkingLocation;@override $GradeCopyWith<$Res>? get lowestGrade;@override $GradeCopyWith<$Res>? get highestGrade;

}
/// @nodoc
class __$BoulderAreaCopyWithImpl<$Res>
    implements _$BoulderAreaCopyWith<$Res> {
  __$BoulderAreaCopyWithImpl(this._self, this._then);

  final _BoulderArea _self;
  final $Res Function(_BoulderArea) _then;

/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? name = null,Object? municipality = freezed,Object? centroid = freezed,Object? parkingLocation = freezed,Object? description = freezed,Object? numberOfBoulders = freezed,Object? lowestGrade = freezed,Object? highestGrade = freezed,Object? numberOfBouldersGroupedByGrade = freezed,}) {
  return _then(_BoulderArea(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,municipality: freezed == municipality ? _self.municipality : municipality // ignore: cast_nullable_to_non_nullable
as Municipality?,centroid: freezed == centroid ? _self.centroid : centroid // ignore: cast_nullable_to_non_nullable
as Location?,parkingLocation: freezed == parkingLocation ? _self.parkingLocation : parkingLocation // ignore: cast_nullable_to_non_nullable
as Location?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,numberOfBoulders: freezed == numberOfBoulders ? _self.numberOfBoulders : numberOfBoulders // ignore: cast_nullable_to_non_nullable
as int?,lowestGrade: freezed == lowestGrade ? _self.lowestGrade : lowestGrade // ignore: cast_nullable_to_non_nullable
as Grade?,highestGrade: freezed == highestGrade ? _self.highestGrade : highestGrade // ignore: cast_nullable_to_non_nullable
as Grade?,numberOfBouldersGroupedByGrade: freezed == numberOfBouldersGroupedByGrade ? _self._numberOfBouldersGroupedByGrade : numberOfBouldersGroupedByGrade // ignore: cast_nullable_to_non_nullable
as Map<String, int>?,
  ));
}

/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MunicipalityCopyWith<$Res>? get municipality {
    if (_self.municipality == null) {
    return null;
  }

  return $MunicipalityCopyWith<$Res>(_self.municipality!, (value) {
    return _then(_self.copyWith(municipality: value));
  });
}/// Create a copy of BoulderArea
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
}/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LocationCopyWith<$Res>? get parkingLocation {
    if (_self.parkingLocation == null) {
    return null;
  }

  return $LocationCopyWith<$Res>(_self.parkingLocation!, (value) {
    return _then(_self.copyWith(parkingLocation: value));
  });
}/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeCopyWith<$Res>? get lowestGrade {
    if (_self.lowestGrade == null) {
    return null;
  }

  return $GradeCopyWith<$Res>(_self.lowestGrade!, (value) {
    return _then(_self.copyWith(lowestGrade: value));
  });
}/// Create a copy of BoulderArea
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeCopyWith<$Res>? get highestGrade {
    if (_self.highestGrade == null) {
    return null;
  }

  return $GradeCopyWith<$Res>(_self.highestGrade!, (value) {
    return _then(_self.copyWith(highestGrade: value));
  });
}
}

// dart format on
