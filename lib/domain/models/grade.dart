import 'package:equatable/equatable.dart';

class Grade extends Equatable {
  const Grade({
    required this.iri,
    required this.name,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    if (json case {'@id': final String iri, 'name': final String name}) {
      return Grade(iri: iri, name: name);
    }
    throw const FormatException();
  }
  final String name;
  final String iri;

  @override
  List<Object?> get props => [iri];
}
