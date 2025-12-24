import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/user/user.dart';
import 'package:breizh_blok_mobile/domain/repositories/user_profile_repository.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/profile/widgets/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('ProfileScreen', () {
    late Auth auth;
    late UserProfileRepository userProfileRepository;

    setUp(() {
      auth = MockAuth();
      userProfileRepository = MockUserProfileRepository();
    });

    testWidgets(
      '''
Given user is authenticated
Then the menu "Se déconnecter" is displayed
And an icon is shown in the AppBar
''',
      (tester) async {
        when(() => auth.credentials).thenAnswer(
          (_) => ValueNotifier<Credentials?>(
            const Credentials(accessToken: 'foo', id: 'bar'),
          ),
        );
        when(() => auth.isAuthenticated).thenReturn(true);

        when(
          () => userProfileRepository.get('bar'),
        ).thenReturn(
          TaskEither<DomainException, User?>.right(
            const User(roles: ['ROLE_BAR']),
          ),
        );
        await tester.myPumpWidget(
          widget: const ProfileScreen(),
          overrides: [
            authProvider.overrideWith((_) => auth),
            userProfileRepositoryProvider.overrideWith(
              (_) => userProfileRepository,
            ),
          ],
        );

        await tester.pumpAndSettle();

        expect(find.widgetWithText(ListTile, 'Se déconnecter'), findsOneWidget);

        expect(find.widgetWithIcon(AppBar, Icons.person), findsOneWidget);

        verify(
          () => userProfileRepository.get('bar'),
        ).called(1);
        verifyNoMoreInteractions(userProfileRepository);
      },
    );

    testWidgets(
      '''
Given the user is an ambassador
Then the menu "Se déconnecter" is displayed
And the premium icon is shown in the AppBar
''',
      (tester) async {
        when(() => auth.credentials).thenAnswer(
          (_) => ValueNotifier<Credentials?>(
            const Credentials(accessToken: 'foo', id: 'bar'),
          ),
        );
        when(() => auth.isAuthenticated).thenReturn(true);

        when(() => auth.logout()).thenAnswer((_) async => Result.ok(() {}()));

        when(
          () => userProfileRepository.get('bar'),
        ).thenReturn(
          TaskEither<DomainException, User?>.right(
            const User(roles: ['ROLE_AMBASSADOR']),
          ),
        );
        await tester.myPumpWidget(
          widget: const ProfileScreen(),
          overrides: [
            authProvider.overrideWith((_) => auth),
            userProfileRepositoryProvider.overrideWith(
              (_) => userProfileRepository,
            ),
          ],
        );

        await tester.pumpAndSettle();

        verify(
          () => userProfileRepository.get('bar'),
        ).called(1);
        verifyNoMoreInteractions(userProfileRepository);

        await tester.tap(find.widgetWithText(ListTile, 'Se déconnecter'));

        await tester.pump();

        verify(() => auth.logout()).called(1);

        expect(
          find.widgetWithIcon(AppBar, Icons.workspace_premium),
          findsOneWidget,
        );
      },
    );

    testWidgets(
      '''
Given the user is not authenticated
When i click on "Se connecter"
Then I interact with the Auth to login
''',
      (tester) async {
        when(() => auth.credentials).thenAnswer(
          (_) => ValueNotifier<Credentials?>(null),
        );

        when(() => auth.login()).thenAnswer((_) async => Result.ok(() {}()));
        when(() => auth.isAuthenticated).thenReturn(false);

        await tester.myPumpWidget(
          widget: const ProfileScreen(),
          overrides: [
            authProvider.overrideWith((_) => auth),
            userProfileRepositoryProvider.overrideWith(
              (_) => userProfileRepository,
            ),
          ],
        );

        await tester.pumpAndSettle();

        await tester.tap(find.widgetWithText(ListTile, 'Se connecter'));

        verify(() => auth.login()).called(1);
      },
    );
  });
}
