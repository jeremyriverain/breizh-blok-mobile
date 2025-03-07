import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/view_models/boulder_area_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/loading_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

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
    return BlocProvider(
      create:
          (context) => BoulderAreaViewModel(
            repository: context.read<BoulderAreaRepository>(),
            id: id,
          ),
      child: BlocBuilder<BoulderAreaViewModel, BoulderAreaStates>(
        builder: (context, state) {
          return switch (state) {
            BoulderAreaLoading() => const LoadingScreen(),
            BoulderAreaOK(:final boulderArea) => MultiBlocProvider(
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
            BoulderAreaError(:final error) =>
              error is HttpExceptionWithStatus && error.statusCode == 404
                  ? const NotFoundScreen()
                  : ErrorScreen(
                    onTryAgain: () {
                      context.read<BoulderAreaViewModel>().add(
                        const BoulderAreaEvents.requested(),
                      );
                    },
                  ),
          };
        },
      ),
    );
  }
}
