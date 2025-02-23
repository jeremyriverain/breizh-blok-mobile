// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_filter_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoulderFilterState {
  String? get term => throw _privateConstructorUsedError;
  Set<BoulderArea> get boulderAreas => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoulderFilterStateCopyWith<BoulderFilterState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoulderFilterStateCopyWith<$Res> {
  factory $BoulderFilterStateCopyWith(
          BoulderFilterState value, $Res Function(BoulderFilterState) then) =
      _$BoulderFilterStateCopyWithImpl<$Res, BoulderFilterState>;
  @useResult
  $Res call({String? term, Set<BoulderArea> boulderAreas});
}

/// @nodoc
class _$BoulderFilterStateCopyWithImpl<$Res, $Val extends BoulderFilterState>
    implements $BoulderFilterStateCopyWith<$Res> {
  _$BoulderFilterStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = freezed,
    Object? boulderAreas = null,
  }) {
    return _then(_value.copyWith(
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String?,
      boulderAreas: null == boulderAreas
          ? _value.boulderAreas
          : boulderAreas // ignore: cast_nullable_to_non_nullable
              as Set<BoulderArea>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoulderFilterStateImplCopyWith<$Res>
    implements $BoulderFilterStateCopyWith<$Res> {
  factory _$$BoulderFilterStateImplCopyWith(_$BoulderFilterStateImpl value,
          $Res Function(_$BoulderFilterStateImpl) then) =
      __$$BoulderFilterStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? term, Set<BoulderArea> boulderAreas});
}

/// @nodoc
class __$$BoulderFilterStateImplCopyWithImpl<$Res>
    extends _$BoulderFilterStateCopyWithImpl<$Res, _$BoulderFilterStateImpl>
    implements _$$BoulderFilterStateImplCopyWith<$Res> {
  __$$BoulderFilterStateImplCopyWithImpl(_$BoulderFilterStateImpl _value,
      $Res Function(_$BoulderFilterStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? term = freezed,
    Object? boulderAreas = null,
  }) {
    return _then(_$BoulderFilterStateImpl(
      term: freezed == term
          ? _value.term
          : term // ignore: cast_nullable_to_non_nullable
              as String?,
      boulderAreas: null == boulderAreas
          ? _value._boulderAreas
          : boulderAreas // ignore: cast_nullable_to_non_nullable
              as Set<BoulderArea>,
    ));
  }
}

/// @nodoc

class _$BoulderFilterStateImpl implements _BoulderFilterState {
  const _$BoulderFilterStateImpl(
      {this.term, final Set<BoulderArea> boulderAreas = const <BoulderArea>{}})
      : _boulderAreas = boulderAreas;

  @override
  final String? term;
  final Set<BoulderArea> _boulderAreas;
  @override
  @JsonKey()
  Set<BoulderArea> get boulderAreas {
    if (_boulderAreas is EqualUnmodifiableSetView) return _boulderAreas;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_boulderAreas);
  }

  @override
  String toString() {
    return 'BoulderFilterState(term: $term, boulderAreas: $boulderAreas)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoulderFilterStateImpl &&
            (identical(other.term, term) || other.term == term) &&
            const DeepCollectionEquality()
                .equals(other._boulderAreas, _boulderAreas));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, term, const DeepCollectionEquality().hash(_boulderAreas));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoulderFilterStateImplCopyWith<_$BoulderFilterStateImpl> get copyWith =>
      __$$BoulderFilterStateImplCopyWithImpl<_$BoulderFilterStateImpl>(
          this, _$identity);
}

abstract class _BoulderFilterState implements BoulderFilterState {
  const factory _BoulderFilterState(
      {final String? term,
      final Set<BoulderArea> boulderAreas}) = _$BoulderFilterStateImpl;

  @override
  String? get term;
  @override
  Set<BoulderArea> get boulderAreas;
  @override
  @JsonKey(ignore: true)
  _$$BoulderFilterStateImplCopyWith<_$BoulderFilterStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
