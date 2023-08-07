import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:equatable/equatable.dart';

class Rock extends Equatable {
  final String id;
  final String iri;
  final BoulderArea boulderArea;
  final Location location;

  Rock({
    required this.iri,
    required this.boulderArea,
    required this.location,
  }) : id = iri.replaceAll('/rocks/', '');

  factory Rock.fromJson(Map<String, dynamic> json) {
    return Rock(
      iri: json['@id'],
      boulderArea: BoulderArea.fromJson(json['boulderArea']),
      location: Location.fromJson(json['location']),
    );
  }

  @override
  List<Object?> get props => [iri];
}
