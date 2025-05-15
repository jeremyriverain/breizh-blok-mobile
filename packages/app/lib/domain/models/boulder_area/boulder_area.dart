import 'package:breizh_blok_mobile/domain/models/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/models/location/location.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_area.freezed.dart';
part 'boulder_area.g.dart';

@freezed
abstract class BoulderArea with _$BoulderArea {
  const factory BoulderArea({
    @JsonKey(name: '@id') required String iri,
    required String name,
    Municipality? municipality,
    Location? centroid,
    Location? parkingLocation,
    String? description,
    int? numberOfBoulders,
    Grade? lowestGrade,
    Grade? highestGrade,
    Map<String, int>? numberOfBouldersGroupedByGrade,
  }) = _BoulderArea;

  const BoulderArea._();

  factory BoulderArea.fromJson(Map<String, Object?> json) =>
      _$BoulderAreaFromJson(json);

  String get id => iri.replaceAll('/boulder_areas/', '');

  Location resolveLocation() {
    final centroid = this.centroid;
    final parkingLocation = this.parkingLocation;
    if (parkingLocation != null) {
      return Location(
        latitude: parkingLocation.latitude,
        longitude: parkingLocation.longitude,
      );
    } else if (centroid != null) {
      return Location(
        latitude: centroid.latitude,
        longitude: centroid.longitude,
      );
    } else {
      return const Location(
        latitude: kDefaultLatitude,
        longitude: kDefaultLongitude,
      );
    }
  }

  String? nBouldersRated(AppLocalizations localizations) {
    final numBoulders = numberOfBoulders;
    final minGrade = lowestGrade;
    final maxGrade = highestGrade;
    if (numBoulders != null && numBoulders > 0) {
      if (minGrade == null || maxGrade == null) {
        return '$numBoulders ${localizations.nBoulders(count: numBoulders)}';
      }
      if (numBoulders == 1 || minGrade.name == maxGrade.name) {
        return localizations.nBouldersRated(
          count: numBoulders,
          grade: minGrade.name,
        );
      }
      return localizations.nBouldersRatedBetween(
        count: numBoulders,
        minGrade: minGrade.name,
        maxGrade: maxGrade.name,
      );
    }
    return null;
  }
}
