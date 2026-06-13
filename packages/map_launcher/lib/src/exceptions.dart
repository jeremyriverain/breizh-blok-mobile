import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
sealed class MapLauncherException
    with _$MapLauncherException
    implements Exception {
  const MapLauncherException._();

  const factory MapLauncherException.unknwown({required String message}) =
      UnknownException;
}
