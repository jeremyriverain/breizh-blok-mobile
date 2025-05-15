import 'dart:async';

import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;

const kRequestDefaultTimeout = Duration(
  seconds: int.fromEnvironment('REQUEST_TIMEOUT', defaultValue: 7),
);

class ApiClient {
  ApiClient({required this.database, http.Client? httpClient})
    : httpClient = httpClient ?? http.Client();

  final AppDatabase database;
  final http.Client httpClient;

  Future<String> get(
    Uri uri, {
    Map<String, String>? headers,
    Duration timeout = kRequestDefaultTimeout,
    bool offlineFirst = false,
  }) async {
    final requestPath = normalizeRequestPath(uri);

    Future<http.Response> persistentFetch() async {
      final response = await httpClient
          .get(uri, headers: headers)
          .timeout(timeout);

      if (response.statusCode == 200) {
        unawaited(
          database.createOrUpdateRequest(
            DbRequest(requestPath: requestPath, responseBody: response.body),
          ),
        );
      }

      return response;
    }

    try {
      if (offlineFirst) {
        final storedRequest = await database.requestById(requestPath);

        if (storedRequest != null) {
          persistentFetch().ignore();

          return storedRequest.responseBody;
        }
      }
      final response = await persistentFetch();

      if (response.statusCode == 200) {
        return response.body;
      }

      throw HttpExceptionWithStatus(
        response.statusCode,
        'an error occured: status code ${response.statusCode}',
      );
    } catch (e) {
      if (e is HttpExceptionWithStatus) {
        rethrow;
      }

      final storedRequest = await database.requestById(requestPath);

      if (storedRequest != null) {
        return storedRequest.responseBody;
      }

      rethrow;
    }
  }

  String normalizeRequestPath(Uri uri) {
    final query = (uri.query.split('&')
      ..sort((a, b) => a.compareTo(b))).join('&');
    return '${uri.path}${uri.query.isEmpty ? '' : "?$query"}';
  }
}
