import 'package:breizh_blok_mobile/models/municipality.dart';

class Department {
  final String name;
  final List<Municipality> municipalities;

  Department({
    required this.name,
    List<Municipality>? municipalities,
  }) : municipalities = municipalities ?? [];

  factory Department.fromJson(Map<String, dynamic> json) {
    return Department(
      name: json['name'],
      municipalities: json['municipalities'] != null
          ? json['municipalities']
              .map<Municipality>(
                (municipality) => Municipality.fromJson(municipality),
              )
              .toList()
          : [],
    );
  }
}
