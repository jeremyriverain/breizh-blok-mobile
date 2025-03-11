import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_itinerary_button.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_map.dart';
import 'package:flutter/material.dart';

class BoulderAreaDetailsMapTab extends StatelessWidget {
  const BoulderAreaDetailsMapTab({required this.boulderArea, super.key});

  final BoulderArea boulderArea;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: MyMap()),
        Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 8),
          child: BoulderAreaDetailsItineraryButton(boulderArea: boulderArea),
        ),
      ],
    );
  }
}
