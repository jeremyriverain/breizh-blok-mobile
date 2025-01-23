class PaginatedCollection<T> {
  const PaginatedCollection({
    required this.items,
    required this.totalItems,
    this.nextPage,
  });

  factory PaginatedCollection.fromApi(
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
    return PaginatedCollection(
      items: items,
      totalItems: json['hydra:totalItems'] as int,
      nextPage: nextPage,
    );
  }
  final List<T> items;
  final int totalItems;
  final int? nextPage;

  PaginatedCollection<T> copyWith({
    List<T>? items,
    int? totalItems,
    int? nextPage,
  }) {
    return PaginatedCollection(
      items: items ?? this.items,
      totalItems: totalItems ?? this.totalItems,
      nextPage: nextPage ?? this.nextPage,
    );
  }

  static int? extractPage(String uri) {
    final page = Uri.parse(uri).queryParameters['page'];

    if (page == null) {
      return null;
    }

    return int.parse(page);
  }
}
