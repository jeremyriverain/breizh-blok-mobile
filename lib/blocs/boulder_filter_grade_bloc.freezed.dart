// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_filter_grade_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoulderFilterGradeState {

 Set<Grade> get grades;
/// Create a copy of BoulderFilterGradeState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderFilterGradeStateCopyWith<BoulderFilterGradeState> get copyWith => _$BoulderFilterGradeStateCopyWithImpl<BoulderFilterGradeState>(this as BoulderFilterGradeState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderFilterGradeState&&const DeepCollectionEquality().equals(other.grades, grades));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(grades));

@override
String toString() {
  return 'BoulderFilterGradeState(grades: $grades)';
}


}

/// @nodoc
abstract mixin class $BoulderFilterGradeStateCopyWith<$Res>  {
  factory $BoulderFilterGradeStateCopyWith(BoulderFilterGradeState value, $Res Function(BoulderFilterGradeState) _then) = _$BoulderFilterGradeStateCopyWithImpl;
@useResult
$Res call({
 Set<Grade> grades
});



}
/// @nodoc
class _$BoulderFilterGradeStateCopyWithImpl<$Res>
    implements $BoulderFilterGradeStateCopyWith<$Res> {
  _$BoulderFilterGradeStateCopyWithImpl(this._self, this._then);

  final BoulderFilterGradeState _self;
  final $Res Function(BoulderFilterGradeState) _then;

/// Create a copy of BoulderFilterGradeState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? grades = null,}) {
  return _then(_self.copyWith(
grades: null == grades ? _self.grades : grades // ignore: cast_nullable_to_non_nullable
as Set<Grade>,
  ));
}

}


/// @nodoc


class _BoulderFilterGradeState implements BoulderFilterGradeState {
  const _BoulderFilterGradeState({final  Set<Grade> grades = const <Grade>{}}): _grades = grades;
  

 final  Set<Grade> _grades;
@override@JsonKey() Set<Grade> get grades {
  if (_grades is EqualUnmodifiableSetView) return _grades;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_grades);
}


/// Create a copy of BoulderFilterGradeState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoulderFilterGradeStateCopyWith<_BoulderFilterGradeState> get copyWith => __$BoulderFilterGradeStateCopyWithImpl<_BoulderFilterGradeState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoulderFilterGradeState&&const DeepCollectionEquality().equals(other._grades, _grades));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_grades));

@override
String toString() {
  return 'BoulderFilterGradeState(grades: $grades)';
}


}

/// @nodoc
abstract mixin class _$BoulderFilterGradeStateCopyWith<$Res> implements $BoulderFilterGradeStateCopyWith<$Res> {
  factory _$BoulderFilterGradeStateCopyWith(_BoulderFilterGradeState value, $Res Function(_BoulderFilterGradeState) _then) = __$BoulderFilterGradeStateCopyWithImpl;
@override @useResult
$Res call({
 Set<Grade> grades
});



}
/// @nodoc
class __$BoulderFilterGradeStateCopyWithImpl<$Res>
    implements _$BoulderFilterGradeStateCopyWith<$Res> {
  __$BoulderFilterGradeStateCopyWithImpl(this._self, this._then);

  final _BoulderFilterGradeState _self;
  final $Res Function(_BoulderFilterGradeState) _then;

/// Create a copy of BoulderFilterGradeState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? grades = null,}) {
  return _then(_BoulderFilterGradeState(
grades: null == grades ? _self._grades : grades // ignore: cast_nullable_to_non_nullable
as Set<Grade>,
  ));
}


}

// dart format on
