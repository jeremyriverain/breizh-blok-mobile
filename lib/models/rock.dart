import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:equatable/equatable.dart';

class Rock extends Equatable {
  Rock({
    required this.iri,
    required this.boulderArea,
    required this.location,
  }) : id = iri.replaceAll('/rocks/', '');

  factory Rock.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          '@id': final String iri,
          'boulderArea': final Map<String, dynamic> jsonBoulderArea,
          'location': final Map<String, dynamic> jsonLocation,
        }) {
      return Rock(
        iri: iri,
        boulderArea: BoulderArea.fromJson(jsonBoulderArea),
        location: Location.fromJson(jsonLocation),
      );
    }

    throw const FormatException();
  }
  final String id;
  final String iri;
  final BoulderArea boulderArea;
  final Location location;

  @override
  List<Object?> get props => [iri];
}
