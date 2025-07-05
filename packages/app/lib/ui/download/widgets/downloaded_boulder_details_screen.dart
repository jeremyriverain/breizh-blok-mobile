import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_details_view.dart';
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
      child: BlocBuilder<DownloadedBoulderViewModel, DownloadedBoulderStates>(
        builder: (context, data) {
          return switch (data) {
            DownloadedBoulderLoading() => const LoadingScreen(),
            DownloadedBoulderOK(:final boulder) => BoulderDetailsView(
              boulder: boulder,
            ),
            DownloadedBoulderError() => ErrorScreen(
              onTryAgain: () {
                context.read<DownloadedBoulderViewModel>().add(
                  const DownloadedBoulderRequested(),
                );
              },
            ),
          };
        },
      ),
    );
  }
}
