import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_line_boulder_image.dart';
import 'package:flutter/material.dart';

class BbBoulderTileImage extends StatelessWidget {
  const BbBoulderTileImage({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    const widthImage = 150;

    if (boulder.lineBoulders.isEmpty) {
      return SizedBox(
        height: 100,
        width: widthImage.toDouble(),
      );
    }
    return SizedBox(
      width: widthImage.toDouble(),
      child: BbLineBoulderImage(
        lineBoulder: boulder.lineBoulders[0],
      ),
    );
  }
}
