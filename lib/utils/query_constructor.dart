class QueryConstructor {
  static String? stringify({
    Map<String, List<String>>? queryParams,
  }) {
    if (queryParams == null) {
      return null;
    }
    var result = '';
    queryParams.forEach((key, paramsList) {
      for (final param in paramsList) {
        if (result.isNotEmpty) {
          result += '&';
        }
        result += '$key=${Uri.encodeComponent(param)}';
      }
    });

    return result;
  }
}
