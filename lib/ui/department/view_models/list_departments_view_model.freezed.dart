// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_departments_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListDepartmentsEvents {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDepartmentsEvents);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListDepartmentsEvents()';
}


}

/// @nodoc
class $ListDepartmentsEventsCopyWith<$Res>  {
$ListDepartmentsEventsCopyWith(ListDepartmentsEvents _, $Res Function(ListDepartmentsEvents) __);
}


/// @nodoc


class ListDepartmentsRequested extends ListDepartmentsEvents {
  const ListDepartmentsRequested(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDepartmentsRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListDepartmentsEvents.requested()';
}


}




/// @nodoc
mixin _$ListDepartmentsStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDepartmentsStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListDepartmentsStates()';
}


}

/// @nodoc
class $ListDepartmentsStatesCopyWith<$Res>  {
$ListDepartmentsStatesCopyWith(ListDepartmentsStates _, $Res Function(ListDepartmentsStates) __);
}


/// @nodoc


class ListDepartmentsLoading extends ListDepartmentsStates {
  const ListDepartmentsLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDepartmentsLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListDepartmentsStates.loading()';
}


}




/// @nodoc


class ListDepartmentsOK extends ListDepartmentsStates {
  const ListDepartmentsOK({required this.departments}): super._();
  

 final  PaginatedCollection<Department> departments;

/// Create a copy of ListDepartmentsStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDepartmentsOKCopyWith<ListDepartmentsOK> get copyWith => _$ListDepartmentsOKCopyWithImpl<ListDepartmentsOK>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDepartmentsOK&&(identical(other.departments, departments) || other.departments == departments));
}


@override
int get hashCode => Object.hash(runtimeType,departments);

@override
String toString() {
  return 'ListDepartmentsStates.ok(departments: $departments)';
}


}

/// @nodoc
abstract mixin class $ListDepartmentsOKCopyWith<$Res> implements $ListDepartmentsStatesCopyWith<$Res> {
  factory $ListDepartmentsOKCopyWith(ListDepartmentsOK value, $Res Function(ListDepartmentsOK) _then) = _$ListDepartmentsOKCopyWithImpl;
@useResult
$Res call({
 PaginatedCollection<Department> departments
});




}
/// @nodoc
class _$ListDepartmentsOKCopyWithImpl<$Res>
    implements $ListDepartmentsOKCopyWith<$Res> {
  _$ListDepartmentsOKCopyWithImpl(this._self, this._then);

  final ListDepartmentsOK _self;
  final $Res Function(ListDepartmentsOK) _then;

/// Create a copy of ListDepartmentsStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? departments = null,}) {
  return _then(ListDepartmentsOK(
departments: null == departments ? _self.departments : departments // ignore: cast_nullable_to_non_nullable
as PaginatedCollection<Department>,
  ));
}


}

/// @nodoc


class ListDepartmentsError extends ListDepartmentsStates {
  const ListDepartmentsError({this.error}): super._();
  

 final  Object? error;

/// Create a copy of ListDepartmentsStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDepartmentsErrorCopyWith<ListDepartmentsError> get copyWith => _$ListDepartmentsErrorCopyWithImpl<ListDepartmentsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDepartmentsError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ListDepartmentsStates.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ListDepartmentsErrorCopyWith<$Res> implements $ListDepartmentsStatesCopyWith<$Res> {
  factory $ListDepartmentsErrorCopyWith(ListDepartmentsError value, $Res Function(ListDepartmentsError) _then) = _$ListDepartmentsErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$ListDepartmentsErrorCopyWithImpl<$Res>
    implements $ListDepartmentsErrorCopyWith<$Res> {
  _$ListDepartmentsErrorCopyWithImpl(this._self, this._then);

  final ListDepartmentsError _self;
  final $Res Function(ListDepartmentsError) _then;

/// Create a copy of ListDepartmentsStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(ListDepartmentsError(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
