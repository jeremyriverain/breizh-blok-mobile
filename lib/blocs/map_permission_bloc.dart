import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MapPermissionEvent {}

class RequestPermissionEvent extends MapPermissionEvent {
  final bool hasDenied;

  RequestPermissionEvent({required this.hasDenied});
}

class MapPermissionState extends Equatable {
  final bool hasRequested;
  final bool hasDenied;

  const MapPermissionState({
    this.hasRequested = false,
    this.hasDenied = false,
  });

  @override
  List<Object?> get props => [hasRequested];

  bool get hasPermission {
    return !hasDenied && hasRequested;
  }
}

class MapPermissionBloc extends Bloc<MapPermissionEvent, MapPermissionState> {
  MapPermissionBloc() : super(const MapPermissionState()) {
    on<RequestPermissionEvent>(
      (event, emit) => emit(
        MapPermissionState(
          hasRequested: true,
          hasDenied: event.hasDenied,
        ),
      ),
    );
  }
}
