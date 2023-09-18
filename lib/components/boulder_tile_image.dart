import 'package:breizh_blok_mobile/components/line_boulder_image.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:flutter/material.dart';

class BoulderTileImage extends StatelessWidget {
  const BoulderTileImage({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final sizeScreen = MediaQuery.sizeOf(context);
    final widthImage = sizeScreen.width > 600 ? 200 : 120;

    if (boulder.lineBoulders.isEmpty) {
      return SizedBox(
        height: 100,
        width: widthImage.toDouble(),
      );
    }
    return SizedBox(
      width: widthImage.toDouble(),
      child: LineBoulderImage(lineBoulder: boulder.lineBoulders[0]),
    );
  }
}
