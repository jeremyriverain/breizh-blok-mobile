// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'height_boulder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HeightBoulder {

@JsonKey(name: '@id') String get iri; int get min; int? get max;
/// Create a copy of HeightBoulder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$HeightBoulderCopyWith<HeightBoulder> get copyWith => _$HeightBoulderCopyWithImpl<HeightBoulder>(this as HeightBoulder, _$identity);

  /// Serializes this HeightBoulder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is HeightBoulder&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,min,max);

@override
String toString() {
  return 'HeightBoulder(iri: $iri, min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class $HeightBoulderCopyWith<$Res>  {
  factory $HeightBoulderCopyWith(HeightBoulder value, $Res Function(HeightBoulder) _then) = _$HeightBoulderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, int min, int? max
});



}
/// @nodoc
class _$HeightBoulderCopyWithImpl<$Res>
    implements $HeightBoulderCopyWith<$Res> {
  _$HeightBoulderCopyWithImpl(this._self, this._then);

  final HeightBoulder _self;
  final $Res Function(HeightBoulder) _then;

/// Create a copy of HeightBoulder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? min = null,Object? max = freezed,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// @nodoc
@JsonSerializable()

class _HeightBoulder implements HeightBoulder {
  const _HeightBoulder({@JsonKey(name: '@id') required this.iri, required this.min, this.max});
  factory _HeightBoulder.fromJson(Map<String, dynamic> json) => _$HeightBoulderFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  int min;
@override final  int? max;

/// Create a copy of HeightBoulder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$HeightBoulderCopyWith<_HeightBoulder> get copyWith => __$HeightBoulderCopyWithImpl<_HeightBoulder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$HeightBoulderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _HeightBoulder&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.min, min) || other.min == min)&&(identical(other.max, max) || other.max == max));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,min,max);

@override
String toString() {
  return 'HeightBoulder(iri: $iri, min: $min, max: $max)';
}


}

/// @nodoc
abstract mixin class _$HeightBoulderCopyWith<$Res> implements $HeightBoulderCopyWith<$Res> {
  factory _$HeightBoulderCopyWith(_HeightBoulder value, $Res Function(_HeightBoulder) _then) = __$HeightBoulderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, int min, int? max
});



}
/// @nodoc
class __$HeightBoulderCopyWithImpl<$Res>
    implements _$HeightBoulderCopyWith<$Res> {
  __$HeightBoulderCopyWithImpl(this._self, this._then);

  final _HeightBoulder _self;
  final $Res Function(_HeightBoulder) _then;

/// Create a copy of HeightBoulder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? min = null,Object? max = freezed,}) {
  return _then(_HeightBoulder(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,min: null == min ? _self.min : min // ignore: cast_nullable_to_non_nullable
as int,max: freezed == max ? _self.max : max // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
