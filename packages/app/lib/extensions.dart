import 'dart:convert';
import 'dart:math';

import 'package:breizh_blok_mobile/config/assets.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

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

  int createRandomColor() {
    final random = Random();
    return Color.fromARGB(
      255,
      random.nextInt(255),
      random.nextInt(255),
      random.nextInt(255),
    ).toARGB32();
  }
}

extension FeatureExtensionValueExtension on FeatureExtensionValue {
  Set<String> toBoulderIds() {
    return featureCollection
            ?.map(
              (f) =>
                  (f?['properties'] as Map<Object?, Object?>?)?['id']
                      .toString(),
            )
            .whereType<String>()
            .toSet() ??
        <String>{};
  }
}

extension MapboxExtension on MapboxMap {
  Future<void> showClusters(Map<String, dynamic> clusterSource) async {
    try {
      await style.styleSourceExists('boulders').then((value) async {
        if (!value) {
          final source = jsonEncode(clusterSource);
          await style.addStyleSource('boulders', source);
        }
      });
      await style.styleLayerExists('clusters').then((value) async {
        if (!value) {
          final layer = await rootBundle.loadString(Assets.clusterLayer);
          await style.addStyleLayer(layer, null);

          final clusterCountLayer = await rootBundle.loadString(
            Assets.clusterCountLayer,
          );

          await style.addStyleLayer(clusterCountLayer, null);

          final unclusteredLayer = await rootBundle.loadString(
            Assets.unclusteredPointLayer,
          );
          await style.addStyleLayer(unclusteredLayer, null);
        }
      });
    } catch (error, stackTrace) {
      if (kDebugMode) {
        debugPrint(error.toString());
      }
      await Sentry.captureException(error, stackTrace: stackTrace);
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

    final cluster =
        queriedRenderedFeatures
            .firstWhere(
              (q) => q?.queriedFeature.source == 'boulders',
              orElse: () => null,
            )
            ?.queriedFeature
            .feature;
    return cluster;
  }
}
