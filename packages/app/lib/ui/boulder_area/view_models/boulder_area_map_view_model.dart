import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_area_map_view_model.freezed.dart';

class BoulderAreaMapViewModel
    extends Bloc<BoulderAreaMapEvents, BoulderAreaMapStates> {
  BoulderAreaMapViewModel({
    required this.boulderArea,
    required this.boulderMarkerRepository,
  }) : super(const BoulderAreaMapIdle()) {
    on<BoulderAreaMapEvents>((event, emit) async {
      switch (event) {
        case BoulderAreaMapInit():
          {
            try {
              final boulderMarkers = await boulderMarkerRepository
                  .findByBoulderArea(
                    boulderArea: boulderArea,
                  );

              emit(
                BoulderAreaMapOK(
                  boulderMarkers: boulderMarkers,
                ),
              );
            } catch (e) {
              emit(const BoulderAreaMapError());
            }
          }
      }
    });
    add(const BoulderAreaMapInit());
  }

  final BoulderArea boulderArea;
  final BoulderMarkerRepository boulderMarkerRepository;
}

@freezed
sealed class BoulderAreaMapEvents with _$BoulderAreaMapEvents {
  const BoulderAreaMapEvents._();

  const factory BoulderAreaMapEvents.init() = BoulderAreaMapInit;
}

@freezed
sealed class BoulderAreaMapStates with _$BoulderAreaMapStates {
  const BoulderAreaMapStates._();

  const factory BoulderAreaMapStates.idle() = BoulderAreaMapIdle;
  const factory BoulderAreaMapStates.ok({
    required List<BoulderMarker> boulderMarkers,
  }) = BoulderAreaMapOK;
  const factory BoulderAreaMapStates.error() = BoulderAreaMapError;
}
