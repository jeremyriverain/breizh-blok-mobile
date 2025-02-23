import 'package:freezed_annotation/freezed_annotation.dart';

part 'downloaded_boulder_area.freezed.dart';

@freezed
abstract class DownloadedBoulderArea with _$DownloadedBoulderArea {
  const factory DownloadedBoulderArea({
    required String boulderAreaName,
    required String municipalityName,
    required String boulderAreaIri,
    required DateTime downloadedAt,
  }) = _DownloadedBoulderArea;
}
