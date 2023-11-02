import 'package:equatable/equatable.dart';

class DownloadedBoulderArea extends Equatable {
  const DownloadedBoulderArea({
    required this.boulderAreaName,
    required this.municipalityName,
    required this.boulderAreaIri,
  });

  final String boulderAreaName;
  final String municipalityName;
  final String boulderAreaIri;

  @override
  List<Object?> get props => [
        boulderAreaIri,
      ];
}
