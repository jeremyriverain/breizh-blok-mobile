import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_map_launcher/src/available_map.dart';
import 'package:breizh_blok_map_launcher/src/available_map_impl.dart';
import 'package:fpdart/fpdart.dart';
import 'package:map_launcher/map_launcher.dart' as m;

class MapLauncherImpl implements MapLauncher {
  @override
  TaskEither<MapLauncherException, List<AvailableMap>> get availableMaps =>
      TaskEither.tryCatch(() {
        return m.MapLauncher.installedMaps
            .then(
              (maps) => maps
                  .map(
                    (m) => AvailableMapImpl(
                      name: m.mapName,
                      icon: m.icon,
                      originalMap: m,
                    ),
                  )
                  .toList(),
            )
            .onError((_, _) => []);
      }, (e, _) => MapLauncherException.unknwown(message: e.toString()));
}
