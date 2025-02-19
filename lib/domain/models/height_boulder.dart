import 'package:equatable/equatable.dart';

class HeightBoulder extends Equatable {
  const HeightBoulder({
    required this.iri,
    required this.min,
    this.max,
  });

  factory HeightBoulder.fromJson(Map<String, dynamic> json) {
    if (json
        case {
          '@id': final String iri,
          'min': final int min,
          'max': final int? max
        }) {
      return HeightBoulder(iri: iri, min: min, max: max);
    }
    throw const FormatException();
  }

  final String iri;
  final int min;
  final int? max;

  @override
  List<Object?> get props => [iri];
}
