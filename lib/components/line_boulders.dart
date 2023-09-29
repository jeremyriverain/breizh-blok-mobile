import 'package:breizh_blok_mobile/components/line_boulder_image.dart';
import 'package:breizh_blok_mobile/models/line_boulder.dart';
import 'package:flutter/material.dart';

class LineBoulders extends StatelessWidget {
  const LineBoulders({
    required this.lineBoulders,
    super.key,
  });

  final List<LineBoulder> lineBoulders;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: lineBoulders
          .map<Widget>(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: LineBoulderImage(
                lineBoulder: e,
              ),
            ),
          )
          .toList(),
    );
  }
}
