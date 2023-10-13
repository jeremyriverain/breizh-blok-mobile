import 'package:http/http.dart' as http;

class AppHttpClient {
  Future<http.Response> get(
    Uri uri, {
    Map<String, String>? headers,
  }) async {
    final response = await http
        .get(
          uri,
          headers: headers,
        )
        .timeout(const Duration(seconds: 10));
    if (response.statusCode != 200) {
      throw Exception(response.body);
    }

    return response;
  }
}
