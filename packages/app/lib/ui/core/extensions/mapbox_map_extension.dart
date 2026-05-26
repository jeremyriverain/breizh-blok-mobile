import 'dart:convert';

import 'package:breizh_blok_mobile/domain/entities/boulder_marker/boulder_marker.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

extension MapboxExtension on MapboxMap {
  TaskEither<UnknownException, void> showClusters(
    List<BoulderMarker> boulderMarkers,
  ) {
    return TaskEither.tryCatch(
      () async {
        final geoJsonSource = GeoJsonSource(
          id: 'boulders',
          cluster: true,
          clusterMaxZoom: 20,
          clusterRadius: 50,

          data: jsonEncode(
            FeatureCollection(
              features: [
                for (final boulderMarker in boulderMarkers)
                  boulderMarker.toFeature(),
              ],
            ).toJson(),
          ),
        );

        final clusterLayer = CircleLayer(
          id: 'clusters',
          sourceId: geoJsonSource.id,
          filter: ['has', 'point_count'],
          circleColorExpression: [
            'step',
            ['get', 'point_count'],
            '#51bbd6',
            100,
            '#f1f075',
            750,
            '#f28cb1',
          ],
          circleRadiusExpression: [
            'step',
            ['get', 'point_count'],
            20,
            100,
            30,
            750,
            40,
          ],
        );
        final clusterCountLayer = SymbolLayer(
          id: 'cluster-count',
          sourceId: geoJsonSource.id,
          filter: ['has', 'point_count'],
          textField: '{point_count_abbreviated}',
          textFont: ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
          textSize: 12,
        );

        final unclusteredPointLayer = CircleLayer(
          id: 'unclustered-point',
          sourceId: geoJsonSource.id,
          filter: [
            '!',
            ['has', 'point_count'],
          ],
          circleColor: 0xFF11b4da,
          circleRadius: 6,
          circleStrokeWidth: 1,
          circleStrokeColor: 0xFFffffff,
        );

        try {
          await style.removeStyleLayer(clusterLayer.id);
        } catch (e) {
          debugPrint(e.toString());
        }

        try {
          await style.removeStyleLayer(clusterCountLayer.id);
        } catch (e) {
          debugPrint(e.toString());
        }

        try {
          await style.removeStyleLayer(unclusteredPointLayer.id);
        } catch (e) {
          debugPrint(e.toString());
        }

        try {
          await style.removeStyleSource(geoJsonSource.id);
        } catch (e) {
          debugPrint(e.toString());
        }

        await Future.wait([
          style.addSource(geoJsonSource),
          style.addLayer(clusterLayer),
          style.addLayer(clusterCountLayer),
          style.addLayer(unclusteredPointLayer),
        ]);
      },
      (e, _) => UnknownException(message: e.toString()),
    );
  }

  Future<Map<String?, Object?>?> onTapFindCluster(
    MapContentGestureContext mapContentGestureContext,
  ) async {
    final renderedQueryGeometry = RenderedQueryGeometry.fromScreenCoordinate(
      mapContentGestureContext.touchPosition,
    );

    final queriedRenderedFeatures = await queryRenderedFeatures(
      renderedQueryGeometry,
      RenderedQueryOptions(layerIds: ['clusters']),
    );

    final cluster = queriedRenderedFeatures
        .firstWhere(
          (q) => q?.queriedFeature.source == 'boulders',
          orElse: () => null,
        )
        ?.queriedFeature
        .feature;
    return cluster;
  }
}
