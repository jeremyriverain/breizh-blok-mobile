import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_permission_bloc.freezed.dart';

abstract class MapPermissionEvent {}

class RequestPermissionEvent extends MapPermissionEvent {
  RequestPermissionEvent({required this.hasDenied});

  final bool hasDenied;
}

@freezed
abstract class MapPermissionState with _$MapPermissionState {
  const factory MapPermissionState({
    @Default(false) bool hasRequested,
    @Default(false) bool hasDenied,
  }) = _MapPermissionState;

  const MapPermissionState._();

  bool get hasPermission {
    return !hasDenied && hasRequested;
  }
}

class MapPermissionBloc extends Bloc<MapPermissionEvent, MapPermissionState> {
  MapPermissionBloc() : super(const MapPermissionState()) {
    on<RequestPermissionEvent>(
      (event, emit) => emit(
        MapPermissionState(hasRequested: true, hasDenied: event.hasDenied),
      ),
    );
  }
}
