import 'package:breizh_blok_mobile/components/map_launcher_button.dart';
import 'package:flutter/material.dart';
import 'package:breizh_blok_mobile/components/line_boulder_image.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/line_boulder.dart';
import 'package:breizh_blok_mobile/components/boulder_details_associated.dart';
import 'package:breizh_blok_mobile/components/boulder_item_map.dart';
import 'package:go_router/go_router.dart';

class BoulderDetails extends StatelessWidget {
  final Boulder boulder;

  const BoulderDetails({
    Key? key,
    required this.boulder,
  }) : super(key: key);

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
          ..._buildLineBouldersImages(context, boulder.lineBoulders),
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
              context.pushNamed('municipality_details', params: {
                'id': Uri.parse(boulder.rock.boulderArea.municipality.iri)
                    .pathSegments
                    .last,
              });
            },
          ),
          ListTile(
            title: Text(boulder.rock.boulderArea.name),
            leading: const Text('Secteur'),
            key: const Key('boulder-area-details-link'),
            onTap: () {
              context.pushNamed('boulder_area_details', params: {
                'id': Uri.parse(boulder.rock.boulderArea.iri).pathSegments.last,
              });
            },
          ),
          SizedBox(
            height: 300,
            child: BoulderItemMap(boulder: boulder),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Center(
              child: MapLauncherButton(
                destination: boulder.rock.location,
                destinationTitle:
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

  List<Widget> _buildLineBouldersImages(
      BuildContext context, List<LineBoulder> lineBoulders) {
    final Size sizeScreen = MediaQuery.of(context).size;
    if (sizeScreen.width < 600) {
      return lineBoulders
          .map<Widget>(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: LineBoulderImage(lineBoulder: e),
            ),
          )
          .toList();
    }
    return [
      SizedBox(
        height: 500,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: lineBoulders.length,
          itemBuilder: (BuildContext context, int index) {
            return LineBoulderImage(lineBoulder: lineBoulders[index]);
          },
          separatorBuilder: (BuildContext context, int index) {
            return const SizedBox(
              width: 10,
            );
          },
        ),
      ),
    ];
  }
}
