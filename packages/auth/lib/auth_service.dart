import 'package:auth0_flutter/auth0_flutter.dart' as auth0;
import 'package:breizh_blok_auth/auth_service_interface.dart';
import 'package:breizh_blok_auth/credentials.dart';
import 'package:flutter/foundation.dart';

class AuthService implements AuthServiceInterface {
  AuthService({required String domain, required String clientId})
    : _auth0 = auth0.Auth0(domain, clientId);

  final auth0.Auth0 _auth0;

  final ValueNotifier<Credentials?> _credentials = ValueNotifier(null);

  @override
  Future<void> login() async {
    final auth0Credentials = await _auth0.webAuthentication().login();
    _credentials.value = _toCredentials(auth0Credentials);
  }

  @override
  Future<void> logout() async {
    await _auth0.webAuthentication().logout();
    _credentials.value = null;
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
