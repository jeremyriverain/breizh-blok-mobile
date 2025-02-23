// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_filter_grade_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoulderFilterGradeState {
  Set<Grade> get grades => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoulderFilterGradeStateCopyWith<BoulderFilterGradeState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoulderFilterGradeStateCopyWith<$Res> {
  factory $BoulderFilterGradeStateCopyWith(BoulderFilterGradeState value,
          $Res Function(BoulderFilterGradeState) then) =
      _$BoulderFilterGradeStateCopyWithImpl<$Res, BoulderFilterGradeState>;
  @useResult
  $Res call({Set<Grade> grades});
}

/// @nodoc
class _$BoulderFilterGradeStateCopyWithImpl<$Res,
        $Val extends BoulderFilterGradeState>
    implements $BoulderFilterGradeStateCopyWith<$Res> {
  _$BoulderFilterGradeStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grades = null,
  }) {
    return _then(_value.copyWith(
      grades: null == grades
          ? _value.grades
          : grades // ignore: cast_nullable_to_non_nullable
              as Set<Grade>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoulderFilterGradeStateImplCopyWith<$Res>
    implements $BoulderFilterGradeStateCopyWith<$Res> {
  factory _$$BoulderFilterGradeStateImplCopyWith(
          _$BoulderFilterGradeStateImpl value,
          $Res Function(_$BoulderFilterGradeStateImpl) then) =
      __$$BoulderFilterGradeStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Set<Grade> grades});
}

/// @nodoc
class __$$BoulderFilterGradeStateImplCopyWithImpl<$Res>
    extends _$BoulderFilterGradeStateCopyWithImpl<$Res,
        _$BoulderFilterGradeStateImpl>
    implements _$$BoulderFilterGradeStateImplCopyWith<$Res> {
  __$$BoulderFilterGradeStateImplCopyWithImpl(
      _$BoulderFilterGradeStateImpl _value,
      $Res Function(_$BoulderFilterGradeStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? grades = null,
  }) {
    return _then(_$BoulderFilterGradeStateImpl(
      grades: null == grades
          ? _value._grades
          : grades // ignore: cast_nullable_to_non_nullable
              as Set<Grade>,
    ));
  }
}

/// @nodoc

class _$BoulderFilterGradeStateImpl implements _BoulderFilterGradeState {
  const _$BoulderFilterGradeStateImpl(
      {final Set<Grade> grades = const <Grade>{}})
      : _grades = grades;

  final Set<Grade> _grades;
  @override
  @JsonKey()
  Set<Grade> get grades {
    if (_grades is EqualUnmodifiableSetView) return _grades;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableSetView(_grades);
  }

  @override
  String toString() {
    return 'BoulderFilterGradeState(grades: $grades)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoulderFilterGradeStateImpl &&
            const DeepCollectionEquality().equals(other._grades, _grades));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_grades));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoulderFilterGradeStateImplCopyWith<_$BoulderFilterGradeStateImpl>
      get copyWith => __$$BoulderFilterGradeStateImplCopyWithImpl<
          _$BoulderFilterGradeStateImpl>(this, _$identity);
}

abstract class _BoulderFilterGradeState implements BoulderFilterGradeState {
  const factory _BoulderFilterGradeState({final Set<Grade> grades}) =
      _$BoulderFilterGradeStateImpl;

  @override
  Set<Grade> get grades;
  @override
  @JsonKey(ignore: true)
  _$$BoulderFilterGradeStateImplCopyWith<_$BoulderFilterGradeStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
