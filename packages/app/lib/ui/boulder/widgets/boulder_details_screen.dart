import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_view_model.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_details_view.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/loading_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class BoulderDetailsScreen extends StatelessWidget {
  const BoulderDetailsScreen({required this.id, super.key});

  static const route = (
    path: '/boulders/:$idParameterName',
    name: 'boulder_details',
  );

  static const idParameterName = 'boulderId';

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (context) => BoulderViewModel(
            repository: context.read<BoulderRepository>(),
            id: id,
          ),
      child: BlocBuilder<BoulderViewModel, BoulderStates>(
        builder: (context, data) {
          return switch (data) {
            BoulderLoading() => const LoadingScreen(),
            BoulderOK(:final boulder) => BoulderDetailsView(boulder: boulder),
            BoulderError(:final error) =>
              error is HttpExceptionWithStatus && error.statusCode == 404
                  ? const NotFoundScreen()
                  : ErrorScreen(
                    onTryAgain: () {
                      context.read<BoulderViewModel>().add(
                        const BoulderRequested(),
                      );
                    },
                  ),
          };
        },
      ),
    );
  }
}
