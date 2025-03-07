// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'list_downloaded_boulder_areas_view_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ListDownloadedBoulderAreasEvents {

 ApiOrderParam get orderParam;
/// Create a copy of ListDownloadedBoulderAreasEvents
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDownloadedBoulderAreasEventsCopyWith<ListDownloadedBoulderAreasEvents> get copyWith => _$ListDownloadedBoulderAreasEventsCopyWithImpl<ListDownloadedBoulderAreasEvents>(this as ListDownloadedBoulderAreasEvents, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDownloadedBoulderAreasEvents&&(identical(other.orderParam, orderParam) || other.orderParam == orderParam));
}


@override
int get hashCode => Object.hash(runtimeType,orderParam);

@override
String toString() {
  return 'ListDownloadedBoulderAreasEvents(orderParam: $orderParam)';
}


}

/// @nodoc
abstract mixin class $ListDownloadedBoulderAreasEventsCopyWith<$Res>  {
  factory $ListDownloadedBoulderAreasEventsCopyWith(ListDownloadedBoulderAreasEvents value, $Res Function(ListDownloadedBoulderAreasEvents) _then) = _$ListDownloadedBoulderAreasEventsCopyWithImpl;
@useResult
$Res call({
 ApiOrderParam orderParam
});


$ApiOrderParamCopyWith<$Res> get orderParam;

}
/// @nodoc
class _$ListDownloadedBoulderAreasEventsCopyWithImpl<$Res>
    implements $ListDownloadedBoulderAreasEventsCopyWith<$Res> {
  _$ListDownloadedBoulderAreasEventsCopyWithImpl(this._self, this._then);

  final ListDownloadedBoulderAreasEvents _self;
  final $Res Function(ListDownloadedBoulderAreasEvents) _then;

/// Create a copy of ListDownloadedBoulderAreasEvents
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? orderParam = null,}) {
  return _then(_self.copyWith(
orderParam: null == orderParam ? _self.orderParam : orderParam // ignore: cast_nullable_to_non_nullable
as ApiOrderParam,
  ));
}
/// Create a copy of ListDownloadedBoulderAreasEvents
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiOrderParamCopyWith<$Res> get orderParam {
  
  return $ApiOrderParamCopyWith<$Res>(_self.orderParam, (value) {
    return _then(_self.copyWith(orderParam: value));
  });
}
}


/// @nodoc


class ListDownloadedBoulderAreasRequested extends ListDownloadedBoulderAreasEvents {
  const ListDownloadedBoulderAreasRequested({required this.orderParam}): super._();
  

@override final  ApiOrderParam orderParam;

/// Create a copy of ListDownloadedBoulderAreasEvents
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDownloadedBoulderAreasRequestedCopyWith<ListDownloadedBoulderAreasRequested> get copyWith => _$ListDownloadedBoulderAreasRequestedCopyWithImpl<ListDownloadedBoulderAreasRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDownloadedBoulderAreasRequested&&(identical(other.orderParam, orderParam) || other.orderParam == orderParam));
}


@override
int get hashCode => Object.hash(runtimeType,orderParam);

@override
String toString() {
  return 'ListDownloadedBoulderAreasEvents.requested(orderParam: $orderParam)';
}


}

/// @nodoc
abstract mixin class $ListDownloadedBoulderAreasRequestedCopyWith<$Res> implements $ListDownloadedBoulderAreasEventsCopyWith<$Res> {
  factory $ListDownloadedBoulderAreasRequestedCopyWith(ListDownloadedBoulderAreasRequested value, $Res Function(ListDownloadedBoulderAreasRequested) _then) = _$ListDownloadedBoulderAreasRequestedCopyWithImpl;
@override @useResult
$Res call({
 ApiOrderParam orderParam
});


@override $ApiOrderParamCopyWith<$Res> get orderParam;

}
/// @nodoc
class _$ListDownloadedBoulderAreasRequestedCopyWithImpl<$Res>
    implements $ListDownloadedBoulderAreasRequestedCopyWith<$Res> {
  _$ListDownloadedBoulderAreasRequestedCopyWithImpl(this._self, this._then);

  final ListDownloadedBoulderAreasRequested _self;
  final $Res Function(ListDownloadedBoulderAreasRequested) _then;

/// Create a copy of ListDownloadedBoulderAreasEvents
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? orderParam = null,}) {
  return _then(ListDownloadedBoulderAreasRequested(
orderParam: null == orderParam ? _self.orderParam : orderParam // ignore: cast_nullable_to_non_nullable
as ApiOrderParam,
  ));
}

/// Create a copy of ListDownloadedBoulderAreasEvents
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiOrderParamCopyWith<$Res> get orderParam {
  
  return $ApiOrderParamCopyWith<$Res>(_self.orderParam, (value) {
    return _then(_self.copyWith(orderParam: value));
  });
}
}

/// @nodoc
mixin _$ListDownloadedBoulderAreasStates {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDownloadedBoulderAreasStates);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListDownloadedBoulderAreasStates()';
}


}

/// @nodoc
class $ListDownloadedBoulderAreasStatesCopyWith<$Res>  {
$ListDownloadedBoulderAreasStatesCopyWith(ListDownloadedBoulderAreasStates _, $Res Function(ListDownloadedBoulderAreasStates) __);
}


