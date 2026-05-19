import 'package:freezed_annotation/freezed_annotation.dart';

part 'paginated_collection.freezed.dart';
part 'paginated_collection.g.dart'; // Nécessaire pour json_serializable

@Freezed(genericArgumentFactories: true)
abstract class PaginatedCollection<T> with _$PaginatedCollection<T> {
  const factory PaginatedCollection({
    @JsonKey(name: 'hydra:member') required List<T> items,

    @JsonKey(name: 'hydra:totalItems') required int totalItems,

    @JsonKey(name: 'nextPage', readValue: _readNextPage) int? nextPage,
  }) = _PaginatedCollection;

  factory PaginatedCollection.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) fromJsonT,
  ) => _$PaginatedCollectionFromJson(json, fromJsonT);

  factory PaginatedCollection.fromApi(
    Map<String, dynamic> json,
    T Function(Map<String, dynamic>) fromJson,
  ) {
    return PaginatedCollection.fromJson(json, (jsonT) {
      return jsonT != null
          ? fromJson(jsonT as Map<String, dynamic>)
          : throw Exception('json should not be null');
    });
  }
}

Object? _readNextPage(Map<dynamic, dynamic> json, String key) {
  final view = json['hydra:view'];
  if (view is Map && view.containsKey('hydra:next')) {
    final nextUrl = view['hydra:next'];

    if (nextUrl is String) {
      final uri = Uri.tryParse(nextUrl);
      final page = uri?.queryParameters['page'];
      return page != null ? int.tryParse(page) : null;
    }
  }
  return null;
}
