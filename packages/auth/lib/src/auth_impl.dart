import 'package:auth0_flutter/auth0_flutter.dart' as auth0;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:flutter/foundation.dart';

class AuthImpl implements Auth {
  AuthImpl({required auth0.Auth0 auth0}) : _auth0 = auth0;

  final auth0.Auth0 _auth0;

  final ValueNotifier<Credentials?> _credentials = ValueNotifier(null);

  @override
  Future<Result<void>> login() async {
    try {
      final auth0Credentials = await _auth0.webAuthentication().login();
      _credentials.value = _toCredentials(auth0Credentials);
      return Result.ok(() {}());
    } on auth0.WebAuthenticationException catch (e) {
      if (e.code == 'USER_CANCELLED' ||
          e.code == 'a0.authentication_canceled') {
        return Result.ok(() {}());
      }
      return Result.error(const LoginException());
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _auth0.webAuthentication().logout();
      _credentials.value = null;
      return Result.ok(() {}());
    } on auth0.WebAuthenticationException catch (e) {
      if (e.code == 'USER_CANCELLED' ||
          e.code == 'a0.authentication_canceled') {
        return Result.ok(() {}());
      }
      return Result.error(const LogoutException());
    }
  }

  Credentials _toCredentials(auth0.Credentials auth0Credentials) {
    return Credentials(accessToken: auth0Credentials.accessToken);
  }

  @override
  ValueNotifier<Credentials?> get credentials => _credentials;

  @override
  Future<void> initialize() async {
    final auth0Credentials =
        await _auth0.credentialsManager.hasValidCredentials()
            ? (await _auth0.credentialsManager.credentials())
            : null;
    _credentials.value =
        auth0Credentials != null ? _toCredentials(auth0Credentials) : null;
  }
}
