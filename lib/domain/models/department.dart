import 'package:breizh_blok_mobile/domain/models/municipality.dart';

class Department {
  Department({
    required this.name,
    List<Municipality>? municipalities,
  }) : municipalities = municipalities ?? [];

  factory Department.fromJson(Map<String, dynamic> json) {
    if (json case {'name': final String name}) {
      var municipalities = <Municipality>[];
      final jsonMunicipalities = json['municipalities'];
      if (jsonMunicipalities is List) {
        municipalities = jsonMunicipalities
            .map<Municipality>(
              (m) => Municipality.fromJson(m as Map<String, dynamic>),
            )
            .toList();
      }
      return Department(
        name: name,
        municipalities: municipalities,
      );
    }

    throw const FormatException();
  }
  final String name;
  final List<Municipality> municipalities;
}
