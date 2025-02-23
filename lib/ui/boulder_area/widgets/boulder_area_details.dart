import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_description_tab.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_list_tab.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/lazy_indexed_stack.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/share_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoulderAreaDetails extends StatefulWidget {
  const BoulderAreaDetails({
    required this.boulderArea,
    super.key,
  });

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
    context.read<BoulderMarkerBloc>().add(
          BoulderMarkerRequested(
            filterState: context.read<BoulderFilterBloc>().state,
            offlineFirst: context.read<RequestStrategy>().offlineFirst,
          ),
        );
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
      Tab(
        text: localizations.description,
      ),
    ];

    final tabViews = [
      BoulderAreaDetailsListTab(boulderArea: widget.boulderArea),
      BoulderAreaDetailsDescriptionTab(boulderArea: widget.boulderArea),
    ];

    final municipality = widget.municipality;

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          key: const Key('boulder-area-details-app-bar'),
          title: Column(
            children: [
              Text.rich(
                TextSpan(
                  children: <TextSpan>[
                    TextSpan(
                      text: widget.boulderArea.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    if (municipality != null)
                      TextSpan(
                        text: ' (${municipality.name})',
                      ),
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
                boulderAreaIri: IriParser.id(
                  widget.boulderArea.iri,
                ),
              ),
            ),
          ],
          bottom: TabBar(
            controller: _tabController,
            tabs: tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: LazyIndexedStack(
            index: _currentIndex,
            children: tabViews,
          ),
        ),
      ),
    );
  }
}
