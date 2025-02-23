import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoulderMarker with ClusterItem {
  BoulderMarker({
    required this.id,
    required this.location,
  });

  factory BoulderMarker.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          'id': final int id,
          'rock': {
            'location': {
              'latitude': final String latitude,
              'longitude': final String longitude,
            }
          }
        }) {
      return BoulderMarker(
        id: id,
        location: LatLng(
          double.parse(latitude),
          double.parse(longitude),
        ),
      );
    }

    throw const FormatException();
  }
  final int id;
  @override
  final LatLng location;
}
