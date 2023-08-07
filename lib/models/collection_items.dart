class CollectionItems<T> {
  final List<T> items;
  final int totalItems;
  final int? nextPage;

  const CollectionItems({
    required this.items,
    required this.totalItems,
    this.nextPage,
  });

  static int? extractPage(String uri) {
    final page = Uri.parse(uri).queryParameters['page'];

    if (page == null) {
      return null;
    }

    return int.parse(page);
  }

  factory CollectionItems.fromApi(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) callbackItem,
  ) {
    final List<T> items =
        json['hydra:member'].map<T>((item) => callbackItem(item)).toList();

    return CollectionItems(
      items: items,
      totalItems: json['hydra:totalItems'],
      nextPage: extractPage(json['hydra:view']?['hydra:next'] ?? ''),
    );
  }
}
