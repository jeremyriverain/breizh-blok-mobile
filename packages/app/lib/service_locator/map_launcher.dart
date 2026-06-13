import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_launcher.g.dart';

@riverpod
MapLauncher mapLauncher(Ref ref) {
  return BreizhBlokMapLauncher.createMapLauncher();
}

Duration? _disableRetry(int retryCount, Object error) {
  return null;
}

@Riverpod(retry: _disableRetry)
Future<Either<MapLauncherException, List<AvailableMap>>> availableMaps(
  Ref ref,
) {
  final mapLauncher = ref.watch(mapLauncherProvider);

  return mapLauncher.availableMaps.run();
}
