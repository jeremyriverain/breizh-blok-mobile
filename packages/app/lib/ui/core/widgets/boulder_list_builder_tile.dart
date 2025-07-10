import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_tile_image.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_tile_title.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BoulderListBuilderTile extends StatelessWidget {
  const BoulderListBuilderTile({
    required this.boulder,
    this.showLocationInfo = true,
    super.key,
  });

  final Boulder boulder;
  final bool showLocationInfo;

  @override
  Widget build(BuildContext context) {
    final municipality = boulder.rock.boulderArea.municipality;
    return Semantics(
      label: 'Voir le détail du bloc "${boulder.name}"',
      child: InkWell(
        onTap: () {
          final offlineFirst = context.read<RequestStrategy>().offlineFirst;
          final routeName =
              offlineFirst
                  ? DownloadedBoulderDetailsScreen.route.name
                  : BoulderDetailsScreen.route.name;
          context.pushNamed(
            routeName,
            pathParameters: {
              offlineFirst
                      ? DownloadedBoulderDetailsScreen.idParameterName
                      : BoulderDetailsScreen.idParameterName:
                  boulder.id,
            },
            queryParameters:
                offlineFirst
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
                Stack(children: [BoulderTileImage(boulder: boulder)]),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 2, 0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        BoulderTileTitle(boulder: boulder),
                        if (showLocationInfo)
                          const Padding(padding: EdgeInsets.only(bottom: 2)),
                        if (showLocationInfo)
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      // ignore: lines_longer_than_80_chars
                                      '${AppLocalizations.of(context).boulderArea}: ',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                TextSpan(text: boulder.rock.boulderArea.name),
                              ],
                            ),
                          ),
                        if (showLocationInfo && municipality != null)
                          Text.rich(
                            TextSpan(
                              children: <TextSpan>[
                                TextSpan(
                                  text:
                                      // ignore: lines_longer_than_80_chars
                                      '${AppLocalizations.of(context).municipality}: ',
                                  style: const TextStyle(color: Colors.black54),
                                ),
                                TextSpan(text: municipality.name),
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
