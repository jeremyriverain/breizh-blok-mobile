import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_itinerary_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_bar_chart.dart';
import 'package:flutter/material.dart';

class BoulderAreaDetailsDescriptionTab extends StatefulWidget {
  const BoulderAreaDetailsDescriptionTab({
    required this.boulderArea,
    super.key,
  });

  final BoulderArea boulderArea;

  @override
  State<BoulderAreaDetailsDescriptionTab> createState() =>
      _BoulderAreaDetailsDescriptionTabState();
}

class _BoulderAreaDetailsDescriptionTabState
    extends State<BoulderAreaDetailsDescriptionTab>
    with AutomaticKeepAliveClientMixin {
  int? get numberOfBoulders {
    return widget.boulderArea.numberOfBouldersGroupedByGrade?.values.reduce(
      (total, current) => total + current,
    );
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final numberOfBouldersGroupedByGrade =
        widget.boulderArea.numberOfBouldersGroupedByGrade;

    final numOfBoulders = numberOfBoulders;

    return SingleChildScrollView(
      child: Column(
        children: [
          if (widget.boulderArea.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Text(
                key: const Key('boulder-area-details-description'),
                widget.boulderArea.description ?? '',
              ),
            ),
          if (numberOfBouldersGroupedByGrade != null)
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10, top: 20),
              child: MyBarChart(
                title:
                    numOfBoulders != null
                        ? AppLocalizations.of(
                          context,
                        ).distributionOfNBoulders(num: numOfBoulders)
                        : AppLocalizations.of(context).distributionOfBoulders,
                data: numberOfBouldersGroupedByGrade,
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(top: 28, bottom: 8),
            child: BoulderAreaDetailsItineraryButton(
              boulderArea: widget.boulderArea,
            ),
          ),

          SizedBox(height: 800, child: Container(color: Colors.red)),
        ],
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
