import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/extensions/available_map_extension.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/available_maps_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_launcher/map_launcher.dart';

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
              final [availableMaps, boulderMarkers] = await Future.wait([
                MapLauncher.installedMaps,
                boulderMarkerRepository.findByBoulderArea(
                  boulderArea: boulderArea,
                ),
              ]);

              final parkingLocation = boulderArea.parkingLocation;
              emit(
                BoulderAreaMapOK(
                  onClickParking:
                      parkingLocation == null || availableMaps.isEmpty
                      ? null
                      : (context) async {
                          await showModalBottomSheet<void>(
                            context: context,
                            builder: (context) {
                              return AvailableMapsSheet(
                                onMapSelected: ({required map}) async {
                                  await map
                                      .safeShowDirections(
                                        destination: parkingLocation,
                                        destinationTitle:
                                            // ignore: lines_longer_than_80_chars
                                            '${AppLocalizations.of(context).parkingOfTheBoulderArea} ${boulderArea.name}',
                                      )
                                      .run();
                                },
                              );
                            },
                          );
                        },
                  boulderMarkers: boulderMarkers as List<BoulderMarker>,
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
    required Future<void> Function(BuildContext context)? onClickParking,
    required List<BoulderMarker> boulderMarkers,
  }) = BoulderAreaMapOK;
  const factory BoulderAreaMapStates.error() = BoulderAreaMapError;
}
