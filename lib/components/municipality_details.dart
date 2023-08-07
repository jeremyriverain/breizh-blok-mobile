import 'package:breizh_blok_mobile/components/app_bar_helper.dart';
import 'package:breizh_blok_mobile/components/municipality_details_boulder_area_item.dart';
import 'package:breizh_blok_mobile/components/municipality_details_map.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:flutter/material.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';

class MunicipalityDetails extends StatelessWidget {
  final Municipality municipality;
  MunicipalityDetails({
    super.key,
    required this.municipality,
  }) {
    boulderAreas = municipality.boulderAreas.where(
      (b) {
        final numberOfBoulders = b.numberOfBoulders;
        return numberOfBoulders != null && numberOfBoulders > 0;
      },
    ).toList();
  }

  late final List<BoulderArea> boulderAreas;

  @override
  Widget build(BuildContext context) {
    final tabs = [
      const Tab(
        text: 'Liste des secteurs',
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
              const AppBarHelper(label: 'commune'),
              Text(
                municipality.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: TabBarView(
            children: tabViews,
          ),
        ),
      ),
    );
  }
}
