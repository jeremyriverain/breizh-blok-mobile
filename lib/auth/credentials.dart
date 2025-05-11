import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials.freezed.dart';
part 'credentials.g.dart';

@freezed
abstract class Credentials with _$Credentials {
  const factory Credentials({required String accessToken}) = _Credentials;

  factory Credentials.fromJson(Map<String, Object?> json) =>
      _$CredentialsFromJson(json);
}