/// @nodoc


class ListDownloadedBoulderAreasLoading extends ListDownloadedBoulderAreasStates {
  const ListDownloadedBoulderAreasLoading(): super._();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDownloadedBoulderAreasLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ListDownloadedBoulderAreasStates.loading()';
}


}




/// @nodoc


class ListDownloadedBoulderAreasOK extends ListDownloadedBoulderAreasStates {
  const ListDownloadedBoulderAreasOK({required final  List<DownloadedBoulderArea> boulderAreas, required this.orderParam}): _boulderAreas = boulderAreas,super._();
  

 final  List<DownloadedBoulderArea> _boulderAreas;
 List<DownloadedBoulderArea> get boulderAreas {
  if (_boulderAreas is EqualUnmodifiableListView) return _boulderAreas;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_boulderAreas);
}

 final  ApiOrderParam orderParam;

/// Create a copy of ListDownloadedBoulderAreasStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDownloadedBoulderAreasOKCopyWith<ListDownloadedBoulderAreasOK> get copyWith => _$ListDownloadedBoulderAreasOKCopyWithImpl<ListDownloadedBoulderAreasOK>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDownloadedBoulderAreasOK&&const DeepCollectionEquality().equals(other._boulderAreas, _boulderAreas)&&(identical(other.orderParam, orderParam) || other.orderParam == orderParam));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_boulderAreas),orderParam);

@override
String toString() {
  return 'ListDownloadedBoulderAreasStates.ok(boulderAreas: $boulderAreas, orderParam: $orderParam)';
}


}

/// @nodoc
abstract mixin class $ListDownloadedBoulderAreasOKCopyWith<$Res> implements $ListDownloadedBoulderAreasStatesCopyWith<$Res> {
  factory $ListDownloadedBoulderAreasOKCopyWith(ListDownloadedBoulderAreasOK value, $Res Function(ListDownloadedBoulderAreasOK) _then) = _$ListDownloadedBoulderAreasOKCopyWithImpl;
@useResult
$Res call({
 List<DownloadedBoulderArea> boulderAreas, ApiOrderParam orderParam
});


$ApiOrderParamCopyWith<$Res> get orderParam;

}
/// @nodoc
class _$ListDownloadedBoulderAreasOKCopyWithImpl<$Res>
    implements $ListDownloadedBoulderAreasOKCopyWith<$Res> {
  _$ListDownloadedBoulderAreasOKCopyWithImpl(this._self, this._then);

  final ListDownloadedBoulderAreasOK _self;
  final $Res Function(ListDownloadedBoulderAreasOK) _then;

/// Create a copy of ListDownloadedBoulderAreasStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? boulderAreas = null,Object? orderParam = null,}) {
  return _then(ListDownloadedBoulderAreasOK(
boulderAreas: null == boulderAreas ? _self._boulderAreas : boulderAreas // ignore: cast_nullable_to_non_nullable
as List<DownloadedBoulderArea>,orderParam: null == orderParam ? _self.orderParam : orderParam // ignore: cast_nullable_to_non_nullable
as ApiOrderParam,
  ));
}

/// Create a copy of ListDownloadedBoulderAreasStates
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ApiOrderParamCopyWith<$Res> get orderParam {
  
  return $ApiOrderParamCopyWith<$Res>(_self.orderParam, (value) {
    return _then(_self.copyWith(orderParam: value));
  });
}
}

/// @nodoc


class ListDownloadedBoulderAreasError extends ListDownloadedBoulderAreasStates {
  const ListDownloadedBoulderAreasError({this.error}): super._();
  

 final  Object? error;

/// Create a copy of ListDownloadedBoulderAreasStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ListDownloadedBoulderAreasErrorCopyWith<ListDownloadedBoulderAreasError> get copyWith => _$ListDownloadedBoulderAreasErrorCopyWithImpl<ListDownloadedBoulderAreasError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ListDownloadedBoulderAreasError&&const DeepCollectionEquality().equals(other.error, error));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(error));

@override
String toString() {
  return 'ListDownloadedBoulderAreasStates.error(error: $error)';
}


}

/// @nodoc
abstract mixin class $ListDownloadedBoulderAreasErrorCopyWith<$Res> implements $ListDownloadedBoulderAreasStatesCopyWith<$Res> {
  factory $ListDownloadedBoulderAreasErrorCopyWith(ListDownloadedBoulderAreasError value, $Res Function(ListDownloadedBoulderAreasError) _then) = _$ListDownloadedBoulderAreasErrorCopyWithImpl;
@useResult
$Res call({
 Object? error
});




}
/// @nodoc
class _$ListDownloadedBoulderAreasErrorCopyWithImpl<$Res>
    implements $ListDownloadedBoulderAreasErrorCopyWith<$Res> {
  _$ListDownloadedBoulderAreasErrorCopyWithImpl(this._self, this._then);

  final ListDownloadedBoulderAreasError _self;
  final $Res Function(ListDownloadedBoulderAreasError) _then;

/// Create a copy of ListDownloadedBoulderAreasStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = freezed,}) {
  return _then(ListDownloadedBoulderAreasError(
error: freezed == error ? _self.error : error ,
  ));
}


}

// dart format on
