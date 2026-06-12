import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:fpdart/fpdart.dart';
import 'package:map_launcher/map_launcher.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'map_launcher.g.dart';

@riverpod
class MapApps extends _$MapApps {
  @override
  Future<List<AvailableMap>> build() {
    return MapLauncher.installedMaps;
  }

  TaskEither<DomainException, void> showDirections(
    AvailableMap map, {
    required String destinationTitle,
    required Location destination,
  }) {
    return TaskEither.tryCatch(
      () {
        return map.showDirections(
          destination: Coords(destination.latitude, destination.longitude),
          destinationTitle: destinationTitle,
        );
      },
      (e, _) {
        return UnknownException(message: e.toString());
      },
    );
  }
}
