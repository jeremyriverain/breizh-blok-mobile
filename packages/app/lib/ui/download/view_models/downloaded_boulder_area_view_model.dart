import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloaded_boulder_area_view_model.freezed.dart';

class DownloadedBoulderAreaViewModel
    extends Bloc<DownloadedBoulderAreaEvents, DownloadedBoulderAreaStates> {
  DownloadedBoulderAreaViewModel({required this.id, required this.repository})
    : super(const DownloadedBoulderAreaLoading()) {
    on<DownloadedBoulderAreaEvents>((event, emit) async {
      switch (event) {
        case DownloadedBoulderAreaRequested():
          {
            try {
              emit(const DownloadedBoulderAreaLoading());
              final boulderArea = await _findBoulderArea();
              emit(DownloadedBoulderAreaOK(boulderArea: boulderArea));
            } catch (e) {
              emit(DownloadedBoulderAreaError(error: e));
            }
          }
      }
    });
    add(const DownloadedBoulderAreaRequested());
  }

  final String id;

  final BoulderAreaRepository repository;

  Future<BoulderArea> _findBoulderArea() {
    return repository.find(id, offlineFirst: true);
  }
}

@freezed
sealed class DownloadedBoulderAreaEvents with _$DownloadedBoulderAreaEvents {
  const DownloadedBoulderAreaEvents._();

  const factory DownloadedBoulderAreaEvents.requested() =
      DownloadedBoulderAreaRequested;
}

@freezed
sealed class DownloadedBoulderAreaStates with _$DownloadedBoulderAreaStates {
  const DownloadedBoulderAreaStates._();

  const factory DownloadedBoulderAreaStates.loading() =
      DownloadedBoulderAreaLoading;
  const factory DownloadedBoulderAreaStates.ok({
    required BoulderArea boulderArea,
  }) = DownloadedBoulderAreaOK;
  const factory DownloadedBoulderAreaStates.error({Object? error}) =
      DownloadedBoulderAreaError;
}
