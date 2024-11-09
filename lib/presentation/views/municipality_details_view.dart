import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/presentation/views/error_view.dart';
import 'package:breizh_blok_mobile/presentation/views/loading_view.dart';
import 'package:breizh_blok_mobile/presentation/views/not_found_view.dart';
import 'package:breizh_blok_mobile/presentation/widgets/municipality_details.dart';
import 'package:breizh_blok_mobile/repositories/municipality_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class MunicipalityDetailsView extends StatefulWidget {
  const MunicipalityDetailsView({
    required this.id,
    super.key,
  });
  final String id;

  @override
  State<MunicipalityDetailsView> createState() =>
      _MunicipalityDetailsViewState();
}

class _MunicipalityDetailsViewState extends State<MunicipalityDetailsView> {
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
            return const NotFoundView();
          }

          return ErrorView(
            onTryAgain: () {
              setState(() {});
            },
          );
        }

        return const LoadingView();
      },
    );
  }
}
