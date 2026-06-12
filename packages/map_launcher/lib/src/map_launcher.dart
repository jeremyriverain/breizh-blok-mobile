import 'package:breizh_blok_map_launcher/src/available_map.dart';
import 'package:breizh_blok_map_launcher/src/exceptions.dart';
import 'package:fpdart/fpdart.dart';

abstract interface class MapLauncher {
  TaskEither<MapLauncherException, List<AvailableMap>> get availableMaps;
}
