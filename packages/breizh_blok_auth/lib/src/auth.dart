import 'package:breizh_blok_auth/credentials.dart';
import 'package:flutter/foundation.dart';

abstract interface class Auth {
  Future<void> login();

  Future<void> logout();

  ValueNotifier<Credentials?> get credentials;

  Future<void> initialize();
}
