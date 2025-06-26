import 'package:breizh_blok_http_client/src/http_client.dart';
import 'package:dio/dio.dart';
import 'package:dio_http2_adapter/dio_http2_adapter.dart';

export 'package:breizh_blok_http_client/src/http_client.dart'
    show HttpClient, Response;

export 'package:breizh_blok_http_client/src/result.dart';

abstract class BreizhBlokHttpClient {
  static HttpClient createHttpClient() {
    return HttpClientImpl(
      dio: Dio()
        ..httpClientAdapter = Http2Adapter(
          ConnectionManager(idleTimeout: const Duration(seconds: 10)),
        ),
      responseMapper: ResponseMapper(),
    );
  }
}
