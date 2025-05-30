import 'package:auth0_flutter/auth0_flutter.dart' as auth0;
import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_auth/src/auth_impl.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

@GenerateNiceMocks([
  MockSpec<auth0.Auth0>(),
  MockSpec<auth0.WebAuthentication>(),
  MockSpec<auth0.CredentialsManager>(),
])
import 'auth_impl_test.mocks.dart';

void main() {
  late auth0.Auth0 authZero;
  late auth0.WebAuthentication webAuth;
  late auth0.CredentialsManager credentialsManager;

  final auth0Credentials = auth0.Credentials(
    idToken: '',
    accessToken: 'foo',
    expiresAt: DateTime(2025),
    user: const auth0.UserProfile(sub: 'bar'),
    tokenType: 'baz',
  );

  setUp(() {
    authZero = MockAuth0();
    webAuth = MockWebAuthentication();
    credentialsManager = MockCredentialsManager();
  });
  group('AuthImpl', () {
    group('initial credentials', () {
      test('credentials are null if initial credentials are null', () {
        final auth = AuthImpl(auth0: authZero, initialCredentials: null);
        expect(auth.credentials.value, isNull);
      });

      test('credentials are not null if initial credentials are not null', () {
        final auth = AuthImpl(
          auth0: authZero,
          initialCredentials: auth0Credentials,
        );
        expect(
          auth.credentials.value,
          Credentials(accessToken: auth0Credentials.accessToken),
        );
      });
    });
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

        final auth = AuthImpl(auth0: authZero, initialCredentials: null);
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

        final auth = AuthImpl(auth0: authZero, initialCredentials: null);
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

        final auth = AuthImpl(auth0: authZero, initialCredentials: null);
        expect(auth.credentials.value, isNull);

        final result = await auth.login();
        expect(result is ResultOk<void>, isTrue);
        expect(auth.credentials.value, isNull);
      });
    });

    group('logout', () {
      test('credentials becomes null if logout succeeds', () async {
        when(authZero.webAuthentication()).thenReturn(webAuth);
        when(webAuth.logout()).thenAnswer((_) async {});

        final auth = AuthImpl(
          auth0: authZero,
          initialCredentials: auth0Credentials,
        );
        expect(
          auth.credentials.value,
          Credentials(accessToken: auth0Credentials.accessToken),
        );

        final result = await auth.logout();
        expect(result is ResultOk<void>, isTrue);
        expect(auth.credentials.value, isNull);
      });

      test('credentials stay the same if logout fails', () async {
        when(authZero.webAuthentication()).thenReturn(webAuth);
        when(
          webAuth.logout(),
        ).thenThrow(const auth0.WebAuthenticationException('foo', 'bar', {}));

        final auth = AuthImpl(
          auth0: authZero,
          initialCredentials: auth0Credentials,
        );
        expect(
          auth.credentials.value,
          Credentials(accessToken: auth0Credentials.accessToken),
        );

        final result = await auth.logout();
        expect(result is ResultError<void>, isTrue);
        expect(
          auth.credentials.value,
          Credentials(accessToken: auth0Credentials.accessToken),
        );
      });

      test('credentials stay null if logout is cancelled', () async {
        when(authZero.webAuthentication()).thenReturn(webAuth);
        when(webAuth.logout()).thenThrow(
          const auth0.WebAuthenticationException('USER_CANCELLED', 'bar', {}),
        );

        final auth = AuthImpl(
          auth0: authZero,
          initialCredentials: auth0Credentials,
        );
        expect(
          auth.credentials.value,
          Credentials(accessToken: auth0Credentials.accessToken),
        );

        final result = await auth.logout();
        expect(result is ResultOk<void>, isTrue);
        expect(
          auth.credentials.value,
          Credentials(accessToken: auth0Credentials.accessToken),
        );
      });
    });
  });

  group('AuthFactoryImpl', () {
    group('initialize', () {
      test('credentials are null if user has not valid credentials', () async {
        when(authZero.credentialsManager).thenReturn(credentialsManager);
        when(
          credentialsManager.hasValidCredentials(),
        ).thenAnswer((_) async => false);
        final auth = await AuthFactoryImpl(auth0: authZero).initialize();
        expect(auth.credentials.value, isNull);
      });

      test('credentials are null if user has not valid credentials', () async {
        when(authZero.credentialsManager).thenReturn(credentialsManager);
        when(
          credentialsManager.hasValidCredentials(),
        ).thenAnswer((_) async => true);

        when(
          credentialsManager.credentials(),
        ).thenAnswer((_) async => auth0Credentials);
        final auth = await AuthFactoryImpl(auth0: authZero).initialize();
        expect(
          auth.credentials.value,
          Credentials(accessToken: auth0Credentials.accessToken),
        );
      });
    });
  });
}
