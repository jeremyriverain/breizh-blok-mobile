import 'package:flutter/material.dart';
import 'package:location/location.dart';

class LocationProvider extends InheritedWidget {
  const LocationProvider({
    required super.child,
    required this.locationInstance,
    super.key,
  });
  static LocationProvider of(BuildContext context) {
    final result =
        context.dependOnInheritedWidgetOfExactType<LocationProvider>();

    if (result == null) {
      throw 'No LocationProvider found';
    }

    return result;
  }

  final Location locationInstance;

  @override
  bool updateShouldNotify(LocationProvider oldWidget) {
    return false;
  }
}
