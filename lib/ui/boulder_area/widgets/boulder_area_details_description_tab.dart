import 'package:breizh_blok_mobile/domain/models/boulder_area.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_map.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_bar_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoulderAreaDetailsDescriptionTab extends StatefulWidget {
  const BoulderAreaDetailsDescriptionTab({
    required this.boulderArea,
    super.key,
  });

  final BoulderArea boulderArea;

  int? get numberOfBoulders {
    return boulderArea.numberOfBouldersGroupedByGrade?.values
        .reduce((total, current) => total + current);
  }

  @override
  State<BoulderAreaDetailsDescriptionTab> createState() =>
      _BoulderAreaDetailsState();
}

class _BoulderAreaDetailsState extends State<BoulderAreaDetailsDescriptionTab> {
  @override
  Widget build(BuildContext context) {
    final numberOfBouldersGroupedByGrade =
        widget.boulderArea.numberOfBouldersGroupedByGrade;

    final numOfBoulders = widget.numberOfBoulders;

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
                title: numOfBoulders != null
                    ? AppLocalizations.of(context)
                        .distributionOfNBoulders(num: numOfBoulders)
                    : AppLocalizations.of(context).distributionOfBoulders,
                data: numberOfBouldersGroupedByGrade,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(
              20,
            ),
            child: SizedBox(
              height: 800,
              child: BoulderAreaDetailsMap(boulderArea: widget.boulderArea),
            ),
          ),
        ],
      ),
    );
  }
}
