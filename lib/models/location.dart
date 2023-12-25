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
