import 'package:breizh_blok_mobile/components/boulder_details_associated.dart';
import 'package:breizh_blok_mobile/components/boulder_item_map.dart';
import 'package:breizh_blok_mobile/components/line_boulders.dart';
import 'package:breizh_blok_mobile/components/map_launcher_button.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BoulderDetails extends StatelessWidget {
  const BoulderDetails({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final grade = boulder.grade;
    final description = boulder.description;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ListView(
        key: const Key('boulder-details-list-view'),
        shrinkWrap: true,
        children: [
          LineBoulders(lineBoulders: boulder.lineBoulders),
          if (description != null)
            ListTile(
              title: Text(description),
              leading: const Text('Description'),
            ),
          if (grade != null)
            ListTile(
              title: Text(grade.name),
              leading: const Text('Cotation'),
            ),
          ListTile(
            title: Text(boulder.rock.boulderArea.municipality.name),
            leading: const Text('Commune'),
            key: const Key('municipality-details-link'),
            onTap: () {
              context.pushNamed(
                'municipality_details',
                pathParameters: {
                  'id': Uri.parse(boulder.rock.boulderArea.municipality.iri)
                      .pathSegments
                      .last,
                },
              );
            },
          ),
          ListTile(
            title: Text(boulder.rock.boulderArea.name),
            leading: const Text('Secteur'),
            key: const Key('boulder-area-details-link'),
            onTap: () {
              context.pushNamed(
                'boulder_area_details',
                pathParameters: {
                  'id':
                      Uri.parse(boulder.rock.boulderArea.iri).pathSegments.last,
                },
              );
            },
          ),
          SizedBox(
            height: 300,
            child: BoulderItemMap(boulder: boulder),
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
          const SizedBox(
            height: 20,
          ),
          BoulderDetailsAssociated(boulder: boulder),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
