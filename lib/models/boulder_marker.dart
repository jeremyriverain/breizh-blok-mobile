import 'package:equatable/equatable.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

// ignore: must_be_immutable
class BoulderMarker extends Equatable with ClusterItem {
  final int id;
  @override
  final LatLng location;

  BoulderMarker({
    required this.id,
    required this.location,
  });

  factory BoulderMarker.fromJson(Map<String, dynamic> json) {
    final location = json['rock']['location'];
    return BoulderMarker(
      id: json['id'],
      location: LatLng(double.parse(location['latitude']),
          double.parse(location['longitude'])),
    );
  }

  @override
  List<Object?> get props => [id, location];
}
