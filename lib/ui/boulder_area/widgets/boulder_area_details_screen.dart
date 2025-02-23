import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/domain/models/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/loading_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/not_found_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class BoulderAreaDetailsScreen extends StatefulWidget {
  const BoulderAreaDetailsScreen({
    required this.id,
    super.key,
  });
  final String id;

  @override
  State<BoulderAreaDetailsScreen> createState() =>
      _BoulderAreaDetailsScreenState();
}

class _BoulderAreaDetailsScreenState extends State<BoulderAreaDetailsScreen> {
  Future<BoulderArea> _findBoulderArea(BuildContext context) {
    final offlineFirst = context.read<RequestStrategy>().offlineFirst;
    return context.read<BoulderAreaRepository>().find(
          widget.id,
          offlineFirst: offlineFirst,
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _findBoulderArea(context),
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

          final boulderMarkerBloc = BoulderMarkerBloc(
            repository: context.read<BoulderMarkerRepository>(),
          );

          final boulderBloc = BoulderBloc(
            repository: context.read<BoulderRepository>(),
          );

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
