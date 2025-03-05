import 'package:breizh_blok_mobile/ui/core/widgets/boulder_area_details_layout.dart';
import 'package:flutter/material.dart';

class DownloadedBoulderAreaDetailsScreen extends StatelessWidget {
  const DownloadedBoulderAreaDetailsScreen({required this.id, super.key});

  static const route = (
    path: '/boulders-area/:$idParameterName',
    name: 'downloaded_boulder_area_details',
  );

  static const idParameterName = 'downloadedBoulderAreaId';

  final String id;

  @override
  Widget build(BuildContext context) {
    return BoulderAreaDetailsLayout(id: id);
  }
}
