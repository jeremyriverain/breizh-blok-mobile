import 'package:breizh_blok_map_launcher/src/coords.dart';
import 'package:breizh_blok_map_launcher/src/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AvailableMap {
  String get icon;
  String get name;

  TaskEither<MapLauncherException, void> showDirections({
    required String destinationTitle,
    required Coords destination,
  });
}
