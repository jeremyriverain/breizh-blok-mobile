import 'package:auth0_flutter/auth0_flutter.dart' as auth0;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_auth/src/auth_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<auth0.Auth0>(),
  MockSpec<auth0.WebAuthentication>(),
])
import 'auth_impl_test.mocks.dart';

void main() {
  late auth0.Auth0 authZero;
  late auth0.WebAuthentication webAuth;

  setUp(() {
    authZero = MockAuth0();
    webAuth = MockWebAuthentication();
  });
  group('AuthImpl', () {
    group('login', () {
      test('credentials are updated if login succeeds', () async {
        when(authZero.webAuthentication()).thenReturn(webAuth);
        when(webAuth.login()).thenAnswer(
          (_) async => auth0.Credentials(
            idToken: '',
            accessToken: 'foo',
            expiresAt: DateTime(2025),
            user: const auth0.UserProfile(sub: 'bar'),
            tokenType: 'baz',
          ),
        );

        final auth = AuthImpl(auth0: authZero);
        expect(auth.credentials.value, isNull);

        final result = await auth.login();
        expect(result is ResultOk<void>, isTrue);
        expect(
          auth.credentials.value,
          equals(const Credentials(accessToken: 'foo')),
        );
      });

      test('credentials stay null if login fails', () async {
        when(authZero.webAuthentication()).thenReturn(webAuth);
        when(
          webAuth.login(),
        ).thenThrow(const auth0.WebAuthenticationException('foo', 'bar', {}));

        final auth = AuthImpl(auth0: authZero);
        expect(auth.credentials.value, isNull);

        final result = await auth.login();
        expect(result is ResultError<void>, isTrue);
        expect(auth.credentials.value, isNull);
      });

      test('credentials stay null if login is cancelled', () async {
        when(authZero.webAuthentication()).thenReturn(webAuth);
        when(webAuth.login()).thenThrow(
          const auth0.WebAuthenticationException('USER_CANCELLED', 'bar', {}),
        );

        final auth = AuthImpl(auth0: authZero);
        expect(auth.credentials.value, isNull);

        final result = await auth.login();
        expect(result is ResultOk<void>, isTrue);
        expect(auth.credentials.value, isNull);
      });
    });
  });
}
