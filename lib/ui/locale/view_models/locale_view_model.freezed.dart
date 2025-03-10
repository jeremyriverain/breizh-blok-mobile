// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'locale_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LocaleState {

 Locale get locale;
/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LocaleStateCopyWith<LocaleState> get copyWith => _$LocaleStateCopyWithImpl<LocaleState>(this as LocaleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LocaleState&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocaleState(locale: $locale)';
}


}

/// @nodoc
abstract mixin class $LocaleStateCopyWith<$Res>  {
  factory $LocaleStateCopyWith(LocaleState value, $Res Function(LocaleState) _then) = _$LocaleStateCopyWithImpl;
@useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class _$LocaleStateCopyWithImpl<$Res>
    implements $LocaleStateCopyWith<$Res> {
  _$LocaleStateCopyWithImpl(this._self, this._then);

  final LocaleState _self;
  final $Res Function(LocaleState) _then;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? locale = null,}) {
  return _then(_self.copyWith(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}

}


/// @nodoc


class _LocaleState implements LocaleState {
  const _LocaleState({required this.locale});
  

@override final  Locale locale;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LocaleStateCopyWith<_LocaleState> get copyWith => __$LocaleStateCopyWithImpl<_LocaleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LocaleState&&(identical(other.locale, locale) || other.locale == locale));
}


@override
int get hashCode => Object.hash(runtimeType,locale);

@override
String toString() {
  return 'LocaleState(locale: $locale)';
}


}

/// @nodoc
abstract mixin class _$LocaleStateCopyWith<$Res> implements $LocaleStateCopyWith<$Res> {
  factory _$LocaleStateCopyWith(_LocaleState value, $Res Function(_LocaleState) _then) = __$LocaleStateCopyWithImpl;
@override @useResult
$Res call({
 Locale locale
});




}
/// @nodoc
class __$LocaleStateCopyWithImpl<$Res>
    implements _$LocaleStateCopyWith<$Res> {
  __$LocaleStateCopyWithImpl(this._self, this._then);

  final _LocaleState _self;
  final $Res Function(_LocaleState) _then;

/// Create a copy of LocaleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? locale = null,}) {
  return _then(_LocaleState(
locale: null == locale ? _self.locale : locale // ignore: cast_nullable_to_non_nullable
as Locale,
  ));
}


}

// dart format on
