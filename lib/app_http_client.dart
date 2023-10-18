import 'dart:async';
import 'dart:io';

import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:http/http.dart' as http;

class AppHttpClient {
  AppHttpClient({
    required this.database,
  });

  final AppDatabase database;

  Future<String> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    final requestPath = '${uri.path}?${uri.query}';
    try {
      final response = await http
          .get(
            uri,
            headers: headers,
          )
          .timeout(const Duration(seconds: 10));

      if (response.statusCode != 200) {
        throw Exception(response.body);
      }

      unawaited(
        database.createOrUpdateRequest(
          Request(
            requestPath: '${uri.path}?${uri.query}',
            responseBody: response.body,
          ),
        ),
      );

      return response.body;
    } catch (e) {
      if (e is SocketException || e is http.ClientException) {
        final storedRequest = await database.requestById(requestPath);

        if (storedRequest != null) {
          return storedRequest.responseBody;
        }
      }

      rethrow;
    }
  }
}
