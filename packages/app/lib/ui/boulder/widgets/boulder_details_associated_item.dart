import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_tile_image.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_tile_title.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BoulderDetailsAssociatedItem extends StatelessWidget {
  const BoulderDetailsAssociatedItem({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () async {
          final offlineFirst = context.read<RequestStrategy>().offlineFirst;
          final routeName = offlineFirst
              ? DownloadedBoulderDetailsScreen.route.name
              : BoulderDetailsScreen.route.name;
          await context.pushNamed(
            routeName,
            pathParameters: {
              offlineFirst
                      ? DownloadedBoulderDetailsScreen.idParameterName
                      : BoulderDetailsScreen.idParameterName:
                  boulder.id,
            },
            queryParameters: offlineFirst
                ? {'boulderAreaIri': boulder.rock.boulderArea.iri}
                : {},
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
                      children: <Widget>[BoulderTileTitle(boulder: boulder)],
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
