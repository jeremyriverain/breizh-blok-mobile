import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:breizh_blok_mobile/repositories/grade_repository.dart';
import 'package:drift/drift.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DownloadAreaService {
  DownloadAreaService({
    required this.database,
    required this.httpClient,
    required this.imageBoulderCache,
  });

  final AppDatabase database;
  final AppHttpClient httpClient;
  final ImageBoulderCache imageBoulderCache;

  Future<void> removeDownload(String iri) async {
    try {
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

      await Future.wait(deletions);
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  Future<void> download(BoulderArea boulderArea) async {
    await database.into(database.dbBoulderAreas).insert(
          DbBoulderAreasCompanion.insert(
            iri: boulderArea.iri,
            isDownloaded: false,
          ),
        );

    try {
      final [boulders, _, _] = await Future.wait(
        [
          _fetchAllBoulders(boulderArea),
          _fetchBoulderAreaDetails(boulderArea),
          _fetchGrades(),
        ],
      );

      await (database.update(database.dbBoulderAreas)
            ..where((tbl) => tbl.iri.equals(boulderArea.iri)))
          .write(
        DbBoulderAreasCompanion.insert(
          iri: boulderArea.iri,
          isDownloaded: true,
          boulders: Value(boulders),
        ),
      );
    } catch (exception, stackTrace) {
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  Future<String> _fetchAllBoulders(BoulderArea boulderArea) async {
    final uri = Uri.https(
      const String.fromEnvironment('API_HOST'),
      '/boulders',
      DownloadAreaService.bouldersQueryParamsOf(boulderArea: boulderArea),
    );
    await httpClient.get(
      uri,
      timeout: const Duration(seconds: 15),
      offlineFirst: true,
    );

    return httpClient.normalizeRequestPath(uri);
  }

  Future<String> _fetchBoulderAreaDetails(BoulderArea boulderArea) async {
    return httpClient.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        boulderArea.iri,
      ),
      offlineFirst: true,
    );
  }

  Future<String> _fetchGrades() async {
    return httpClient.get(
      Uri.https(
        const String.fromEnvironment('API_HOST'),
        '/grades',
        GradeRepository.findAllQueryParams,
      ),
      offlineFirst: true,
    );
  }

  static Map<String, List<String>> bouldersQueryParamsOf({
    required BoulderArea boulderArea,
  }) {
    return {
      'rock.boulderArea.id[]': [
        boulderArea.iri.replaceAll('/boulder_areas/', ''),
      ],
      kIdOrderParam: [kDescendantDirection],
      'pagination': ['false'],
      'groups[]': ['Boulder:item-get', 'Boulder:read', 'read'],
    };
  }
}
