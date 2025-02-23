// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'map_permission_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$MapPermissionState {
  bool get hasRequested => throw _privateConstructorUsedError;
  bool get hasDenied => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $MapPermissionStateCopyWith<MapPermissionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MapPermissionStateCopyWith<$Res> {
  factory $MapPermissionStateCopyWith(
          MapPermissionState value, $Res Function(MapPermissionState) then) =
      _$MapPermissionStateCopyWithImpl<$Res, MapPermissionState>;
  @useResult
  $Res call({bool hasRequested, bool hasDenied});
}

/// @nodoc
class _$MapPermissionStateCopyWithImpl<$Res, $Val extends MapPermissionState>
    implements $MapPermissionStateCopyWith<$Res> {
  _$MapPermissionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasRequested = null,
    Object? hasDenied = null,
  }) {
    return _then(_value.copyWith(
      hasRequested: null == hasRequested
          ? _value.hasRequested
          : hasRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDenied: null == hasDenied
          ? _value.hasDenied
          : hasDenied // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MapPermissionStateImplCopyWith<$Res>
    implements $MapPermissionStateCopyWith<$Res> {
  factory _$$MapPermissionStateImplCopyWith(_$MapPermissionStateImpl value,
          $Res Function(_$MapPermissionStateImpl) then) =
      __$$MapPermissionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool hasRequested, bool hasDenied});
}

/// @nodoc
class __$$MapPermissionStateImplCopyWithImpl<$Res>
    extends _$MapPermissionStateCopyWithImpl<$Res, _$MapPermissionStateImpl>
    implements _$$MapPermissionStateImplCopyWith<$Res> {
  __$$MapPermissionStateImplCopyWithImpl(_$MapPermissionStateImpl _value,
      $Res Function(_$MapPermissionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hasRequested = null,
    Object? hasDenied = null,
  }) {
    return _then(_$MapPermissionStateImpl(
      hasRequested: null == hasRequested
          ? _value.hasRequested
          : hasRequested // ignore: cast_nullable_to_non_nullable
              as bool,
      hasDenied: null == hasDenied
          ? _value.hasDenied
          : hasDenied // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$MapPermissionStateImpl extends _MapPermissionState {
  const _$MapPermissionStateImpl(
      {this.hasRequested = false, this.hasDenied = false})
      : super._();

  @override
  @JsonKey()
  final bool hasRequested;
  @override
  @JsonKey()
  final bool hasDenied;

  @override
  String toString() {
    return 'MapPermissionState(hasRequested: $hasRequested, hasDenied: $hasDenied)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MapPermissionStateImpl &&
            (identical(other.hasRequested, hasRequested) ||
                other.hasRequested == hasRequested) &&
            (identical(other.hasDenied, hasDenied) ||
                other.hasDenied == hasDenied));
  }

  @override
  int get hashCode => Object.hash(runtimeType, hasRequested, hasDenied);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MapPermissionStateImplCopyWith<_$MapPermissionStateImpl> get copyWith =>
      __$$MapPermissionStateImplCopyWithImpl<_$MapPermissionStateImpl>(
          this, _$identity);
}

abstract class _MapPermissionState extends MapPermissionState {
  const factory _MapPermissionState(
      {final bool hasRequested,
      final bool hasDenied}) = _$MapPermissionStateImpl;
  const _MapPermissionState._() : super._();

  @override
  bool get hasRequested;
  @override
  bool get hasDenied;
  @override
  @JsonKey(ignore: true)
  _$$MapPermissionStateImplCopyWith<_$MapPermissionStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
