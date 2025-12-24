import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/bearer_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../mocks.dart';

void main() {
  late RequestInterceptorHandler requestInterceptorHandler;
  late ErrorInterceptorHandler errorInterceptorHandler;
  late Auth auth;
  late Dio dio;
  late BearerInterceptor bearerInterceptor;

  setUp(() {
    requestInterceptorHandler = MockRequestInterceptorHandler();
    errorInterceptorHandler = MockErrorInterceptorHandler();
    auth = MockAuth();
    dio = MockDio();
    bearerInterceptor = BearerInterceptor(auth: auth, dio: dio);

    // ignore: inference_failure_on_instance_creation
    registerFallbackValue(Response(requestOptions: RequestOptions()));
    registerFallbackValue(RequestOptions());
    registerFallbackValue(DioException(requestOptions: RequestOptions()));
  });
  group('BearerInterceptor', () {
    group('onRequest', () {
      test(
        '''
Given there is no access token,
Then request options remains untouched
''',
        () async {
          final requestOptions = RequestOptions(headers: {'foo': 'bar'});

          when(
            () => auth.credentials,
          ).thenAnswer((_) => ValueNotifier<Credentials?>(null));

          await bearerInterceptor.onRequest(
            requestOptions,
            requestInterceptorHandler,
          );

          verify(
            () => requestInterceptorHandler.next(requestOptions),
          ).called(1);
          verifyNoMoreInteractions(requestInterceptorHandler);
        },
      );

      test(
        '''
Given there is an access token,
Then the credentials are refreshed if expired
And Authorization header is added
''',
        () async {
          final requestOptions = RequestOptions(headers: {'foo': 'bar'});

          when(() => auth.credentials).thenAnswer(
            (_) => ValueNotifier<Credentials?>(
              const Credentials(accessToken: 'foo', id: 'bar'),
            ),
          );
          when(
            () => auth.refreshCredentialsIfExpired(),
          ).thenAnswer((_) async => Result.ok(() {}()));

          await bearerInterceptor.onRequest(
            requestOptions,
            requestInterceptorHandler,
          );

          verify(
            () => requestInterceptorHandler.next(
              any(
                that: isA<RequestOptions>().having(
                  (e) => e.headers,
                  'headers',
                  {'foo': 'bar', 'Authorization': 'Bearer foo'},
                ),
              ),
            ),
          ).called(1);

          verifyNoMoreInteractions(requestInterceptorHandler);
        },
      );
    });

    group('onError', () {
      test(
        '''
Given the status code of the error is other than 401,
Then it simply calls next handler,
''',
        () async {
          await bearerInterceptor.onError(
            DioException(
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(),
                statusCode: 402,
              ),
            ),
            errorInterceptorHandler,
          );

          verify(
            () => errorInterceptorHandler.next(
              any(
                that: isA<DioException>().having(
                  (e) => e.response?.statusCode,
                  'statusCode',
                  equals(402),
                ),
              ),
            ),
          ).called(1);

          verifyNoMoreInteractions(errorInterceptorHandler);
        },
      );

      test(
        '''
Given status code is 401 and login returns an error,
Then next handler is called
''',
        () async {
          when(
            () => auth.login(),
          ).thenAnswer((_) async => ResultError(Exception('foo')));
          await bearerInterceptor.onError(
            DioException(
              requestOptions: RequestOptions(),
              response: Response(
                requestOptions: RequestOptions(),
                statusCode: 401,
              ),
            ),
            errorInterceptorHandler,
          );

          verify(
            () => errorInterceptorHandler.next(
              any(
                that: isA<DioException>().having(
                  (e) => e.response?.statusCode,
                  'statusCode',
                  equals(401),
                ),
              ),
            ),
          ).called(1);

          verifyNoMoreInteractions(errorInterceptorHandler);
        },
      );

      test(
        '''
Given status code is 401 and login succeeds,
Then the request is retried
And next handler is resolved
''',
        () async {
          when(() => auth.login()).thenAnswer((_) async => ResultOk(() {}()));
          when(
            () => auth.credentials,
          ).thenReturn(
            ValueNotifier(const Credentials(accessToken: 'foo', id: 'bar')),
          );
          when(
            // ignore: inference_failure_on_function_invocation
            () => dio.request(
              any(),
              options: any(named: 'options'),
              cancelToken: any(named: 'cancelToken'),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenAnswer((_) async => Response(requestOptions: RequestOptions()));

          await bearerInterceptor.onError(
            DioException(
              requestOptions: RequestOptions(
                path: '/foo',
                method: 'FOO',
                headers: {'foo': 'bar'},
                extra: {'bar': 'baz'},
                cancelToken: CancelToken(),
                data: 'baz',
                queryParameters: {'baz': 'bar'},
              ),
              response: Response(
                requestOptions: RequestOptions(),
                statusCode: 401,
              ),
            ),
            errorInterceptorHandler,
          );

          verify(() => errorInterceptorHandler.resolve(any())).called(1);

          verify(
            // ignore: inference_failure_on_function_invocation
            () => dio.request(
              '/foo',
              options: any(
                named: 'options',
                that: isA<Options>()
                    .having((e) => e.method, 'method', equals('FOO'))
                    .having(
                      (e) => e.headers,
                      'headers',
                      equals({'foo': 'bar', 'Authorization': 'Bearer foo'}),
                    )
                    .having((e) => e.extra, 'extra', equals({'bar': 'baz'})),
              ),
              cancelToken: any(named: 'cancelToken'),
              data: 'baz',
              queryParameters: {'baz': 'bar'},
            ),
          ).called(1);

          verifyNoMoreInteractions(errorInterceptorHandler);
          verifyNoMoreInteractions(dio);
        },
      );

      test(
        '''
Given status code is 401, login succeeds, but the retry of the request fails,
then reject handler is called
''',
        () async {
          when(() => auth.login()).thenAnswer((_) async => ResultOk(() {}()));
          when(
            () => auth.credentials,
          ).thenReturn(
            ValueNotifier(const Credentials(accessToken: 'foo', id: 'bar')),
          );
          when(
            // ignore: inference_failure_on_function_invocation
            () => dio.request(
              any(),
              options: any(named: 'options'),
              cancelToken: any(named: 'cancelToken'),
              data: any(named: 'data'),
              queryParameters: any(named: 'queryParameters'),
            ),
          ).thenThrow((_) async => Exception('foo'));

          await bearerInterceptor.onError(
            DioException(
              requestOptions: RequestOptions(
                path: '/foo',
                method: 'FOO',
                headers: {'foo': 'bar'},
                extra: {'bar': 'baz'},
                cancelToken: CancelToken(),
                data: 'baz',
                queryParameters: {'baz': 'bar'},
              ),
              response: Response(
                requestOptions: RequestOptions(),
                statusCode: 401,
              ),
            ),
            errorInterceptorHandler,
          );

          verify(() => errorInterceptorHandler.reject(any())).called(1);

          verify(
            // ignore: inference_failure_on_function_invocation
            () => dio.request(
              '/foo',
              options: any(
                named: 'options',
                that: isA<Options>()
                    .having((e) => e.method, 'method', equals('FOO'))
                    .having(
                      (e) => e.headers,
                      'headers',
                      equals({'foo': 'bar', 'Authorization': 'Bearer foo'}),
                    )
                    .having((e) => e.extra, 'extra', equals({'bar': 'baz'})),
              ),
              cancelToken: any(named: 'cancelToken'),
              data: 'baz',
              queryParameters: {'baz': 'bar'},
            ),
          ).called(1);

          verifyNoMoreInteractions(errorInterceptorHandler);
          verifyNoMoreInteractions(dio);
        },
      );
    });
  });
}
