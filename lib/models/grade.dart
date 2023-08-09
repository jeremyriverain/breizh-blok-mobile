import 'package:equatable/equatable.dart';

class Grade extends Equatable {
  final String name;
  final String iri;

  const Grade({
    required this.iri,
    required this.name,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      iri: json['@id'],
      name: json['name'],
    );
  }

  @override
  List<Object?> get props => [iri];
}
