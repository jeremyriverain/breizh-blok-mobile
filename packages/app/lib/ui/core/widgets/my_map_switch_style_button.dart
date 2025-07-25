import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_maps_flutter/mapbox_maps_flutter.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyMapSwitchStyleButton extends StatelessWidget {
  const MyMapSwitchStyleButton({
    required this.mapboxMap,
    required this.defaultStyle,
    super.key,
  });

  final MapboxMap mapboxMap;
  final String defaultStyle;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () async {
        try {
          final currentStyle = await mapboxMap.style.getStyleURI();
          if (currentStyle == defaultStyle) {
            await mapboxMap.style.setStyleURI(MapboxStyles.SATELLITE);
          } else {
            await mapboxMap.style.setStyleURI(defaultStyle);
          }
        } catch (error, stackTrace) {
          Sentry.captureException(error, stackTrace: stackTrace).ignore();
        }
      },
      icon: Icon(
        Icons.layers,
        semanticLabel: AppLocalizations.of(context).changeStyleMap,
      ),
    );
  }
}
