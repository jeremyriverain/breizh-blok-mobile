import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_api_response.freezed.dart';

@freezed
abstract class BoulderApiResponse with _$BoulderApiResponse {
  const factory BoulderApiResponse({
    PaginatedCollection<Boulder>? data,
    Object? error,
  }) = _BoulderApiResponse;
}
