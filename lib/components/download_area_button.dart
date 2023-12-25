import 'dart:isolate';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/download_area_service.dart';
import 'package:breizh_blok_mobile/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:drift/isolate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class DownloadAreaButton extends StatelessWidget {
  const DownloadAreaButton({
    required this.boulderArea,
    super.key,
  });

  final BoulderArea boulderArea;

  Future<void> _onChanged(BuildContext context, bool value) async {
    final token = RootIsolateToken.instance;

    final connection =
        await context.read<AppDatabase>().serializableConnection();

    try {
      await Isolate.run(() async {
        BackgroundIsolateBinaryMessenger.ensureInitialized(token!);
        final database = AppDatabase(await connection.connect());
        final httpClient = AppHttpClient(database: database);
        final downloadAreaService = DownloadAreaService(
          database: database,
          httpClient: httpClient,
          imageBoulderCache: ImageBoulderCache(),
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
      await Sentry.captureException(
        exception,
        stackTrace: stackTrace,
      );
    }
  }

  Stream<DbBoulderArea?> watchDownload(BuildContext context, String iri) {
    return context.read<AppDatabase>().watchDownload(iri);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DbBoulderArea?>(
      stream: watchDownload(context, boulderArea.iri),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          final valueCheckbox = data != null;

          final label = data != null && data.downloadProgress == 100
              ? 'TÉLÉCHARGER ✅'
              : 'TÉLÉCHARGER';
          return Row(
            children: [
              Transform.scale(
                alignment: Alignment.centerRight,
                scale: .8,
                child: Switch(
                  value: valueCheckbox,
                  onChanged: (value) => _onChanged(context, value),
                ),
              ),
              GestureDetector(
                onTap: () => _onChanged(context, !valueCheckbox),
                child: Text(label),
              ),
              if (data != null && data.downloadProgress != 100)
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: SizedBox(
                    width: 15,
                    height: 15,
                    child: CircularProgressIndicator(
                      strokeWidth: 3,
                      value: data.downloadProgress == 0
                          ? null
                          : data.downloadProgress / 100,
                    ),
                  ),
                ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
