import 'package:breizh_blok_mobile/components/bb_boulder_tile_image.dart';
import 'package:breizh_blok_mobile/components/bb_boulder_tile_title.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BoulderDetailsAssociatedItem extends StatelessWidget {
  const BoulderDetailsAssociatedItem({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          final offlineFirst = context.read<RequestStrategy>().offlineFirst;
          final routeName =
              offlineFirst ? 'downloaded_boulder_details' : 'boulder_details';
          context.pushNamed(
            routeName,
            pathParameters: {'id': boulder.id},
            queryParameters: offlineFirst
                ? {
                    'boulderAreaIri': boulder.rock.boulderArea.iri,
                  }
                : {},
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 1),
          child: SizedBox(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                BbBoulderTileImage(boulder: boulder),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BbBoulderTileTitle(boulder: boulder),
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
