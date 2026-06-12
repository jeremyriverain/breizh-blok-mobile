import 'package:breizh_blok_map_launcher/src/coords.dart';
import 'package:breizh_blok_map_launcher/src/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class AvailableMap {
  abstract String icon;
  abstract String name;

  TaskEither<MapLauncherException, void> showDirections({
    required String destinationTitle,
    required Coords destination,
  });
}
