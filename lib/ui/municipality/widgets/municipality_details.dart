import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_boulder_area_item.dart';
import 'package:flutter/material.dart';

class MunicipalityDetails extends StatelessWidget {
  MunicipalityDetails({required this.municipality, super.key}) {
    boulderAreas =
        municipality.boulderAreas.where((b) {
          final numberOfBoulders = b.numberOfBoulders;
          return numberOfBoulders != null && numberOfBoulders > 0;
        }).toList();
  }
  final Municipality municipality;

  late final List<BoulderArea> boulderAreas;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      Tab(text: AppLocalizations.of(context).boulderAreas),
      Tab(text: AppLocalizations.of(context).map),
    ];

    final tabViews = [
      ListView.builder(
        key: const Key('municipality-details-list-view'),
        itemCount: boulderAreas.length,
        itemBuilder: (context, int index) {
          final boulderArea = boulderAreas[index];

          return MunicipalityDetailsBoulderAreaItem(
            boulderArea: boulderArea,
            key: Key(boulderArea.iri),
          );
        },
      ),
      Container(color: Colors.red),
    ];
    return DefaultTabController(
      key: const Key('municipality-details'),
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          key: const Key('municipality-details-app-bar'),
          title: Column(
            children: [
              Text(
                municipality.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          actions: [
            ShareButton(
              content: AppLocalizations.of(context).shareableMunicipality(
                municipalityName: municipality.name,
                municipalityIri: IriParser.id(municipality.iri),
              ),
            ),
          ],
          bottom: TabBar(tabs: tabs),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TabBarView(children: tabViews),
        ),
      ),
    );
  }
}
