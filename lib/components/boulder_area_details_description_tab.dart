import 'package:breizh_blok_mobile/components/boulder_area_bar_chart.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:flutter/material.dart';

class BoulderAreaDetailsDescriptionTab extends StatefulWidget {
  const BoulderAreaDetailsDescriptionTab({
    required this.boulderArea,
    super.key,
  });

  final BoulderArea boulderArea;

  @override
  State<BoulderAreaDetailsDescriptionTab> createState() =>
      _BoulderAreaDetailsState();
}

class _BoulderAreaDetailsState extends State<BoulderAreaDetailsDescriptionTab> {
  @override
  Widget build(BuildContext context) {
    final numberOfBouldersGroupedByGrade =
        widget.boulderArea.numberOfBouldersGroupedByGrade;

    return Column(
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
            padding: const EdgeInsets.only(top: 20),
            child: BoulderAreaBarChart(
              data: numberOfBouldersGroupedByGrade,
            ),
          ),
      ],
    );
  }
}
