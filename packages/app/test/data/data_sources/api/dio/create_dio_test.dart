import 'dart:ui';

import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/bearer_interceptor.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/create_dio.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late Auth auth;

  setUp(() {
    auth = MockAuth();
    registerFallbackValue(RequestOptions());
  });

  group('createDio', () {
    group('Accept-language header', () {
      test(
        '''
Given locale is fr,
Then Accept-language header is 'fr'
''',
        () {
          final dio = createDio(auth: auth, locale: const Locale('fr'));

          expect(dio.options.headers['Accept-language'], equals('fr'));
        },
      );

      test(
        '''
Given locale is en,
Then Accept-language header is 'en'
''',
        () {
          when(
            () => auth.credentials,
          ).thenReturn(ValueNotifier<Credentials?>(null));

          final dio = createDio(auth: auth, locale: const Locale('en'));

          expect(dio.options.headers['Accept-language'], equals('en'));
        },
      );
    });

    group('default headers', () {
      test(
        '''
Given a Dio instance is created,
Then Accept and Content-type headers are set to application/ld+json
''',
        () {
          final dio = createDio(auth: auth, locale: const Locale('fr'));

          expect(
            dio.options.headers['Accept'],
            equals('application/ld+json'),
          );
          expect(
            dio.options.headers['Content-type'],
            equals('application/ld+json'),
          );
        },
      );
    });

    group('interceptors', () {
      test(
        '''
Given a Dio instance is created,
Then it contains a BearerInterceptor
''',
        () {
          final dio = createDio(auth: auth, locale: const Locale('fr'));

          expect(
            dio.interceptors.whereType<BearerInterceptor>(),
            hasLength(1),
          );
        },
      );
    });
  });
}
