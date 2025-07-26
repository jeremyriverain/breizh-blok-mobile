import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:location/location.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyMapLocationButton extends StatelessWidget {
  const MyMapLocationButton({
    required this.isLocationShown,
    required this.onHideLocation,
    required this.onShowLocation,
    super.key,
  });

  final bool isLocationShown;

  final Future<void> Function() onHideLocation;
  final Future<void> Function() onShowLocation;

  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: () async {
        await _onPressed();
      },
      icon: Icon(
        isLocationShown ? Icons.location_off : Icons.my_location,
        semanticLabel: AppLocalizations.of(context).getMyLocation,
      ),
    );
  }

  Future<void> _onPressed() async {
    try {
      if (isLocationShown) {
        await onHideLocation();

        return;
      }

      final location = GetIt.I<Location>();

      if (!await location.serviceEnabled() &&
          !await location.requestService()) {
        return;
      }

      final permission = await location.hasPermission();

      if (permission == PermissionStatus.deniedForever) {
        return;
      }

      if (permission == PermissionStatus.denied) {
        final permissionRequested = await location.requestPermission();
        if (permissionRequested != PermissionStatus.granted &&
            permissionRequested != PermissionStatus.grantedLimited) {
          return;
        }
      }

      await onShowLocation();
    } catch (error, stackTrace) {
      Sentry.captureException(error, stackTrace: stackTrace).ignore();
    }
  }
}
