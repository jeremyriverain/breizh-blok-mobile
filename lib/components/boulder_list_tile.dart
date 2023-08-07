import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/components/boulder_tile_image.dart';
import 'package:breizh_blok_mobile/components/boulder_tile_title.dart';

class BoulderListTile extends StatelessWidget {
  const BoulderListTile({
    Key? key,
    required this.boulder,
    this.onClickTile,
  }) : super(key: key);

  final Boulder boulder;
  final Function? onClickTile;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Voir le détail du bloc "${boulder.name}"',
      child: InkWell(
        onTap: () {
          if (onClickTile != null) {
            onClickTile!(boulder.id);
          }
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
                          const Padding(padding: EdgeInsets.only(bottom: 2.0)),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'Secteur: ',
                                    style: TextStyle(
                                      color: Colors.black54,
                                    )),
                                TextSpan(
                                  text: boulder.rock.boulderArea.name,
                                )
                              ],
                            ),
                          ),
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                const TextSpan(
                                    text: 'Commune: ',
                                    style: TextStyle(color: Colors.black54)),
                                TextSpan(
                                  text: boulder
                                      .rock.boulderArea.municipality.name,
                                )
                              ],
                            ),
                            key: const Key('boulder-list-tile-municipality'),
                          )
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
