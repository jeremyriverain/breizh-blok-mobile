import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/loading_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/not_found_screen.dart';
import 'package:breizh_blok_mobile/ui/download/view_models/downloaded_boulder_area_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

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
    return BlocProvider(
      create:
          (context) => DownloadedBoulderAreaViewModel(
            repository: context.read<BoulderAreaRepository>(),
            id: id,
          ),
      child: BlocBuilder<
        DownloadedBoulderAreaViewModel,
        DownloadedBoulderAreaStates
      >(
        builder: (context, state) {
          return switch (state) {
            DownloadedBoulderAreaLoading() => const LoadingScreen(),
            DownloadedBoulderAreaOK(:final boulderArea) => MultiBlocProvider(
              providers: [
                BlocProvider<BoulderBloc>(
                  create:
                      (context) => BoulderBloc(
                        repository: context.read<BoulderRepository>(),
                      ),
                ),
                BlocProvider<BoulderFilterBloc>(
                  create:
                      (context) => BoulderFilterBloc(
                        BoulderFilterState(boulderAreas: {boulderArea}),
                      ),
                ),
              ],
              child: BoulderAreaDetails(boulderArea: boulderArea),
            ),
            DownloadedBoulderAreaError(:final error) =>
              error is HttpExceptionWithStatus && error.statusCode == 404
                  ? const NotFoundScreen()
                  : ErrorScreen(
                    onTryAgain: () {
                      context.read<DownloadedBoulderAreaViewModel>().add(
                        const DownloadedBoulderAreaEvents.requested(),
                      );
                    },
                  ),
          };
        },
      ),
    );
  }
}
