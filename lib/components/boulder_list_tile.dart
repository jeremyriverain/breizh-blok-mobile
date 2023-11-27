import 'package:breizh_blok_mobile/components/boulder_tile_image.dart';
import 'package:breizh_blok_mobile/components/boulder_tile_title.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BoulderListTile extends StatelessWidget {
  const BoulderListTile({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    return Semantics(
      label: 'Voir le détail du bloc "${boulder.name}"',
      child: InkWell(
        onTap: () {
          final offlineFirst = context.read<RequestStrategy>().offlineFirst;
          final routeName =
              offlineFirst ? 'downloaded_boulder_details' : 'boulder_details';
          context.pushNamed(
            routeName,
            pathParameters: {'id': boulder.id},
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BoulderTileImage(boulder: boulder),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BoulderTileTitle(boulder: boulder),
                        const Padding(padding: EdgeInsets.only(bottom: 2)),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Secteur: ',
                                style: TextStyle(
                                  color: Colors.black54,
                                ),
                              ),
                              TextSpan(
                                text: boulder.rock.boulderArea.name,
                              ),
                            ],
                          ),
                        ),
                        Text.rich(
                          TextSpan(
                            children: <TextSpan>[
                              const TextSpan(
                                text: 'Commune: ',
                                style: TextStyle(color: Colors.black54),
                              ),
                              TextSpan(
                                text:
                                    boulder.rock.boulderArea.municipality.name,
                              ),
                            ],
                          ),
                          key: const Key('boulder-list-tile-municipality'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
