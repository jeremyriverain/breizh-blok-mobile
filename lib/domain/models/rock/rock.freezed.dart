// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'rock.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Rock {

@JsonKey(name: '@id') String get iri; BoulderArea get boulderArea; Location get location;
/// Create a copy of Rock
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RockCopyWith<Rock> get copyWith => _$RockCopyWithImpl<Rock>(this as Rock, _$identity);

  /// Serializes this Rock to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Rock&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.boulderArea, boulderArea) || other.boulderArea == boulderArea)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,boulderArea,location);

@override
String toString() {
  return 'Rock(iri: $iri, boulderArea: $boulderArea, location: $location)';
}


}

/// @nodoc
abstract mixin class $RockCopyWith<$Res>  {
  factory $RockCopyWith(Rock value, $Res Function(Rock) _then) = _$RockCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, BoulderArea boulderArea, Location location
});



}
/// @nodoc
class _$RockCopyWithImpl<$Res>
    implements $RockCopyWith<$Res> {
  _$RockCopyWithImpl(this._self, this._then);

  final Rock _self;
  final $Res Function(Rock) _then;

/// Create a copy of Rock
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? boulderArea = null,Object? location = null,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,boulderArea: null == boulderArea ? _self.boulderArea : boulderArea // ignore: cast_nullable_to_non_nullable
as BoulderArea,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _Rock extends Rock {
  const _Rock({@JsonKey(name: '@id') required this.iri, required this.boulderArea, required this.location}): super._();
  factory _Rock.fromJson(Map<String, dynamic> json) => _$RockFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  BoulderArea boulderArea;
@override final  Location location;

/// Create a copy of Rock
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RockCopyWith<_Rock> get copyWith => __$RockCopyWithImpl<_Rock>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RockToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Rock&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.boulderArea, boulderArea) || other.boulderArea == boulderArea)&&(identical(other.location, location) || other.location == location));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,boulderArea,location);

@override
String toString() {
  return 'Rock(iri: $iri, boulderArea: $boulderArea, location: $location)';
}


}

/// @nodoc
abstract mixin class _$RockCopyWith<$Res> implements $RockCopyWith<$Res> {
  factory _$RockCopyWith(_Rock value, $Res Function(_Rock) _then) = __$RockCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, BoulderArea boulderArea, Location location
});



}
/// @nodoc
class __$RockCopyWithImpl<$Res>
    implements _$RockCopyWith<$Res> {
  __$RockCopyWithImpl(this._self, this._then);

  final _Rock _self;
  final $Res Function(_Rock) _then;

/// Create a copy of Rock
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? boulderArea = null,Object? location = null,}) {
  return _then(_Rock(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,boulderArea: null == boulderArea ? _self.boulderArea : boulderArea // ignore: cast_nullable_to_non_nullable
as BoulderArea,location: null == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as Location,
  ));
}


}

// dart format on
