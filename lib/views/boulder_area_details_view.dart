import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_area_details.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/repositories/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:breizh_blok_mobile/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoulderAreaDetailsView extends StatelessWidget {
  BoulderAreaDetailsView({
    required this.id,
    super.key,
  });
  final String id;

  final boulderAreaRepository = BoulderAreaRepository();

  Future<BoulderArea> _findBoulderArea() {
    return boulderAreaRepository.find(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _findBoulderArea(),
      builder: (BuildContext context, AsyncSnapshot<BoulderArea> snapshot) {
        final boulderArea = snapshot.data;
        if (boulderArea != null) {
          final location = boulderArea.resolveLocation();
          final boulderFilterBloc = BoulderFilterBloc(
            BoulderFilterState(
              boulderAreas: {
                boulderArea,
              },
            ),
          );

          final boulderMarkerBloc = BoulderMarkerBloc();

          final boulderBloc = BoulderBloc();

          final mapBloc = MapBloc(
            initialState: MapState(
              mapZoom: 14.5,
              mapLatLng: LatLng(
                location.latitude,
                location.longitude,
              ),
            ),
          );

          return MultiBlocProvider(
            providers: [
              BlocProvider<BoulderMarkerBloc>(
                create: (context) => boulderMarkerBloc,
              ),
              BlocProvider<MapBloc>(
                create: (context) => mapBloc,
              ),
              BlocProvider<BoulderBloc>(create: (context) => boulderBloc),
              BlocProvider<BoulderFilterBloc>(
                create: (context) => boulderFilterBloc,
              ),
            ],
            child: BoulderAreaDetails(
              boulderArea: boulderArea,
            ),
          );
        } else if (snapshot.hasError) {
          return ErrorView(
            onTryAgain: _findBoulderArea,
          );
        }

        return const LoadingView();
      },
    );
  }
}
