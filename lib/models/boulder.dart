import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:breizh_blok_mobile/models/line_boulder.dart';
import 'package:breizh_blok_mobile/models/rock.dart';
import 'package:equatable/equatable.dart';

class Boulder extends Equatable {
  final String id;
  final String iri;
  final String name;
  final List<LineBoulder> lineBoulders;
  final Grade? grade;
  final Rock rock;
  final String? description;

  Boulder({
    required this.iri,
    required this.name,
    List<LineBoulder>? lineBoulders,
    this.grade,
    required this.rock,
    this.description,
  })  : lineBoulders = lineBoulders ?? [],
        id = iri.replaceAll('/boulders/', '');

  factory Boulder.fromJson(Map<String, dynamic> json) {
    return Boulder(
      iri: json['@id'],
      name: json['name'],
      lineBoulders: json['lineBoulders'] != null
          ? json['lineBoulders']
              .map<LineBoulder>(
                (lineBoulder) => LineBoulder.fromJson(lineBoulder),
              )
              .toList()
          : [],
      grade: json['grade'] != null ? Grade.fromJson(json['grade']) : null,
      rock: Rock.fromJson(json['rock']),
      description: json['description'],
    );
  }

  @override
  List<Object?> get props => [iri];
}
