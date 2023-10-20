import 'dart:async';
import 'dart:io';

import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:http/http.dart' as http;

class AppHttpClient {
  AppHttpClient({
    required this.database,
    http.Client? httpClient,
  }) : httpClient = httpClient ?? http.Client();

  final AppDatabase database;
  final http.Client httpClient;

  Future<String> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    final requestPath =
        '${uri.path}${uri.query.isEmpty ? '' : "?${uri.query}"}';
    try {
      final response = await httpClient
          .get(
            uri,
            headers: headers,
          )
          .timeout(const Duration(seconds: 7));

      if (response.statusCode == 200) {
        unawaited(
          database.createOrUpdateRequest(
            Request(
              requestPath: requestPath,
              responseBody: response.body,
            ),
          ),
        );

        return response.body;
      }

      throw HttpException(
        'an error occured: status code ${response.statusCode}',
      );
    } catch (e) {
      if (e is HttpException) {
        rethrow;
      }

      final storedRequest = await database.requestById(requestPath);

      if (storedRequest != null) {
        return storedRequest.responseBody;
      }

      rethrow;
    }
  }
}
