import 'package:breizh_blok_mobile/domain/models/grade.dart';
import 'package:breizh_blok_mobile/domain/models/line_boulder.dart';
import 'package:breizh_blok_mobile/domain/models/rock.dart';
import 'package:equatable/equatable.dart';

class Boulder extends Equatable {
  Boulder({
    required this.iri,
    required this.name,
    required this.rock,
    List<LineBoulder>? lineBoulders,
    this.grade,
    this.description,
  })  : lineBoulders = lineBoulders ?? [],
        id = iri.replaceAll('/boulders/', '');

  factory Boulder.fromJson(Map<String, dynamic> json) {
    return Boulder(
      iri: json['@id'] as String,
      name: json['name'] as String,
      lineBoulders: json['lineBoulders'] != null
          ? (json['lineBoulders'] as List<dynamic>)
              .map<LineBoulder>(
                (l) => LineBoulder.fromJson(l as Map<String, dynamic>),
              )
              .toList()
          : [],
      grade: json['grade'] != null
          ? Grade.fromJson(json['grade'] as Map<String, dynamic>)
          : null,
      rock: Rock.fromJson(json['rock'] as Map<String, dynamic>),
      description: json['description'] as String?,
    );
  }
  final String id;
  final String iri;
  final String name;
  final List<LineBoulder> lineBoulders;
  final Grade? grade;
  final Rock rock;
  final String? description;

  @override
  List<Object?> get props => [iri];
}
