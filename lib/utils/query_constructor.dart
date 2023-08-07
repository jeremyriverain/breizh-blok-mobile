class QueryConstructor {
  static String? stringify({
    Map<String, List<String>>? queryParams,
  }) {
    if (queryParams == null) {
      return null;
    }
    String result = '';
    queryParams.forEach((key, paramsList) {
      for (var param in paramsList) {
        if (result.isNotEmpty) {
          result += '&';
        }
        result += '$key=${Uri.encodeComponent(param)}';
      }
    });

    return result;
  }
}
