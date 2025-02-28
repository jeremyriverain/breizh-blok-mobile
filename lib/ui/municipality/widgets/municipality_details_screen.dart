import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/domain/models/municipality/municipality.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/loading_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/not_found_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MunicipalityDetailsScreen extends StatefulWidget {
  const MunicipalityDetailsScreen({required this.id, super.key});

  static const route = (
    path: 'municipalities/:id',
    name: 'municipality_details',
  );

  final String id;

  @override
  State<MunicipalityDetailsScreen> createState() =>
      _MunicipalityDetailsScreenState();
}

class _MunicipalityDetailsScreenState extends State<MunicipalityDetailsScreen> {
  Future<Municipality> _findMunicipality(BuildContext context) {
    return context.read<MunicipalityRepository>().find(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _findMunicipality(context),
      builder: (BuildContext context, AsyncSnapshot<Municipality> snapshot) {
        final municipality = snapshot.data;
        if (municipality != null) {
          return MunicipalityDetails(municipality: municipality);
        } else if (snapshot.hasError) {
          final error = snapshot.error;
          if (error is HttpExceptionWithStatus && error.statusCode == 404) {
            return const NotFoundScreen();
          }

          return ErrorScreen(
            onTryAgain: () {
              setState(() {});
            },
          );
        }

        return const LoadingScreen();
      },
    );
  }
}
