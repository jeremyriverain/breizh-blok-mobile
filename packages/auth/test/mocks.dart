import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:mocktail/mocktail.dart';

class MockAuth0 extends Mock implements Auth0 {}

class MockCredentialsManager extends Mock implements CredentialsManager {}

class MockWebAuthentication extends Mock implements WebAuthentication {}
