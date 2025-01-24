import 'package:google_maps_flutter/google_maps_flutter.dart';

const kDefaultInitialPosition = LatLng(
  48.066152,
  -2.967056,
);

class Location {
  Location({required this.latitude, required this.longitude});

  factory Location.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'latitude': final String latitude,
          'longitude': final String longitude
        }) {
      return Location(
        latitude: double.parse(latitude),
        longitude: double.parse(longitude),
      );
    }

    throw const FormatException();
  }
  double latitude;
  double longitude;
}
