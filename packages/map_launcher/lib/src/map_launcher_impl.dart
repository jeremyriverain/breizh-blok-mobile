import 'package:breizh_blok_map_launcher/src/available_map.dart';
import 'package:breizh_blok_map_launcher/src/available_map_impl.dart';
import 'package:breizh_blok_map_launcher/src/exceptions.dart';
import 'package:breizh_blok_map_launcher/src/map_launcher.dart';
import 'package:fpdart/fpdart.dart';
import 'package:map_launcher/map_launcher.dart' as m;

class MapLauncherImpl implements MapLauncher {
  const MapLauncherImpl();
  @override
  TaskEither<MapLauncherException, List<AvailableMap>> get availableMaps =>
      TaskEither.tryCatch(() {
        return m.MapLauncher.installedMaps.then(
          (maps) => maps
              .map(
                (m) => AvailableMapImpl(
                  map: m,
                ),
              )
              .toList(),
        );
      }, (e, _) => MapLauncherException.unknwown(message: e.toString()));
}
