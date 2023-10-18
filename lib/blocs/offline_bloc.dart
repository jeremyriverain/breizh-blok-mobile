import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OfflineBloc extends Bloc<OfflineBlocEvent, OfflineState> {
  OfflineBloc({
    required this.database,
  }) : super(OfflineState()) {
    on<DownloadBoulderAreaEvent>((event, emit) {
      // print('download boulder area, ${event.boulderAreaIri}');
    });
    on<DeleteDownloadBoulderAreaEvent>((event, emit) {
      // print('delete download boulder area, ${event.boulderAreaIri}');
    });
  }

  final AppDatabase database;
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
