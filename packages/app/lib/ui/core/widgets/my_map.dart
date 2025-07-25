// import 'dart:typed_data';
// import 'dart:ui' as ui;

// ignore_for_file: require_trailing_commas

import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map_switch_style_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
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
  MapboxMap? _mapboxMap;

  final _defaultStyle = MapboxStyles.OUTDOORS;
  late ViewportState _viewport;

  CameraViewportState get defaultViewPort => CameraViewportState(
    center: widget.cameraOptions?.center,
    zoom: widget.cameraOptions?.zoom,
    bearing: 0,
  );

  @override
  void initState() {
    super.initState();
    _viewport = defaultViewPort;
  }

  bool isLocationShown = false;

  @override
  Widget build(BuildContext context) {
    final mapboxMap = _mapboxMap;
    return RepaintBoundary(
      child: Stack(
        children: [
          MapWidget(
            styleUri: _defaultStyle,
            cameraOptions: widget.cameraOptions,
            gestureRecognizers: const {
              Factory<EagerGestureRecognizer>(EagerGestureRecognizer.new),
            },
            viewport: _viewport,
            onMapCreated: (mapboxMap) async {
              try {
                _mapboxMap = mapboxMap;
                await _mapboxMap?.attribution.updateSettings(
                  AttributionSettings(enabled: false),
                );
                widget.onMapCreated?.call(mapboxMap);
              } catch (exception, stackTrace) {
                Sentry.captureException(
                  exception,
                  stackTrace: stackTrace,
                ).ignore();
              }
            },
            onStyleLoadedListener: (styleLoadedEventData) {
              try {
                final mapboxMap = _mapboxMap;
                if (mapboxMap != null) {
                  widget.onStyleLoadedListener?.call(
                    mapboxMap,
                    styleLoadedEventData,
                  );
                }
              } catch (exception, stackTrace) {
                Sentry.captureException(
                  exception,
                  stackTrace: stackTrace,
                ).ignore();
              }
            },
            onTapListener: (mapContentGestureContext) {
              try {
                final mapboxMap = _mapboxMap;
                if (mapboxMap != null) {
                  widget.onTapListener?.call(
                    mapboxMap,
                    mapContentGestureContext,
                  );
                }
              } catch (exception, stackTrace) {
                Sentry.captureException(
                  exception,
                  stackTrace: stackTrace,
                ).ignore();
              }
            },
          ),
          if (mapboxMap != null)
            Positioned(
              right: 5,
              bottom: 5,
              child: MyMapSwitchStyleButton(
                mapboxMap: mapboxMap,
                defaultStyle: _defaultStyle,
              ),
            ),
          Positioned(
            right: 5,
            bottom: 55,
            child: IconButton.filledTonal(
              onPressed: () async {
                try {
                  if (isLocationShown) {
                    setState(() {
                      isLocationShown = false;
                    });
                    await _mapboxMap?.location.updateSettings(
                      LocationComponentSettings(
                        enabled: false,
                        pulsingEnabled: false,
                        puckBearingEnabled: false,
                      ),
                    );

                    setStateWithViewportAnimation(() {
                      _viewport = defaultViewPort;
                    }, transition: const FlyViewportTransition());

                    return;
                  }

                  final location = Location();

                  final serviceEnabled = await location.serviceEnabled();
                  if (!serviceEnabled) {
                    if (!await location.requestService()) {
                      return;
                    }
                  }

                  final permissionGranted = await location.hasPermission();
                  if (permissionGranted == PermissionStatus.denied) {
                    if (await location.requestPermission() !=
                        PermissionStatus.granted) {
                      return;
                    }
                  }

                  setState(() {
                    isLocationShown = true;
                  });

                  await _mapboxMap?.location.updateSettings(
                    LocationComponentSettings(
                      enabled: true,
                      pulsingEnabled: true,
                      puckBearingEnabled: true,
                    ),
                  );

                  setStateWithViewportAnimation(() {
                    _viewport = const FollowPuckViewportState();
                  }, transition: const FlyViewportTransition());
                } catch (error, stackTrace) {
                  Sentry.captureException(
                    error,
                    stackTrace: stackTrace,
                  ).ignore();
                }
              },
              icon: Icon(
                isLocationShown ? Icons.location_off : Icons.my_location,
                semanticLabel: AppLocalizations.of(context).getMyLocation,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
