import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:breizh_blok_auth/src/auth.dart';
import 'package:breizh_blok_auth/src/auth_impl.dart';

export 'package:breizh_blok_auth/src/auth.dart';
export 'package:breizh_blok_auth/src/credentials.dart';
export 'package:breizh_blok_auth/src/exceptions.dart';
export 'package:breizh_blok_auth/src/result.dart';

abstract class BreizhBlokAuth {
  static Auth createAuth({required String domain, required String clientId}) {
    return AuthImpl(auth0: Auth0(domain, clientId));
  }
}
