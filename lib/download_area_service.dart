import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/order_query_param.dart';
import 'package:breizh_blok_mobile/utils/boulder_list_query_params_builder.dart';

class DownloadAreaService {
  DownloadAreaService({
    required this.database,
    required this.httpClient,
  });

  final AppDatabase database;
  final AppHttpClient httpClient;

  Future<void> removeDownload(String iri) async {
    await (database.delete(database.dbBoulderAreas)
          ..where((tbl) => tbl.iri.equals(iri)))
        .go();
  }

  Future<void> download(BoulderArea boulderArea) async {
    await database.into(database.dbBoulderAreas).insert(
          DbBoulderArea(iri: boulderArea.iri, isDownloaded: false),
        );

    try {
      await Future.wait(
        [
          _fetchAllBoulders(boulderArea),
          _fetchBoulderAreaDetails(boulderArea),
        ],
      );

      await (database.update(database.dbBoulderAreas)
            ..where((tbl) => tbl.iri.equals(boulderArea.iri)))
          .write(DbBoulderArea(iri: boulderArea.iri, isDownloaded: true));
    } catch (e) {
      //
    }
  }

  Future<String> _fetchAllBoulders(BoulderArea boulderArea) {
    return httpClient.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        '/boulders',
        {
          ...BoulderListQueryParamsBuilder.compute(
            grades: {},
            orderQueryParam:
                const OrderQueryParam(name: 'id', direction: 'desc'),
            filterState: BoulderFilterState(
              boulderAreas: {boulderArea},
            ),
          ),
          ...{'pagination': 'false'},
        },
      ),
    );
  }

  Future<String> _fetchBoulderAreaDetails(BoulderArea boulderArea) {
    return httpClient.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        boulderArea.iri,
      ),
    );
  }
}
