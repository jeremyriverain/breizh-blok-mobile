import 'package:auth0_flutter/auth0_flutter.dart' as auth0;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:flutter/material.dart';

class AuthImpl implements Auth {
  AuthImpl({
    required auth0.Auth0 auth0,
    required auth0.Credentials? initialCredentials,
    required String audience,
  }) : _auth0 = auth0,
       _credentials = ValueNotifier(
         initialCredentials == null
             ? null
             : AuthImpl.toCredentials(initialCredentials),
       ),
       _audience = audience;

  final auth0.Auth0 _auth0;
  final String _audience;

  final ValueNotifier<Credentials?> _credentials;

  @override
  Future<Result<void>> login() async {
    try {
      final auth0Credentials = await _auth0.webAuthentication().login(
        audience: _audience,
      );
      _credentials.value = AuthImpl.toCredentials(auth0Credentials);
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

  static Credentials toCredentials(auth0.Credentials auth0Credentials) {
    return Credentials(accessToken: auth0Credentials.accessToken);
  }

  @override
  ValueNotifier<Credentials?> get credentials => _credentials;
}

class AuthFactoryImpl implements AuthFactory {
  AuthFactoryImpl({required auth0.Auth0 auth0, required String audience})
    : _auth0 = auth0,
      _audience = audience;

  final auth0.Auth0 _auth0;
  final String _audience;

  @override
  Future<Auth> initialize() async {
    final auth0Credentials =
        await _auth0.credentialsManager.hasValidCredentials()
            ? (await _auth0.credentialsManager.credentials())
            : null;

    return AuthImpl(
      auth0: _auth0,
      initialCredentials: auth0Credentials,
      audience: _audience,
    );
  }
}
