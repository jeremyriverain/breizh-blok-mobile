import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class MapPermissionEvent {}

class RequestPermissionEvent extends MapPermissionEvent {
  RequestPermissionEvent({required this.hasDenied});

  final bool hasDenied;
}

class MapPermissionState extends Equatable {
  const MapPermissionState({
    this.hasRequested = false,
    this.hasDenied = false,
  });

  final bool hasRequested;
  final bool hasDenied;

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
