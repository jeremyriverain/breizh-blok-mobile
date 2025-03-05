import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_navbar.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/loading_screen.dart';
import 'package:breizh_blok_mobile/ui/download/view_models/downloaded_boulder_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DownloadedBoulderDetailsScreen extends StatelessWidget {
  const DownloadedBoulderDetailsScreen({
    required this.id,
    required this.boulderAreaIri,
    super.key,
  });

  static const route = (
    path: '/boulders/:$idParameterName',
    name: 'downloaded_boulder_details',
  );

  static const idParameterName = 'downloadedBoulderId';
  static const boulderAreaIriParameterName = 'boulderAreaIri';

  final String id;
  final String boulderAreaIri;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => DownloadedBoulderViewModel(
            boulderAreaIri: boulderAreaIri,
            boulderId: id,
            repository: context.read<DownloadedBoulderRepository>(),
          ),
      child: BlocBuilder<BoulderViewModel, BoulderStates>(
        builder: (context, data) {
          return switch (data) {
            BoulderLoading() => const LoadingScreen(),
            BoulderOK(:final boulder) => Scaffold(
              appBar: BoulderDetailsNavbar(boulder: boulder),
              body: BoulderDetails(boulder: boulder),
            ),
            BoulderError() => ErrorScreen(
              onTryAgain: () {
                context.read<BoulderViewModel>().add(const BoulderRequested());
              },
            ),
          };
        },
      ),
    );
  }
}
