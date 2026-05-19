import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_collection.freezed.dart';

@freezed
abstract class PaginatedCollection<T> with _$PaginatedCollection<T> {
  const factory PaginatedCollection({
    required List<T> items,
    required int totalItems,
    int? nextPage,
  }) = _PaginatedCollection;

  const PaginatedCollection._();

  factory PaginatedCollection.fromApi(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) callbackItem,
  ) {
    final items = (json['hydra:member'] as List<dynamic>)
        .map<T>((item) => callbackItem(item as Map<String, dynamic>))
        .toList();

    int? nextPage;
    if (json case {
      'hydra:view': {
        'hydra:next': final String nextPageUrl,
      },
    }) {
      nextPage = _extractPage(nextPageUrl);
    }
    return PaginatedCollection(
      items: items,
      totalItems: json['hydra:totalItems'] as int,
      nextPage: nextPage,
    );
  }

  static int? _extractPage(String uri) {
    final page = Uri.parse(uri).queryParameters['page'];

    if (page == null) {
      return null;
    }

    return int.parse(page);
  }
}
