import 'dart:isolate';

import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/services/local/download_area_service.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:drift/isolate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DownloadsAreaButton extends StatelessWidget {
  const DownloadsAreaButton({required this.boulderArea, super.key});

  final BoulderArea boulderArea;

  Future<void> _onChanged(
    AppDatabase appDatabase, {
    required bool value,
    required ImageBoulderCache imageBoulderCache,
  }) async {
    final token = RootIsolateToken.instance;

    final connection = await appDatabase.serializableConnection();

    try {
      await Isolate.run(() async {
        BackgroundIsolateBinaryMessenger.ensureInitialized(token!);
        final database = AppDatabase(await connection.connect());
        final httpClient = ApiClient(database: database);
        final downloadAreaService = DownloadAreaService(
          database: database,
          httpClient: httpClient,
          imageBoulderCache: imageBoulderCache,
        );

        switch (value) {
          case false:
            await downloadAreaService.removeDownload(boulderArea.iri);
          case true:
            await downloadAreaService.download(boulderArea);
        }

        await database.close();
      });
    } catch (exception, stackTrace) {
      Sentry.captureException(exception, stackTrace: stackTrace).ignore();
    }
  }

  Stream<DbBoulderArea?> watchDownload(AppDatabase appDatabase, String iri) {
    return appDatabase.watchDownload(iri);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return StreamBuilder<DbBoulderArea?>(
          stream: watchDownload(
            ref.watch(appDatabaseProvider),
            boulderArea.iri,
          ),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.active ||
                snapshot.connectionState == ConnectionState.done) {
              final data = snapshot.data;
              final isDownload = data != null;

              return Consumer(
                builder: (_, ref, _) {
                  return _DownloadButton(
                    isDownload: isDownload,
                    onChanged: (context, {required bool value}) => _onChanged(
                      ref.read(appDatabaseProvider),
                      value: value,
                      imageBoulderCache: ref.watch(imageBoulderCacheProvider),
                    ),
                    downloadProgress: data?.downloadProgress,
                  );
                },
              );
            }
            return const _DownloadButton(isDownload: false);
          },
        );
      },
    );
  }
}

class _DownloadButton extends StatelessWidget {
  const _DownloadButton({
    required this.isDownload,
    this.downloadProgress,
    this.onChanged,
  });

  final int? downloadProgress;
  final bool isDownload;
  final Future<void> Function(BuildContext context, {required bool value})?
  onChanged;

  @override
  Widget build(BuildContext context) {
    final onChanged = this.onChanged;
    final downloadProgress = this.downloadProgress;

    final key = downloadProgress == 100 ? const Key('area_downloaded') : null;
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(right: 8),
          child: Switch(
            value: isDownload,
            onChanged: onChanged != null
                ? (value) => onChanged(context, value: value)
                : null,
          ),
        ),
        GestureDetector(
          onTap: onChanged != null
              ? () => onChanged(context, value: !isDownload)
              : null,
          child: Text(
            AppLocalizations.of(context).download.toUpperCase(),
            key: key,
          ),
        ),
        if (downloadProgress != null && downloadProgress != 100)
          Padding(
            padding: const EdgeInsets.only(left: 5),
            child: SizedBox(
              width: 15,
              height: 15,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                value: downloadProgress == 0 ? null : downloadProgress / 100,
              ),
            ),
          ),
      ],
    );
  }
}
