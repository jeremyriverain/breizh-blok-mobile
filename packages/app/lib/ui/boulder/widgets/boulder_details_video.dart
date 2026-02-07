import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoulderDetailsVideo extends StatelessWidget {
  const BoulderDetailsVideo({
    required this.videoId,
    required this.url,
    super.key,
  });

  final String videoId;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final urlLauncher = ref.watch(urlLauncherProvider);
        return GestureDetector(
          onTap: () async {
            await urlLauncher.openUrl(Uri.parse(url)).run();
          },
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: Image.network(
                    'https://img.youtube.com/vi/$videoId/hqdefault.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    color: Colors.black.withValues(alpha: 0.6),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
