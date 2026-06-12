import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/location/location.dart';
import 'package:fpdart/fpdart.dart';
import 'package:map_launcher/map_launcher.dart';

extension AvailableMapExtension on AvailableMap {
  TaskEither<DomainException, void> safeShowDirections({
    required String destinationTitle,
    required Location destination,
  }) {
    return TaskEither.tryCatch(
      () {
        return showDirections(
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
