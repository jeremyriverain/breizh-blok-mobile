import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:dio/dio.dart';

class BearerInterceptor extends Interceptor {
  BearerInterceptor({required this.auth, required this.dio});

  final Auth auth;
  final Dio dio;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    if (auth.credentials.value?.accessToken != null) {
      await auth.refreshCredentialsIfExpired();
      options.headers['Authorization'] =
          'Bearer ${auth.credentials.value?.accessToken}';
    }
    return handler.next(options);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    if (err.response?.statusCode != 401) {
      return handler.next(err);
    }
    final result = await auth.login();

    switch (result) {
      case ResultOk<void>():
        try {
          final newHeaders = {
            ...err.requestOptions.headers,
            'Authorization': 'Bearer ${auth.credentials.value?.accessToken}',
          };
          // ignore: inference_failure_on_function_invocation
          final response = await dio.request(
            err.requestOptions.path,
            options: Options(
              method: err.requestOptions.method,
              headers: newHeaders,
              extra: err.requestOptions.extra,
            ),
            cancelToken: err.requestOptions.cancelToken,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );
          return handler.resolve(response);
        } on DioException catch (e) {
          return super.onError(e, handler);
        } catch (_) {
          return handler.reject(err);
        }

      case ResultError<void>():
        return handler.next(err);
    }
  }
}
