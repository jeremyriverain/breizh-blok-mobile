import 'package:map_launcher/map_launcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_launcher.g.dart';

@Riverpod(keepAlive: true)
Future<List<AvailableMap>> mapLauncher(Ref ref) {
  return MapLauncher.installedMaps;
}
