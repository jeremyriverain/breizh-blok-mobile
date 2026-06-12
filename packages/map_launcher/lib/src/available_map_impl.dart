import 'package:breizh_blok_map_launcher/src/available_map.dart';
import 'package:breizh_blok_map_launcher/src/coords.dart';
import 'package:breizh_blok_map_launcher/src/exceptions.dart';
import 'package:fpdart/fpdart.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:map_launcher/map_launcher.dart' as m;

part 'available_map_impl.freezed.dart';

@freezed
abstract class AvailableMapImpl
    with _$AvailableMapImpl
    implements AvailableMap {
  const factory AvailableMapImpl({
    required String name,
    required String icon,
    required m.AvailableMap originalMap,
  }) = _AvailableMapImpl;

  const AvailableMapImpl._();

  @override
  TaskEither<MapLauncherException, void> showDirections({
    required String destinationTitle,
    required Coords destination,
  }) {
    return TaskEither.tryCatch(
      () => originalMap.showDirections(
        destination: m.Coords(destination.latitude, destination.longitude),
        destinationTitle: destinationTitle,
      ),
      (e, _) => MapLauncherException.unknwown(message: e.toString()),
    );
  }
}
