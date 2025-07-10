import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloaded_boulder_view_model.freezed.dart';

class DownloadedBoulderViewModel
    extends Bloc<DownloadedBoulderEvents, DownloadedBoulderStates> {
  DownloadedBoulderViewModel({
    required this.boulderAreaIri,
    required this.boulderId,
    required this.repository,
  }) : super(const DownloadedBoulderLoading()) {
    on<DownloadedBoulderEvents>((event, emit) async {
      switch (event) {
        case DownloadedBoulderRequested():
          {
            try {
              emit(const DownloadedBoulderLoading());
              final boulder = await _findBoulder();
              emit(DownloadedBoulderOK(boulder: boulder));
            } catch (e) {
              emit(DownloadedBoulderError(error: e));
            }
          }
      }
    });
    add(const DownloadedBoulderRequested());
  }

  final String boulderId;
  final String boulderAreaIri;

  final DownloadedBoulderRepository repository;

  Future<Boulder> _findBoulder() {
    return repository.find(
      boulderAreaIri: boulderAreaIri,
      boulderId: boulderId,
    );
  }
}

@freezed
sealed class DownloadedBoulderEvents with _$DownloadedBoulderEvents {
  const DownloadedBoulderEvents._();

  const factory DownloadedBoulderEvents.requested() =
      DownloadedBoulderRequested;
}

@freezed
sealed class DownloadedBoulderStates with _$DownloadedBoulderStates {
  const DownloadedBoulderStates._();

  const factory DownloadedBoulderStates.loading() = DownloadedBoulderLoading;
  const factory DownloadedBoulderStates.ok({required Boulder boulder}) =
      DownloadedBoulderOK;
  const factory DownloadedBoulderStates.error({Object? error}) =
      DownloadedBoulderError;
}
