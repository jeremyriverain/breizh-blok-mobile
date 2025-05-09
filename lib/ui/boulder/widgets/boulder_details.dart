import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/models/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_associated.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_height.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_line_boulders.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_map.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_launcher_button.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class BoulderDetails extends StatelessWidget {
  const BoulderDetails({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final grade = boulder.grade;
    final height = boulder.height;
    final description = boulder.description;
    final offlineFirst = context.read<RequestStrategy>().offlineFirst;
    final municipality = boulder.rock.boulderArea.municipality;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ListView(
        key: const Key('boulder-details-list-view'),
        shrinkWrap: true,
        children: [
          Stack(
            children: [
              BoulderDetailsLineBoulders(lineBoulders: boulder.lineBoulders),
            ],
          ),
          if (description != null)
            ListTile(
              title: Text(description),
              leading: Text(AppLocalizations.of(context).description),
            ),
          if (grade != null)
            ListTile(
              title: Text(grade.name),
              leading: Text(AppLocalizations.of(context).grade),
            ),
          if (height != null) BoulderDetailsHeight(height: height),
          if (municipality != null)
            ListTile(
              title: Text(municipality.name),
              leading: Text(AppLocalizations.of(context).municipality),
              key: const Key('municipality-details-link'),
              onTap:
                  offlineFirst
                      ? null
                      : () {
                        context.pushNamed(
                          MunicipalityDetailsScreen.route.name,
                          pathParameters: {
                            MunicipalityDetailsScreen.idParameterName:
                                IriParser.id(municipality.iri),
                          },
                        );
                      },
            ),
          ListTile(
            title: Text(boulder.rock.boulderArea.name),
            leading: Text(AppLocalizations.of(context).boulderArea),
            key: const Key('boulder-area-details-link'),
            onTap: () {
              final routeName =
                  offlineFirst
                      ? DownloadedBoulderAreaDetailsScreen.route.name
                      : BoulderAreaDetailsScreen.route.name;
              context.pushNamed(
                routeName,
                pathParameters: {
                  offlineFirst
                      ? DownloadedBoulderAreaDetailsScreen.idParameterName
                      : BoulderAreaDetailsScreen.idParameterName: IriParser.id(
                    boulder.rock.boulderArea.iri,
                  ),
                },
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: Center(
              child: MapLauncherButton(
                destination: boulder.rock.location,
                destinationTitle:
                    // ignore: lines_longer_than_80_chars
                    '${boulder.name}${boulder.grade != null ? ', ${boulder.grade?.name}' : ''}',
              ),
            ),
          ),
          SizedBox(height: 450, child: BoulderDetailsMap(boulder: boulder)),
          const SizedBox(height: 20),
          BoulderDetailsAssociated(boulder: boulder),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
