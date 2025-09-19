import 'dart:async';
import 'dart:ui' as ui;

import 'package:breizh_blok_mobile/config/env.dart';
import 'package:breizh_blok_mobile/domain/entities/line_boulder/line_boulder.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LineBoulderImage extends ConsumerWidget {
  const LineBoulderImage({required this.lineBoulder, super.key});
  final LineBoulder lineBoulder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (lineBoulder.rockImage.filterUrl == null ||
        lineBoulder.rockImage.width == null ||
        lineBoulder.rockImage.height == null) {
      return const SizedBox(height: 0);
    }

    final image = Image(
      image: CachedNetworkImageProvider(
        Uri.https(
          Env.apiHost,
          (lineBoulder.rockImage.filterUrl ?? '').replaceAll(
            '%filter%',
            'scale_md',
          ),
        ).toString(),
        cacheManager: ref.watch(imageBoulderCacheProvider).cache,
      ),
    );
    final completer = Completer<ui.Image>();
    image.image
        .resolve(ImageConfiguration.empty)
        .addListener(
          ImageStreamListener((ImageInfo image, bool synchronousCall) {
            if (!completer.isCompleted) {
              completer.complete(image.image);
            }
          }),
        );

    return FutureBuilder<ui.Image>(
      future: completer.future,
      builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
        if (snapshot.hasData) {
          final width = snapshot.data?.width;
          final height = snapshot.data?.height;

          return AspectRatio(
            aspectRatio: (width ?? 4) / (height ?? 3),
            child: FittedBox(
              fit: BoxFit.fill,
              child: Stack(
                children: [
                  image,
                  SvgPicture.string('''
<svg
                           width="$width"
                           height="$height"
                           viewBox="0 0 $width $height"
                           xmlns="http://www.w3.org/2000/svg"
                           version="1.1" data-v-42af9f69="">
                               <path fill="none" d="${lineBoulder.smoothLine}"
                               stroke-linecap="round"
                               stroke="red"
                               stroke-width="6px">
                               </path>
                       </svg>'''),
                ],
              ),
            ),
          );
        } else {
          return AspectRatio(
            aspectRatio:
                (lineBoulder.rockImage.width ?? 4) /
                (lineBoulder.rockImage.height ?? 3),
            child: const Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
