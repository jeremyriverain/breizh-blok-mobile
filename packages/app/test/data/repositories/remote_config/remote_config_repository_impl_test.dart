import 'package:breizh_blok_mobile/data/repositories/remote_config/remote_config_repository_impl.dart';
import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';

void main() {
  late RemoteConfigRepositoryImpl repository;
  late FirebaseRemoteConfig firebaseRemoteConfig;
  group('RemoteConfigRepositoryImpl', () {
    setUp(() {
      firebaseRemoteConfig = MockFirebaseRemoteConfig();
      repository = RemoteConfigRepositoryImpl(
        firebaseRemoteConfig: firebaseRemoteConfig,
      );
    });

    group('getString', () {
      test('Given firebase returns a string '
          'Then the repository returns that same string', () async {
        when(
          () => firebaseRemoteConfig.getString('foo'),
        ).thenReturn('bar');

        final result = repository.getString('foo');
        expect(result.getOrElse((_) => null), equals('bar'));

        verify(() => firebaseRemoteConfig.getString('foo')).called(1);
        verifyNoMoreInteractions(firebaseRemoteConfig);
      });

      test('Given firebase returns an empty string '
          'Then the repository returns null', () async {
        when(
          () => firebaseRemoteConfig.getString('foo'),
        ).thenReturn('');

        final result = repository.getString('foo');
        expect(result.getOrElse((_) => 'bar'), isNull);

        verify(() => firebaseRemoteConfig.getString('foo')).called(1);
        verifyNoMoreInteractions(firebaseRemoteConfig);
      });

      test('Given the firebase throws an error returns DomainException '
          'Then left value is returned', () async {
        when(
          () => firebaseRemoteConfig.getString('foo'),
        ).thenThrow(Exception('bar'));

        final result = repository.getString('foo');
        expect(result.isLeft(), isTrue);
        expect(
          result.getLeft().toNullable(),
          isA<UnknownException>().having(
            (e) => e.message,
            'message',
            equals('Exception: bar'),
          ),
        );
      });
    });
  });
}
