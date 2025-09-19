import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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
    return Consumer(
      builder: (context, ref, _) {
        return IconButton.filledTonal(
          onPressed: () async {
            await _onPressed(ref.read(locationProvider));
          },
          icon: Icon(
            isLocationShown ? Icons.location_off : Icons.my_location,
            semanticLabel: AppLocalizations.of(context).getMyLocation,
          ),
        );
      },
    );
  }

  Future<void> _onPressed(Location location) async {
    try {
      if (isLocationShown) {
        await onHideLocation();

        return;
      }

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
