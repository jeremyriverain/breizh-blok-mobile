import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineBloc extends Bloc<OfflineBlocEvent, OfflineState> {
  OfflineBloc() : super(OfflineState()) {
    on<DownloadBoulderAreaEvent>((event, emit) {
      // print('download boulder area, ${event.boulderAreaIri}');
    });
    on<DeleteDownloadBoulderAreaEvent>((event, emit) {
      // print('delete download boulder area, ${event.boulderAreaIri}');
    });
  }
}

abstract class OfflineBlocEvent {}

class DownloadBoulderAreaEvent extends OfflineBlocEvent {
  DownloadBoulderAreaEvent({
    required this.boulderAreaIri,
  });

  final String boulderAreaIri;
}

class DeleteDownloadBoulderAreaEvent extends OfflineBlocEvent {
  DeleteDownloadBoulderAreaEvent({
    required this.boulderAreaIri,
  });

  final String boulderAreaIri;
}

class OfflineState {}
