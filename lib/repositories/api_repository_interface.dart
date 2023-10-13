import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';

abstract class ApiRepositoryInterface<T> {
  ApiRepositoryInterface({
    required this.httpClient,
  });

  final AppHttpClient httpClient;

  Future<T> find(String id);

  Future<CollectionItems<T>> findBy({
    Map<String, List<String>>? queryParams,
  });
}
