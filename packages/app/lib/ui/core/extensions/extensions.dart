import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';

extension BuildContextExtension on BuildContext {
  Future<Uint8List> getResponsiveImageData({required String imagePath}) async {
    final devicePixelRatio = MediaQuery.devicePixelRatioOf(this);
    try {
      final bytes = await rootBundle.load(
        devicePixelRatio != 1
            ? imagePath.replaceFirst(
                '/images/',
                '/images/${devicePixelRatio.toInt()}.0x/',
              )
            : imagePath,
      );
      return bytes.buffer.asUint8List();
    } catch (e) {
      final bytes = await rootBundle.load(imagePath);
      return bytes.buffer.asUint8List();
    }
  }
}

extension FeatureExtensionValueExtension on FeatureExtensionValue {
  Set<String> toBoulderIds() {
    return featureCollection
            ?.map(
              (f) => (f?['properties'] as Map<Object?, Object?>?)?['id']
                  .toString(),
            )
            .whereType<String>()
            .toSet() ??
        <String>{};
  }
}

extension MapboxExtension on MapboxMap {
  Future<void> showClusters(GeoJsonSource geoJsonSource) async {
    try {
      await style.styleSourceExists(geoJsonSource.id).then((value) async {
        if (!value) {
          await style.addSource(geoJsonSource);
        }
      });
      await style.styleLayerExists('clusters').then((value) async {
        if (!value) {
          await style.addLayer(
            CircleLayer(
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
            ),
          );

          await style.addLayer(
            SymbolLayer(
              id: 'cluster-count',
              sourceId: geoJsonSource.id,
              filter: ['has', 'point_count'],
              textField: '{point_count_abbreviated}',
              textFont: ['DIN Offc Pro Medium', 'Arial Unicode MS Bold'],
              textSize: 12,
            ),
          );

          await style.addLayer(
            CircleLayer(
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
            ),
          );
        }
      });
    } catch (e, _) {
      debugPrint(e.toString());
    }
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
