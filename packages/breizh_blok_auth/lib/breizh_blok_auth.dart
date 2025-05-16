import 'package:breizh_blok_auth/src/auth.dart';
import 'package:breizh_blok_auth/src/auth_impl.dart';

export 'package:breizh_blok_auth/src/auth.dart';
export 'package:breizh_blok_auth/src/credentials.dart';

abstract class BreizhBlokAuth {
  static Auth createAuth({required String domain, required String clientId}) {
    return AuthImpl(domain: domain, clientId: clientId);
  }
}
