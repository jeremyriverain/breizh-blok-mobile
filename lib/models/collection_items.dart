class CollectionItems<T> {
  const CollectionItems({
    required this.items,
    required this.totalItems,
    this.nextPage,
  });

  factory CollectionItems.fromApi(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) callbackItem,
  ) {
    final items = (json['hydra:member'] as List<dynamic>)
        .map<T>((item) => callbackItem(item as Map<String, dynamic>))
        .toList();

    int? nextPage;
    if (json
        case {
          'hydra:view': {
            'hydra:next': final String nextPageUrl,
          },
        }) {
      nextPage = extractPage(nextPageUrl);
    }
    return CollectionItems(
      items: items,
      totalItems: json['hydra:totalItems'] as int,
      nextPage: nextPage,
    );
  }
  final List<T> items;
  final int totalItems;
  final int? nextPage;

  static int? extractPage(String uri) {
    final page = Uri.parse(uri).queryParameters['page'];

    if (page == null) {
      return null;
    }

    return int.parse(page);
  }
}
