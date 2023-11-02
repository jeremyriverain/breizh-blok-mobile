import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';

class DownloadAreaService {
  DownloadAreaService({
    required this.database,
    required this.httpClient,
  });

  final AppDatabase database;
  final AppHttpClient httpClient;

  Future<void> removeDownload(String iri) async {
    await (database.delete(database.boulderAreas)
          ..where((tbl) => tbl.iri.equals(iri)))
        .go();
  }

  Future<void> download(String iri) async {
    await database.into(database.boulderAreas).insert(
          BoulderArea(iri: iri, isDownloaded: false),
        );

    try {
      await Future.wait(
        [
          // ignore: inference_failure_on_instance_creation
          Future.delayed(const Duration(seconds: 3)),
          httpClient.get(
            Uri.https(
              const String.fromEnvironment('API_HOST'),
              iri,
            ),
          ),
        ],
      );

      await (database.update(database.boulderAreas)
            ..where((tbl) => tbl.iri.equals(iri)))
          .write(BoulderArea(iri: iri, isDownloaded: true));
    } catch (e) {
      //
    }
  }
}
