import 'package:breizh_blok_mobile/components/bb_share_button.dart';
import 'package:breizh_blok_mobile/components/municipality_details_boulder_area_item.dart';
import 'package:breizh_blok_mobile/components/municipality_details_map.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:flutter/material.dart';

class MunicipalityDetails extends StatelessWidget {
  MunicipalityDetails({
    required this.municipality,
    super.key,
  }) {
    boulderAreas = municipality.boulderAreas.where(
      (b) {
        final numberOfBoulders = b.numberOfBoulders;
        return numberOfBoulders != null && numberOfBoulders > 0;
      },
    ).toList();
  }
  final Municipality municipality;

  late final List<BoulderArea> boulderAreas;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Tab(
        text: 'Secteurs',
      ),
      const Tab(
        text: 'Carte',
      ),
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
      MunicipalityDetailsMap(
        initialPosition: municipality.resolveLocation(),
        boulderAreas: municipality.boulderAreas,
      ),
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
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            BbShareButton(
              content: municipality.shareableContent,
            ),
          ],
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TabBarView(
            children: tabViews,
          ),
        ),
      ),
    );
  }
}
