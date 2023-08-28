import 'package:flutter/material.dart';

import 'package:breizh_blok_mobile/components/line_boulder_image.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';

class BoulderTileImage extends StatelessWidget {
  const BoulderTileImage({
    Key? key,
    required this.boulder,
  }) : super(key: key);

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final Size sizeScreen = MediaQuery.sizeOf(context);
    final double widthImage = sizeScreen.width > 600 ? 200 : 120;

    if (boulder.lineBoulders.isEmpty) {
      return SizedBox(
        height: 100,
        width: widthImage,
      );
    }
    return SizedBox(
      width: widthImage,
      child: LineBoulderImage(lineBoulder: boulder.lineBoulders[0]),
    );
  }
}
