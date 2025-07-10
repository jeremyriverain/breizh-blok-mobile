import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/entities/municipality/municipality.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_description_tab.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_list_tab.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_map_tab.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:flutter/material.dart';

class BoulderAreaDetails extends StatefulWidget {
  const BoulderAreaDetails({required this.boulderArea, super.key});

  final BoulderArea boulderArea;
  Municipality? get municipality => boulderArea.municipality;

  @override
  State<BoulderAreaDetails> createState() => _BoulderAreaDetailsState();
}

class _BoulderAreaDetailsState extends State<BoulderAreaDetails>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: 3,
      initialIndex: _currentIndex,
    );

    _tabController.addListener(() {
      if (_tabController.index != _currentIndex) {
        setState(() {
          _currentIndex = _tabController.index;
        });
      }
    });
    super.initState();
  }

  int _currentIndex = 0;

  late TabController _tabController;

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final tabs = [
      Tab(text: localizations.boulders),
      Tab(text: localizations.description),
      Tab(text: localizations.map),
    ];

    final municipality = widget.municipality;

    return Scaffold(
      appBar: AppBar(
        key: const Key('boulder-area-details-app-bar'),
        title: Column(
          children: [
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: widget.boulderArea.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  if (municipality != null)
                    TextSpan(text: ' (${municipality.name})'),
                ],
              ),
            ),
          ],
        ),
        actions: [
          ShareButton(
            content: AppLocalizations.of(context).shareableBoulderArea(
              boulderAreaName: widget.boulderArea.name,
              municipalityName: widget.boulderArea.municipality?.name ?? '',
              boulderAreaIri: IriParser.id(widget.boulderArea.iri),
            ),
          ),
        ],
        bottom: TabBar(controller: _tabController, tabs: tabs),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BoulderAreaDetailsListTab(boulderArea: widget.boulderArea),
          BoulderAreaDetailsDescriptionTab(boulderArea: widget.boulderArea),
          BoulderAreaDetailsMapTab(boulderArea: widget.boulderArea),
        ],
      ),
    );
  }
}
