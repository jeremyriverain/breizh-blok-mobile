// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Boulder {

@JsonKey(name: '@id') String get iri; String get name; Rock get rock; List<LineBoulder> get lineBoulders; Grade? get grade; String? get description; HeightBoulder? get height;
/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderCopyWith<Boulder> get copyWith => _$BoulderCopyWithImpl<Boulder>(this as Boulder, _$identity);

  /// Serializes this Boulder to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Boulder&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&(identical(other.rock, rock) || other.rock == rock)&&const DeepCollectionEquality().equals(other.lineBoulders, lineBoulders)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.description, description) || other.description == description)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,rock,const DeepCollectionEquality().hash(lineBoulders),grade,description,height);

@override
String toString() {
  return 'Boulder(iri: $iri, name: $name, rock: $rock, lineBoulders: $lineBoulders, grade: $grade, description: $description, height: $height)';
}


}

/// @nodoc
abstract mixin class $BoulderCopyWith<$Res>  {
  factory $BoulderCopyWith(Boulder value, $Res Function(Boulder) _then) = _$BoulderCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, Rock rock, List<LineBoulder> lineBoulders, Grade? grade, String? description, HeightBoulder? height
});


$RockCopyWith<$Res> get rock;$GradeCopyWith<$Res>? get grade;$HeightBoulderCopyWith<$Res>? get height;

}
/// @nodoc
class _$BoulderCopyWithImpl<$Res>
    implements $BoulderCopyWith<$Res> {
  _$BoulderCopyWithImpl(this._self, this._then);

  final Boulder _self;
  final $Res Function(Boulder) _then;

/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? iri = null,Object? name = null,Object? rock = null,Object? lineBoulders = null,Object? grade = freezed,Object? description = freezed,Object? height = freezed,}) {
  return _then(_self.copyWith(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rock: null == rock ? _self.rock : rock // ignore: cast_nullable_to_non_nullable
as Rock,lineBoulders: null == lineBoulders ? _self.lineBoulders : lineBoulders // ignore: cast_nullable_to_non_nullable
as List<LineBoulder>,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as HeightBoulder?,
  ));
}
/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RockCopyWith<$Res> get rock {
  
  return $RockCopyWith<$Res>(_self.rock, (value) {
    return _then(_self.copyWith(rock: value));
  });
}/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeCopyWith<$Res>? get grade {
    if (_self.grade == null) {
    return null;
  }

  return $GradeCopyWith<$Res>(_self.grade!, (value) {
    return _then(_self.copyWith(grade: value));
  });
}/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeightBoulderCopyWith<$Res>? get height {
    if (_self.height == null) {
    return null;
  }

  return $HeightBoulderCopyWith<$Res>(_self.height!, (value) {
    return _then(_self.copyWith(height: value));
  });
}
}


/// @nodoc
@JsonSerializable()

class _Boulder extends Boulder {
  const _Boulder({@JsonKey(name: '@id') required this.iri, required this.name, required this.rock, final  List<LineBoulder> lineBoulders = const <LineBoulder>[], this.grade, this.description, this.height}): _lineBoulders = lineBoulders,super._();
  factory _Boulder.fromJson(Map<String, dynamic> json) => _$BoulderFromJson(json);

@override@JsonKey(name: '@id') final  String iri;
@override final  String name;
@override final  Rock rock;
 final  List<LineBoulder> _lineBoulders;
@override@JsonKey() List<LineBoulder> get lineBoulders {
  if (_lineBoulders is EqualUnmodifiableListView) return _lineBoulders;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_lineBoulders);
}

@override final  Grade? grade;
@override final  String? description;
@override final  HeightBoulder? height;

/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoulderCopyWith<_Boulder> get copyWith => __$BoulderCopyWithImpl<_Boulder>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BoulderToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Boulder&&(identical(other.iri, iri) || other.iri == iri)&&(identical(other.name, name) || other.name == name)&&(identical(other.rock, rock) || other.rock == rock)&&const DeepCollectionEquality().equals(other._lineBoulders, _lineBoulders)&&(identical(other.grade, grade) || other.grade == grade)&&(identical(other.description, description) || other.description == description)&&(identical(other.height, height) || other.height == height));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,iri,name,rock,const DeepCollectionEquality().hash(_lineBoulders),grade,description,height);

@override
String toString() {
  return 'Boulder(iri: $iri, name: $name, rock: $rock, lineBoulders: $lineBoulders, grade: $grade, description: $description, height: $height)';
}


}

/// @nodoc
abstract mixin class _$BoulderCopyWith<$Res> implements $BoulderCopyWith<$Res> {
  factory _$BoulderCopyWith(_Boulder value, $Res Function(_Boulder) _then) = __$BoulderCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: '@id') String iri, String name, Rock rock, List<LineBoulder> lineBoulders, Grade? grade, String? description, HeightBoulder? height
});


@override $RockCopyWith<$Res> get rock;@override $GradeCopyWith<$Res>? get grade;@override $HeightBoulderCopyWith<$Res>? get height;

}
/// @nodoc
class __$BoulderCopyWithImpl<$Res>
    implements _$BoulderCopyWith<$Res> {
  __$BoulderCopyWithImpl(this._self, this._then);

  final _Boulder _self;
  final $Res Function(_Boulder) _then;

/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? iri = null,Object? name = null,Object? rock = null,Object? lineBoulders = null,Object? grade = freezed,Object? description = freezed,Object? height = freezed,}) {
  return _then(_Boulder(
iri: null == iri ? _self.iri : iri // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,rock: null == rock ? _self.rock : rock // ignore: cast_nullable_to_non_nullable
as Rock,lineBoulders: null == lineBoulders ? _self._lineBoulders : lineBoulders // ignore: cast_nullable_to_non_nullable
as List<LineBoulder>,grade: freezed == grade ? _self.grade : grade // ignore: cast_nullable_to_non_nullable
as Grade?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,height: freezed == height ? _self.height : height // ignore: cast_nullable_to_non_nullable
as HeightBoulder?,
  ));
}

/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RockCopyWith<$Res> get rock {
  
  return $RockCopyWith<$Res>(_self.rock, (value) {
    return _then(_self.copyWith(rock: value));
  });
}/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GradeCopyWith<$Res>? get grade {
    if (_self.grade == null) {
    return null;
  }

  return $GradeCopyWith<$Res>(_self.grade!, (value) {
    return _then(_self.copyWith(grade: value));
  });
}/// Create a copy of Boulder
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$HeightBoulderCopyWith<$Res>? get height {
    if (_self.height == null) {
    return null;
  }

  return $HeightBoulderCopyWith<$Res>(_self.height!, (value) {
    return _then(_self.copyWith(height: value));
  });
}
}

// dart format on
