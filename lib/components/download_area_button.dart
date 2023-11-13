import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/download_area_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadAreaButton extends StatelessWidget {
  const DownloadAreaButton({
    required this.boulderAreaIri,
    super.key,
  });

  final String boulderAreaIri;

  void _onChanged(BuildContext context, bool value) {
    switch (value) {
      case false:
        context.read<DownloadAreaService>().removeDownload(boulderAreaIri);
      case true:
        context.read<DownloadAreaService>().download(boulderAreaIri);
    }
  }

  Stream<BoulderArea?> watchDownload(BuildContext context, String iri) {
    return context.read<AppDatabase>().watchDownload(iri);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<BoulderArea?>(
      stream: watchDownload(context, boulderAreaIri),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active ||
            snapshot.connectionState == ConnectionState.done) {
          final data = snapshot.data;
          final valueCheckbox = data != null;

          final label = data != null && data.isDownloaded
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  GestureDetector(
                    onTap: () => _onChanged(context, !valueCheckbox),
                    child: Text(label),
                  ),
                  if (data != null && !data.isDownloaded)
                    const Positioned(
                      bottom: -4,
                      right: 0,
                      left: 0,
                      child: SizedBox(
                        width: 100,
                        height: 3,
                        child: LinearProgressIndicator(),
                      ),
                    ),
                ],
              ),
            ],
          );
        }
        return Container();
      },
    );
  }
}
