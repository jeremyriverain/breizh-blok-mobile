import 'package:breizh_blok_mobile/components/municipality_details.dart';
import 'package:breizh_blok_mobile/models/municipality.dart';
import 'package:breizh_blok_mobile/repositories/municipality_repository.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:breizh_blok_mobile/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
