import 'package:breizh_blok_mobile/components/municipality_details.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/repositories/municipality_repository.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:breizh_blok_mobile/views/loading_view.dart';
import 'package:flutter/material.dart';

class MunicipalityDetailsView extends StatelessWidget {
  final String id;

  final municipalityRepository = MunicipalityRepository();

  MunicipalityDetailsView({
    super.key,
    required this.id,
  });

  Future<Municipality> _findMunicipality() {
    return municipalityRepository.find(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _findMunicipality(),
      builder: (BuildContext context, AsyncSnapshot<Municipality> snapshot) {
        final municipality = snapshot.data;
        if (municipality != null) {
          return MunicipalityDetails(municipality: municipality);
        } else if (snapshot.hasError) {
          return ErrorView(
            onTryAgain: _findMunicipality,
          );
        }

        return const LoadingView();
      },
    );
  }
}
