import 'package:breizh_blok_mobile/ui/core/widgets/boulder_area_details_layout.dart';
import 'package:flutter/material.dart';

class BoulderAreaDetailsScreen extends StatelessWidget {
  const BoulderAreaDetailsScreen({required this.id, super.key});

  static const route = (
    path: '/boulder-areas/:$idParameterName',
    name: 'boulder_area_details',
  );

  static const idParameterName = 'boulderAreaId';

  final String id;

  @override
  Widget build(BuildContext context) {
    return BoulderAreaDetailsLayout(id: id);
  }
}
