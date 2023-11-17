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
    final storedBoulderArea = await (database.select(database.dbBoulderAreas)
          ..where((tbl) => tbl.iri.equals(iri)))
        .getSingleOrNull();
    if (storedBoulderArea == null) {
      return;
    }

    final deletions = [
      (database.delete(database.dbBoulderAreas)
            ..where((tbl) => tbl.iri.equals(iri)))
          .go(),
      (database.delete(database.dbRequests)
            ..where((tbl) => tbl.requestPath.equals(iri)))
          .go(),
    ];

    final bouldersRequestPath = storedBoulderArea.boulders;

    if (bouldersRequestPath != null) {
      deletions.add(
        (database.delete(database.dbRequests)
              ..where((tbl) => tbl.requestPath.equals(bouldersRequestPath)))
            .go(),
      );
    }
    Future.wait(deletions).ignore();
  }

  Future<void> download(BoulderArea boulderArea) async {
    await database.into(database.dbBoulderAreas).insert(
          DbBoulderArea(iri: boulderArea.iri, isDownloaded: false),
        );

    try {
      final responses = await Future.wait(
        [
          _fetchAllBoulders(boulderArea),
          _fetchBoulderAreaDetails(boulderArea),
        ],
      );

      await (database.update(database.dbBoulderAreas)
            ..where((tbl) => tbl.iri.equals(boulderArea.iri)))
          .write(
        DbBoulderArea(
          iri: boulderArea.iri,
          isDownloaded: true,
          boulders: responses[0],
        ),
      );
    } catch (e) {
      //
    }
  }

  Future<String> _fetchAllBoulders(BoulderArea boulderArea) async {
    final uri = Uri.https(
      const String.fromEnvironment('API_HOST'),
      '/boulders',
      {
        ...BoulderListQueryParamsBuilder.compute(
          grades: {},
          orderQueryParam: const OrderQueryParam(name: 'id', direction: 'desc'),
          filterState: BoulderFilterState(
            boulderAreas: {boulderArea},
          ),
        ),
        ...{'pagination': 'false'},
      },
    );
    await httpClient.get(
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

    return httpClient.normalizeRequestPath(uri);
  }

  Future<String> _fetchBoulderAreaDetails(BoulderArea boulderArea) async {
    return httpClient.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        boulderArea.iri,
      ),
    );
  }
}
