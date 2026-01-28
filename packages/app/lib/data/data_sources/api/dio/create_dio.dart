import 'package:breizh_blok_auth/breizh_blok_auth.dart';
import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/dio/bearer_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Dio _createBasicDio() {
  return Dio()
    ..httpClientAdapter = Http2Adapter(
      ConnectionManager(idleTimeout: const Duration(seconds: 10)),
    )
    ..options = BaseOptions(
      baseUrl: Uri(scheme: 'https', host: Env.apiHost).origin,
      headers: {
        'Accept': 'application/ld+json',
        'Content-type': 'application/ld+json',
      },
    )
    ..interceptors.add(PrettyDioLogger(requestHeader: true, requestBody: true));
}

Dio createDio({required Auth auth}) {
  final dio = _createBasicDio();
  final dio2 = _createBasicDio();

  return dio..interceptors.add(BearerInterceptor(auth: auth, dio: dio2));
}
