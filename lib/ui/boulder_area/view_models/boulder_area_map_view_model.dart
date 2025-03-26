import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_directions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_launcher/map_launcher.dart';

part 'boulder_area_map_view_model.freezed.dart';

class BoulderAreaMapViewModel
    extends Bloc<BoulderAreaMapEvents, BoulderAreaMapStates> {
  BoulderAreaMapViewModel({required this.boulderArea})
    : super(const BoulderAreaMapIdle()) {
    on<BoulderAreaMapEvents>((event, emit) async {
      switch (event) {
        case BoulderAreaMapInit():
          {
            final availableMaps = await MapLauncher.installedMaps;
            final parkingLocation = boulderArea.parkingLocation;
            emit(
              BoulderAreaMapOK(
                onClickParking:
                    parkingLocation == null
                        ? null
                        : (context) async {
                          await MapDirections.openMapsSheet(
                            context: context,
                            availableMaps: availableMaps,
                            onMapSelectedFn: MapDirections.showDirections(
                              destination: parkingLocation,
                              destinationTitle:
                                  // ignore: lines_longer_than_80_chars
                                  '${AppLocalizations.of(context).parkingOfTheBoulderArea} ${boulderArea.name}',
                            ),
                          );
                        },
              ),
            );
          }
      }
    });
    add(const BoulderAreaMapInit());
  }

  final BoulderArea boulderArea;
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
    required Future<void> Function(BuildContext context)? onClickParking,
  }) = BoulderAreaMapOK;
}
