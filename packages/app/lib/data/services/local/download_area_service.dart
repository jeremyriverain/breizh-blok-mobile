import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/repositories/grade/grade_repository.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:drift/drift.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DownloadAreaService {
  DownloadAreaService({
    required this.database,
    required this.httpClient,
    required this.imageBoulderCache,
  });

  final AppDatabase database;
  final ApiClient httpClient;
  final ImageBoulderCache imageBoulderCache;

  static final regexpImage = RegExp(
    r'"filterUrl":\s?"(\\?\/media\\?\/cache\\?\/resolve\\?\/%filter%\\?\/uploads\\?\/[^"]*)',
  );

  Set<String> extractImages(String response) {
    final imageMatches = DownloadAreaService.regexpImage.allMatches(response);
    final imageUrls = <String>{};
    for (final imageMatch in imageMatches) {
      final group = imageMatch.group(1);
      if (group != null) {
        imageUrls.add(
          group.replaceAll(r'\/', '/').replaceAll('%filter%', 'scale_md'),
        );
      }
    }
    return imageUrls;
  }

  Future<void> downloadImage(String url) async {
    try {
      await imageBoulderCache.cache.getSingleFile(url);
    } catch (_) {}
  }

  Future<void> removeImage(String url) async {
    try {
      await imageBoulderCache.cache.removeFile(url);
    } catch (_) {}
  }

  Future<void> removeDownload(String iri) async {
    try {
      final storedBoulderArea = await (database.select(
        database.dbBoulderAreas,
      )..where((tbl) => tbl.iri.equals(iri))).getSingleOrNull();
      if (storedBoulderArea == null) {
        return;
      }

      final deletions = [
        (database.delete(
          database.dbBoulderAreas,
        )..where((tbl) => tbl.iri.equals(iri))).go(),
        (database.delete(
          database.dbRequests,
        )..where((tbl) => tbl.requestPath.equals(iri))).go(),
      ];

      final bouldersRequestPath = storedBoulderArea.boulders;

      if (bouldersRequestPath != null) {
        final bouldersRequest =
            await (database.select(database.dbRequests)..where(
                  (tbl) => tbl.requestPath.equals(bouldersRequestPath),
                ))
                .getSingle();

        final imageUrls = extractImages(bouldersRequest.responseBody);

        for (final pathImage in List<String>.from(imageUrls)) {
          await removeImage(Uri.https(Env.apiHost, pathImage).toString());
        }

        deletions.add(
          (database.delete(
            database.dbRequests,
          )..where((tbl) => tbl.requestPath.equals(bouldersRequestPath))).go(),
        );
      }

      await Future.wait(deletions);
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace).ignore();
    }
  }

  Future<void> download(BoulderArea boulderArea) async {
    await database
        .into(database.dbBoulderAreas)
        .insert(
          DbBoulderAreasCompanion.insert(
            iri: boulderArea.iri,
            downloadProgress: 0,
          ),
        );

    try {
      final [bouldersRequestPath, _, _] = await Future.wait([
        _fetchAllBoulders(boulderArea),
        _fetchBoulderAreaDetails(boulderArea),
        _fetchGrades(),
      ]);

      const minDownloadProgress = 10;

      await (database.update(
        database.dbBoulderAreas,
      )..where((tbl) => tbl.iri.equals(boulderArea.iri))).write(
        const DbBoulderAreasCompanion(
          downloadProgress: Value(minDownloadProgress),
        ),
      );

      final bouldersRequest =
          await (database.select(database.dbRequests)..where(
                (tbl) => tbl.requestPath.equals(bouldersRequestPath),
              ))
              .getSingle();

      final imageUrls = extractImages(bouldersRequest.responseBody);

      var downloadedImages = 0;

      for (final pathImage in List<String>.from(imageUrls)) {
        await downloadImage(Uri.https(Env.apiHost, pathImage).toString());
        downloadedImages++;
        await (database.update(
          database.dbBoulderAreas,
        )..where((tbl) => tbl.iri.equals(boulderArea.iri))).write(
          DbBoulderAreasCompanion(
            downloadProgress: Value(
              minDownloadProgress +
                  (downloadedImages *
                      (100 - minDownloadProgress) ~/
                      imageUrls.length),
            ),
          ),
        );
      }

      await (database.update(
        database.dbBoulderAreas,
      )..where((tbl) => tbl.iri.equals(boulderArea.iri))).write(
        DbBoulderAreasCompanion.insert(
          iri: boulderArea.iri,
          downloadProgress: 100,
          boulders: Value(bouldersRequestPath),
        ),
      );
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace).ignore();
    }
  }

  Future<String> _fetchAllBoulders(BoulderArea boulderArea) async {
    final uri = Uri.https(
      Env.apiHost,
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
      Uri.https(Env.apiHost, boulderArea.iri),
      offlineFirst: true,
    );
  }

  Future<String> _fetchGrades() async {
    return httpClient.get(
      Uri.https(Env.apiHost, '/grades', GradeRepository.findAllQueryParams),
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
