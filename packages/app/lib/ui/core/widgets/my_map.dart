import 'package:breizh_blok_mobile/ui/core/widgets/my_map_location_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map_switch_style_button.dart';
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
  MapboxMap? _mapboxMap;

  final String _defaultStyle = MapboxStyles.OUTDOORS;
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
                setState(() {
                  _mapboxMap = mapboxMap;
                });
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
          if (mapboxMap != null)
            Positioned(
              right: 5,
              bottom: 55,
              child: MyMapLocationButton(
                isLocationShown: isLocationShown,
                onHideLocation: () async {
                  setState(() {
                    isLocationShown = false;
                  });
                  await mapboxMap.location.updateSettings(
                    LocationComponentSettings(
                      enabled: false,
                      pulsingEnabled: false,
                      puckBearingEnabled: false,
                    ),
                  );

                  setStateWithViewportAnimation(() {
                    _viewport = defaultViewPort;
                  }, transition: const FlyViewportTransition());
                },
                onShowLocation: () async {
                  setState(() {
                    isLocationShown = true;
                  });

                  await mapboxMap.location.updateSettings(
                    LocationComponentSettings(
                      enabled: true,
                      pulsingEnabled: true,
                      puckBearingEnabled: true,
                    ),
                  );

                  setStateWithViewportAnimation(() {
                    _viewport = const FollowPuckViewportState();
                  }, transition: const FlyViewportTransition());
                },
              ),
            ),
        ],
      ),
    );
  }
}
