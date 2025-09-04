import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/loading_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/not_found_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/view_models/municipality_view_model.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MunicipalityDetailsScreen extends StatelessWidget {
  const MunicipalityDetailsScreen({required this.id, super.key});

  static const ({String name, String path}) route = (
    path: '/:$idParameterName',
    name: 'municipality_details',
  );

  static const idParameterName = 'municipalityId';

  final String id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => MunicipalityViewModel(
        repository: context.read<MunicipalityRepository>(),
        id: id,
      ),
      child: BlocBuilder<MunicipalityViewModel, MunicipalityStates>(
        builder: (context, state) {
          return switch (state) {
            MunicipalityLoading() => const LoadingScreen(),
            MunicipalityOK(:final municipality) => MunicipalityDetails(
              municipality: municipality,
            ),
            MunicipalityError(:final error) =>
              error is HttpExceptionWithStatus && error.statusCode == 404
                  ? const NotFoundScreen()
                  : ErrorScreen(
                      onTryAgain: () {
                        context.read<MunicipalityViewModel>().add(
                          const MunicipalityEvents.requested(),
                        );
                      },
                    ),
          };
        },
      ),
    );
  }
}
