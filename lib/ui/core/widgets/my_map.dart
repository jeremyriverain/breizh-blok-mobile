// import 'dart:typed_data';
// import 'dart:ui' as ui;

import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({
    super.key,
    this.cameraOptions,
    this.onMapCreated,
    this.onStyleLoadedListener,
    this.onTapListener,
  });

  final CameraOptions? cameraOptions;
  final void Function(MapboxMap)? onMapCreated;
  final void Function(MapboxMap mapboxMap, StyleLoadedEventData)?
  onStyleLoadedListener;
  final void Function(MapboxMap mapboxMap, MapContentGestureContext)?
  onTapListener;

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late MapboxMap _mapboxMap;

  final _defaultStyle = MapboxStyles.OUTDOORS;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Stack(
        children: [
          MapWidget(
            styleUri: _defaultStyle,
            cameraOptions: widget.cameraOptions,
            gestureRecognizers: const {
              Factory<EagerGestureRecognizer>(EagerGestureRecognizer.new),
            },
            onMapCreated: (mapboxMap) async {
              try {
                _mapboxMap = mapboxMap;
                await _mapboxMap.attribution.updateSettings(
                  AttributionSettings(enabled: false),
                );
                widget.onMapCreated?.call(_mapboxMap);
              } catch (exception, stackTrace) {
                if (kDebugMode) {
                  debugPrint(exception.toString());
                }
                await Sentry.captureException(
                  exception,
                  stackTrace: stackTrace,
                );
              }
            },
            onStyleLoadedListener: (styleLoadedEventData) {
              try {
                widget.onStyleLoadedListener?.call(
                  _mapboxMap,
                  styleLoadedEventData,
                );
              } catch (exception, stackTrace) {
                if (kDebugMode) {
                  debugPrint(exception.toString());
                }
                Sentry.captureException(exception, stackTrace: stackTrace);
              }
            },
            onTapListener: (mapContentGestureContext) {
              try {
                widget.onTapListener?.call(
                  _mapboxMap,
                  mapContentGestureContext,
                );
              } catch (exception, stackTrace) {
                if (kDebugMode) {
                  debugPrint(exception.toString());
                }
                Sentry.captureException(exception, stackTrace: stackTrace);
              }
            },
          ),
          Positioned(
            right: 5,
            bottom: 5,
            child: IconButton.filledTonal(
              onPressed: () async {
                final currentStyle = await _mapboxMap.style.getStyleURI();
                if (currentStyle == _defaultStyle) {
                  await _mapboxMap.style.setStyleURI(MapboxStyles.SATELLITE);
                } else {
                  await _mapboxMap.style.setStyleURI(_defaultStyle);
                }
              },
              icon: Icon(
                Icons.layers,
                semanticLabel: AppLocalizations.of(context).changeStyleMap,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
