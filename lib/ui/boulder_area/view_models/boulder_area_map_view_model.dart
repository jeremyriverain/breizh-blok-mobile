import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/domain/models/map/map_directions.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
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
                            await MapDirections.openMapsSheet(
                              context: context,
                              availableMaps:
                                  availableMaps as List<AvailableMap>,
                              onMapSelectedFn: MapDirections.showDirections(
                                destination: parkingLocation,
                                destinationTitle:
                                    // ignore: lines_longer_than_80_chars
                                    '${AppLocalizations.of(context).parkingOfTheBoulderArea} ${boulderArea.name}',
                              ),
                            );
                          },
                  clusterSource: _getClusterSource(
                    boulderMarkers: boulderMarkers as List<BoulderMarker>,
                  ),
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

  Map<String, dynamic> _getClusterSource({
    required List<BoulderMarker> boulderMarkers,
  }) {
    return {
      'type': 'geojson',
      'cluster': true,
      'clusterMaxZoom': 20,
      'clusterRadius': 50,
      'data': {
        'type': 'FeatureCollection',
        'features': [
          for (final boulderMarker in boulderMarkers) boulderMarker.toGeojson(),
        ],
      },
    };
  }
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
    required Map<String, dynamic> clusterSource,
    required List<BoulderMarker> boulderMarkers,
  }) = BoulderAreaMapOK;
  const factory BoulderAreaMapStates.error() = BoulderAreaMapError;
}
