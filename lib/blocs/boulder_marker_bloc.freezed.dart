// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boulder_marker_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$BoulderMarkerState {
  List<BoulderMarker> get markers => throw _privateConstructorUsedError;
  bool get isLoading => throw _privateConstructorUsedError;
  String get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $BoulderMarkerStateCopyWith<BoulderMarkerState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoulderMarkerStateCopyWith<$Res> {
  factory $BoulderMarkerStateCopyWith(
          BoulderMarkerState value, $Res Function(BoulderMarkerState) then) =
      _$BoulderMarkerStateCopyWithImpl<$Res, BoulderMarkerState>;
  @useResult
  $Res call({List<BoulderMarker> markers, bool isLoading, String error});
}

/// @nodoc
class _$BoulderMarkerStateCopyWithImpl<$Res, $Val extends BoulderMarkerState>
    implements $BoulderMarkerStateCopyWith<$Res> {
  _$BoulderMarkerStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_value.copyWith(
      markers: null == markers
          ? _value.markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<BoulderMarker>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BoulderMarkerStateImplCopyWith<$Res>
    implements $BoulderMarkerStateCopyWith<$Res> {
  factory _$$BoulderMarkerStateImplCopyWith(_$BoulderMarkerStateImpl value,
          $Res Function(_$BoulderMarkerStateImpl) then) =
      __$$BoulderMarkerStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BoulderMarker> markers, bool isLoading, String error});
}

/// @nodoc
class __$$BoulderMarkerStateImplCopyWithImpl<$Res>
    extends _$BoulderMarkerStateCopyWithImpl<$Res, _$BoulderMarkerStateImpl>
    implements _$$BoulderMarkerStateImplCopyWith<$Res> {
  __$$BoulderMarkerStateImplCopyWithImpl(_$BoulderMarkerStateImpl _value,
      $Res Function(_$BoulderMarkerStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? markers = null,
    Object? isLoading = null,
    Object? error = null,
  }) {
    return _then(_$BoulderMarkerStateImpl(
      markers: null == markers
          ? _value._markers
          : markers // ignore: cast_nullable_to_non_nullable
              as List<BoulderMarker>,
      isLoading: null == isLoading
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      error: null == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$BoulderMarkerStateImpl implements _BoulderMarkerState {
  const _$BoulderMarkerStateImpl(
      {required final List<BoulderMarker> markers,
      required this.isLoading,
      required this.error})
      : _markers = markers;

  final List<BoulderMarker> _markers;
  @override
  List<BoulderMarker> get markers {
    if (_markers is EqualUnmodifiableListView) return _markers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_markers);
  }

  @override
  final bool isLoading;
  @override
  final String error;

  @override
  String toString() {
    return 'BoulderMarkerState(markers: $markers, isLoading: $isLoading, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BoulderMarkerStateImpl &&
            const DeepCollectionEquality().equals(other._markers, _markers) &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(_markers), isLoading, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BoulderMarkerStateImplCopyWith<_$BoulderMarkerStateImpl> get copyWith =>
      __$$BoulderMarkerStateImplCopyWithImpl<_$BoulderMarkerStateImpl>(
          this, _$identity);
}

abstract class _BoulderMarkerState implements BoulderMarkerState {
  const factory _BoulderMarkerState(
      {required final List<BoulderMarker> markers,
      required final bool isLoading,
      required final String error}) = _$BoulderMarkerStateImpl;

  @override
  List<BoulderMarker> get markers;
  @override
  bool get isLoading;
  @override
  String get error;
  @override
  @JsonKey(ignore: true)
  _$$BoulderMarkerStateImplCopyWith<_$BoulderMarkerStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
