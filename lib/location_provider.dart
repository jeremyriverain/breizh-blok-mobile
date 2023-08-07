import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider extends InheritedWidget {
  static LocationProvider of(BuildContext context) {
    final LocationProvider? result =
        context.dependOnInheritedWidgetOfExactType<LocationProvider>();

    if (result == null) {
      throw 'No LocationProvider found';
    }

    return result;
  }

  final Location locationInstance;

  const LocationProvider({
    super.key,
    required super.child,
    required this.locationInstance,
  });

  @override
  bool updateShouldNotify(LocationProvider oldWidget) {
    return false;
  }
}
