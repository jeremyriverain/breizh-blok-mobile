import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';

abstract class ApiRepositoryInterface<T> {
  ApiRepositoryInterface({
    required this.httpClient,
  });

  final ApiClient httpClient;

  Future<T> find(String id);

  Future<PaginatedCollection<T>> findBy({
    Map<String, List<String>>? queryParams,
  });
}
