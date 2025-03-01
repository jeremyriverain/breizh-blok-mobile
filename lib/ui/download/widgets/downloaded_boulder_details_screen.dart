import 'package:breizh_blok_mobile/ui/core/widgets/boulder_details_layout.dart';
import 'package:flutter/material.dart';

class DownloadedBoulderDetailsScreen extends StatelessWidget {
  const DownloadedBoulderDetailsScreen({
    required this.id,
    this.boulderAreaIri,
    super.key,
  });

  static const route = (
    path: '/boulders/:$idParameterName',
    name: 'downloaded_boulder_details',
  );

  static const idParameterName = 'downloadedBoulderId';

  final String id;
  final String? boulderAreaIri;

  @override
  Widget build(BuildContext context) {
    return BoulderDetailsLayout(id: id, boulderAreaIri: boulderAreaIri);
  }
}
