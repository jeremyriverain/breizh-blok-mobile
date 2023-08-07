import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:breizh_blok_mobile/components/boulder_tile_image.dart';
import 'package:breizh_blok_mobile/components/boulder_tile_title.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';

class BoulderDetailsAssociatedItem extends StatelessWidget {
  const BoulderDetailsAssociatedItem({
    Key? key,
    required this.boulder,
  }) : super(key: key);

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          context.pushNamed('boulder_details', params: {'bid': boulder.id});
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BoulderTileImage(boulder: boulder),
                Expanded(
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 2.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          BoulderTileTitle(boulder: boulder),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
