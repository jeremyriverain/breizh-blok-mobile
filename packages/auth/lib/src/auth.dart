// ignore_for_file: one_member_abstracts

import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:flutter/foundation.dart';

abstract interface class Auth {
  Future<Result<void>> login();

  Future<Result<void>> logout();

  ValueNotifier<Credentials?> get credentials;
}

abstract interface class AuthFactory {
  Future<Auth> initialize();
}
