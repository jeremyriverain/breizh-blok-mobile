import 'package:freezed_annotation/freezed_annotation.dart';

part 'coords.freezed.dart';

@freezed
abstract class Coords with _$Coords {
  const factory Coords({
    required double latitude,
    required double longitude,
  }) = _Coords;

  const Coords._();
}
