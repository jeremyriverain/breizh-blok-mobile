// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'downloaded_boulder_area.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$DownloadedBoulderArea {
  String get boulderAreaName => throw _privateConstructorUsedError;
  String get municipalityName => throw _privateConstructorUsedError;
  String get boulderAreaIri => throw _privateConstructorUsedError;
  DateTime get downloadedAt => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $DownloadedBoulderAreaCopyWith<DownloadedBoulderArea> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DownloadedBoulderAreaCopyWith<$Res> {
  factory $DownloadedBoulderAreaCopyWith(DownloadedBoulderArea value,
          $Res Function(DownloadedBoulderArea) then) =
      _$DownloadedBoulderAreaCopyWithImpl<$Res, DownloadedBoulderArea>;
  @useResult
  $Res call(
      {String boulderAreaName,
      String municipalityName,
      String boulderAreaIri,
      DateTime downloadedAt});
}

/// @nodoc
class _$DownloadedBoulderAreaCopyWithImpl<$Res,
        $Val extends DownloadedBoulderArea>
    implements $DownloadedBoulderAreaCopyWith<$Res> {
  _$DownloadedBoulderAreaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boulderAreaName = null,
    Object? municipalityName = null,
    Object? boulderAreaIri = null,
    Object? downloadedAt = null,
  }) {
    return _then(_value.copyWith(
      boulderAreaName: null == boulderAreaName
          ? _value.boulderAreaName
          : boulderAreaName // ignore: cast_nullable_to_non_nullable
              as String,
      municipalityName: null == municipalityName
          ? _value.municipalityName
          : municipalityName // ignore: cast_nullable_to_non_nullable
              as String,
      boulderAreaIri: null == boulderAreaIri
          ? _value.boulderAreaIri
          : boulderAreaIri // ignore: cast_nullable_to_non_nullable
              as String,
      downloadedAt: null == downloadedAt
          ? _value.downloadedAt
          : downloadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DownloadedBoulderAreaImplCopyWith<$Res>
    implements $DownloadedBoulderAreaCopyWith<$Res> {
  factory _$$DownloadedBoulderAreaImplCopyWith(
          _$DownloadedBoulderAreaImpl value,
          $Res Function(_$DownloadedBoulderAreaImpl) then) =
      __$$DownloadedBoulderAreaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String boulderAreaName,
      String municipalityName,
      String boulderAreaIri,
      DateTime downloadedAt});
}

/// @nodoc
class __$$DownloadedBoulderAreaImplCopyWithImpl<$Res>
    extends _$DownloadedBoulderAreaCopyWithImpl<$Res,
        _$DownloadedBoulderAreaImpl>
    implements _$$DownloadedBoulderAreaImplCopyWith<$Res> {
  __$$DownloadedBoulderAreaImplCopyWithImpl(_$DownloadedBoulderAreaImpl _value,
      $Res Function(_$DownloadedBoulderAreaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? boulderAreaName = null,
    Object? municipalityName = null,
    Object? boulderAreaIri = null,
    Object? downloadedAt = null,
  }) {
    return _then(_$DownloadedBoulderAreaImpl(
      boulderAreaName: null == boulderAreaName
          ? _value.boulderAreaName
          : boulderAreaName // ignore: cast_nullable_to_non_nullable
              as String,
      municipalityName: null == municipalityName
          ? _value.municipalityName
          : municipalityName // ignore: cast_nullable_to_non_nullable
              as String,
      boulderAreaIri: null == boulderAreaIri
          ? _value.boulderAreaIri
          : boulderAreaIri // ignore: cast_nullable_to_non_nullable
              as String,
      downloadedAt: null == downloadedAt
          ? _value.downloadedAt
          : downloadedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc

class _$DownloadedBoulderAreaImpl implements _DownloadedBoulderArea {
  const _$DownloadedBoulderAreaImpl(
      {required this.boulderAreaName,
      required this.municipalityName,
      required this.boulderAreaIri,
      required this.downloadedAt});

  @override
  final String boulderAreaName;
  @override
  final String municipalityName;
  @override
  final String boulderAreaIri;
  @override
  final DateTime downloadedAt;

  @override
  String toString() {
    return 'DownloadedBoulderArea(boulderAreaName: $boulderAreaName, municipalityName: $municipalityName, boulderAreaIri: $boulderAreaIri, downloadedAt: $downloadedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DownloadedBoulderAreaImpl &&
            (identical(other.boulderAreaName, boulderAreaName) ||
                other.boulderAreaName == boulderAreaName) &&
            (identical(other.municipalityName, municipalityName) ||
                other.municipalityName == municipalityName) &&
            (identical(other.boulderAreaIri, boulderAreaIri) ||
                other.boulderAreaIri == boulderAreaIri) &&
            (identical(other.downloadedAt, downloadedAt) ||
                other.downloadedAt == downloadedAt));
  }

  @override
  int get hashCode => Object.hash(runtimeType, boulderAreaName,
      municipalityName, boulderAreaIri, downloadedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DownloadedBoulderAreaImplCopyWith<_$DownloadedBoulderAreaImpl>
      get copyWith => __$$DownloadedBoulderAreaImplCopyWithImpl<
          _$DownloadedBoulderAreaImpl>(this, _$identity);
}

abstract class _DownloadedBoulderArea implements DownloadedBoulderArea {
  const factory _DownloadedBoulderArea(
      {required final String boulderAreaName,
      required final String municipalityName,
      required final String boulderAreaIri,
      required final DateTime downloadedAt}) = _$DownloadedBoulderAreaImpl;

  @override
  String get boulderAreaName;
  @override
  String get municipalityName;
  @override
  String get boulderAreaIri;
  @override
  DateTime get downloadedAt;
  @override
  @JsonKey(ignore: true)
  _$$DownloadedBoulderAreaImplCopyWith<_$DownloadedBoulderAreaImpl>
      get copyWith => throw _privateConstructorUsedError;
}
