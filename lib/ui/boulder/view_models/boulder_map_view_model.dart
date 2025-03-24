import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_directions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_launcher/map_launcher.dart';

part 'boulder_map_view_model.freezed.dart';

class BoulderMapViewModel extends Bloc<BoulderMapEvents, BoulderMapStates> {
  BoulderMapViewModel({required this.boulder}) : super(const BoulderMapIdle()) {
    on<BoulderMapEvents>((event, emit) async {
      switch (event) {
        case BoulderMapInit():
          {
            final availableMaps = await MapLauncher.installedMaps;
            emit(
              BoulderMapOK(
                onClickMarker: (context) async {
                  await MapDirections.openMapsSheet(
                    context: context,
                    availableMaps: availableMaps,
                    onMapSelectedFn: MapDirections.showDirections(
                      destination: boulder.rock.location,
                      destinationTitle: boulder.name,
                    ),
                  );
                },
              ),
            );
          }
      }
    });
    add(const BoulderMapInit());
  }

  final Boulder boulder;
}

@freezed
sealed class BoulderMapEvents with _$BoulderMapEvents {
  const BoulderMapEvents._();

  const factory BoulderMapEvents.init() = BoulderMapInit;
}

@freezed
sealed class BoulderMapStates with _$BoulderMapStates {
  const BoulderMapStates._();

  const factory BoulderMapStates.idle() = BoulderMapIdle;
  const factory BoulderMapStates.ok({
    required Future<void> Function(BuildContext context) onClickMarker,
  }) = BoulderMapOK;
}
