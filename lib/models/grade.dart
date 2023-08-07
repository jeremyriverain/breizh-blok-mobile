class Grade {
  final String name;
  final String iri;

  Grade({
    required this.iri,
    required this.name,
  });

  factory Grade.fromJson(Map<String, dynamic> json) {
    return Grade(
      iri: json['@id'],
      name: json['name'],
    );
  }
}
