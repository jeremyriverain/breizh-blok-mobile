import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
sealed class LaunchUrlException with _$LaunchUrlException implements Exception {
  const LaunchUrlException._();

  const factory LaunchUrlException.unknwown({required String message}) =
      UnknownException;
}
