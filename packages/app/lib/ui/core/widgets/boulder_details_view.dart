import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_map_tab.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_tab.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:flutter/material.dart';

class BoulderDetailsView extends StatefulWidget {
  const BoulderDetailsView({required this.boulder, super.key});

  final Boulder boulder;

  @override
  State<BoulderDetailsView> createState() => _BoulderDetailsScreenState();
}

class _BoulderDetailsScreenState extends State<BoulderDetailsView>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    _tabController = TabController(
      vsync: this,
      length: 2,
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
      Tab(text: localizations.details),
      Tab(text: localizations.map),
    ];

    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            widget.boulder.name,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        actions: [
          ShareButton(
            content: AppLocalizations.of(context).shareableBoulder(
              boulderName: widget.boulder.name,
              boulderAreaName: widget.boulder.rock.boulderArea.name,
              boulderIri: IriParser.id(widget.boulder.iri),
            ),
          ),
        ],
        bottom: TabBar(controller: _tabController, tabs: tabs),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          BoulderDetailsTab(boulder: widget.boulder),
          BoulderDetailsMapTab(boulder: widget.boulder),
        ],
      ),
    );
  }
}
