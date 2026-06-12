import 'package:breizh_blok_map_launcher/src/map_launcher.dart';
import 'package:breizh_blok_map_launcher/src/map_launcher_impl.dart';

export 'package:breizh_blok_map_launcher/src/available_map.dart';
export 'package:breizh_blok_map_launcher/src/coords.dart';
export 'package:breizh_blok_map_launcher/src/exceptions.dart';
export 'package:breizh_blok_map_launcher/src/map_launcher.dart';

abstract class BreizhBlokMapLauncher {
  static MapLauncher createMapLauncher() {
    return MapLauncherImpl();
  }
}
