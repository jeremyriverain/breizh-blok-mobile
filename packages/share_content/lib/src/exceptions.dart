import 'package:freezed_annotation/freezed_annotation.dart';

part 'exceptions.freezed.dart';

@freezed
sealed class ShareContentException
    with _$ShareContentException
    implements Exception {
  const ShareContentException._();

  const factory ShareContentException.unknwown({required String message}) =
      UnknownException;
}
