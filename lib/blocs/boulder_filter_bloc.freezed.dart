// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BoulderFilterState {

 String? get term; Set<BoulderArea> get boulderAreas;
/// Create a copy of BoulderFilterState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BoulderFilterStateCopyWith<BoulderFilterState> get copyWith => _$BoulderFilterStateCopyWithImpl<BoulderFilterState>(this as BoulderFilterState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BoulderFilterState&&(identical(other.term, term) || other.term == term)&&const DeepCollectionEquality().equals(other.boulderAreas, boulderAreas));
}


@override
int get hashCode => Object.hash(runtimeType,term,const DeepCollectionEquality().hash(boulderAreas));

@override
String toString() {
  return 'BoulderFilterState(term: $term, boulderAreas: $boulderAreas)';
}


}

/// @nodoc
abstract mixin class $BoulderFilterStateCopyWith<$Res>  {
  factory $BoulderFilterStateCopyWith(BoulderFilterState value, $Res Function(BoulderFilterState) _then) = _$BoulderFilterStateCopyWithImpl;
@useResult
$Res call({
 String? term, Set<BoulderArea> boulderAreas
});



}
/// @nodoc
class _$BoulderFilterStateCopyWithImpl<$Res>
    implements $BoulderFilterStateCopyWith<$Res> {
  _$BoulderFilterStateCopyWithImpl(this._self, this._then);

  final BoulderFilterState _self;
  final $Res Function(BoulderFilterState) _then;

/// Create a copy of BoulderFilterState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? term = freezed,Object? boulderAreas = null,}) {
  return _then(_self.copyWith(
term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,boulderAreas: null == boulderAreas ? _self.boulderAreas : boulderAreas // ignore: cast_nullable_to_non_nullable
as Set<BoulderArea>,
  ));
}

}


/// @nodoc


class _BoulderFilterState implements BoulderFilterState {
  const _BoulderFilterState({this.term, final  Set<BoulderArea> boulderAreas = const <BoulderArea>{}}): _boulderAreas = boulderAreas;
  

@override final  String? term;
 final  Set<BoulderArea> _boulderAreas;
@override@JsonKey() Set<BoulderArea> get boulderAreas {
  if (_boulderAreas is EqualUnmodifiableSetView) return _boulderAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_boulderAreas);
}


/// Create a copy of BoulderFilterState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BoulderFilterStateCopyWith<_BoulderFilterState> get copyWith => __$BoulderFilterStateCopyWithImpl<_BoulderFilterState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BoulderFilterState&&(identical(other.term, term) || other.term == term)&&const DeepCollectionEquality().equals(other._boulderAreas, _boulderAreas));
}


@override
int get hashCode => Object.hash(runtimeType,term,const DeepCollectionEquality().hash(_boulderAreas));

@override
String toString() {
  return 'BoulderFilterState(term: $term, boulderAreas: $boulderAreas)';
}


}

/// @nodoc
abstract mixin class _$BoulderFilterStateCopyWith<$Res> implements $BoulderFilterStateCopyWith<$Res> {
  factory _$BoulderFilterStateCopyWith(_BoulderFilterState value, $Res Function(_BoulderFilterState) _then) = __$BoulderFilterStateCopyWithImpl;
@override @useResult
$Res call({
 String? term, Set<BoulderArea> boulderAreas
});



}
/// @nodoc
class __$BoulderFilterStateCopyWithImpl<$Res>
    implements _$BoulderFilterStateCopyWith<$Res> {
  __$BoulderFilterStateCopyWithImpl(this._self, this._then);

  final _BoulderFilterState _self;
  final $Res Function(_BoulderFilterState) _then;

/// Create a copy of BoulderFilterState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? term = freezed,Object? boulderAreas = null,}) {
  return _then(_BoulderFilterState(
term: freezed == term ? _self.term : term // ignore: cast_nullable_to_non_nullable
as String?,boulderAreas: null == boulderAreas ? _self._boulderAreas : boulderAreas // ignore: cast_nullable_to_non_nullable
as Set<BoulderArea>,
  ));
}


}

// dart format on
