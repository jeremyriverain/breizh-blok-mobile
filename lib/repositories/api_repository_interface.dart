import 'package:breizh_blok_mobile/models/collection_items.dart';

abstract class ApiRepositoryInterface<T> {
  Future<T> find(String id);

  Future<CollectionItems<T>> findBy({
    Map<String, List<String>>? queryParams,
  });
}
