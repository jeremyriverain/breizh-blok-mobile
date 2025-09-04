import 'dart:collection';

class QueryParamFactory {
  static String? stringify({
    Map<String, List<String>>? queryParams,
  }) {
    if (queryParams == null) {
      return null;
    }
    final result = StringBuffer();
    SplayTreeMap<String, List<String>>.from(queryParams).forEach((
      key,
      paramsList,
    ) {
      for (final param in paramsList) {
        if (result.isNotEmpty) {
          result.write('&');
        }
        result.write('$key=${Uri.encodeComponent(param)}');
      }
    });

    return result.toString();
  }
}
