import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:breizh_blok_mobile/location_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class BaseMap extends StatefulWidget {
  const BaseMap({
    Key? key,
    required this.map,
  }) : super(key: key);

  final GoogleMap map;

  @override
  State<BaseMap> createState() => _BaseMapState();
}

class _BaseMapState extends State<BaseMap> {
  Future<void>? futurePermission;
  late Location locationInstance;

  @override
  void didChangeDependencies() {
    locationInstance = LocationProvider.of(context).locationInstance;
    futurePermission ??= requestPermission();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futurePermission,
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return widget.map;
        }
        return const LinearProgressIndicator();
      },
    );
  }

  Future<void> requestPermission() async {
    final mapPermissionBloc = context.read<MapPermissionBloc>();

    if (mapPermissionBloc.state.hasRequested &&
        mapPermissionBloc.state.hasDenied) {
      return;
    }

    bool serviceEnabled = await locationInstance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationInstance.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    PermissionStatus permissionGranted = await locationInstance.hasPermission();

    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await locationInstance.requestPermission().then(
        (permissionStatus) {
          context.read<MapPermissionBloc>().add(
                RequestPermissionEvent(
                  hasDenied: permissionStatus == PermissionStatus.denied ||
                      permissionStatus == PermissionStatus.deniedForever,
                ),
              );
          return permissionStatus;
        },
      );
    }
  }
}
