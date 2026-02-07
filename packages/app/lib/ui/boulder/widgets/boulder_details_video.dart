import 'package:breizh_blok_mobile/domain/entities/video_link/video_link.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoulderDetailsVideo extends StatelessWidget {
  const BoulderDetailsVideo({
    required this.videoLink,
    super.key,
  });

  final VideoLink videoLink;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        final urlLauncher = ref.watch(urlLauncherProvider);
        return GestureDetector(
          onTap: () async {
            await urlLauncher.openUrl(Uri.parse(videoLink.url)).run();
          },
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned.fill(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://img.youtube.com/vi/${videoLink.videoId}/hqdefault.jpg',
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) => const ColoredBox(
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  width: 64,
                  height: 64,
                  child: DecoratedBox(
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
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
