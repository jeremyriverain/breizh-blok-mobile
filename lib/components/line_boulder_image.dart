import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;
import 'package:flutter_svg/flutter_svg.dart';

import 'package:breizh_blok_mobile/models/line_boulder.dart';

class LineBoulderImage extends StatelessWidget {
  final LineBoulder lineBoulder;

  const LineBoulderImage({
    Key? key,
    required this.lineBoulder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (lineBoulder.rockImage.filterUrl == null ||
        lineBoulder.rockImage.width == null ||
        lineBoulder.rockImage.height == null) {
      return const SizedBox(
        height: 0,
      );
    }

    Image image = Image(
      image: CachedNetworkImageProvider(
        Uri.https(
          const String.fromEnvironment('API_HOST'),
          (lineBoulder.rockImage.filterUrl ?? '')
              .replaceAll('%filter%', 'scale_md'),
        ).toString(),
      ),
    );
    Completer<ui.Image> completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
        (ImageInfo image, bool synchronousCall) {
          if (!completer.isCompleted) {
            completer.complete(image.image);
          }
        },
      ),
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
                  SvgPicture.string(
                    '''<svg
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
                       </svg>''',
                  )
                ],
              ),
            ),
          );
        } else {
          return AspectRatio(
            aspectRatio: (lineBoulder.rockImage.width ?? 4) /
                (lineBoulder.rockImage.height ?? 3),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
