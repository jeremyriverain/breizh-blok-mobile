import 'package:breizh_blok_mobile/blocs/map_permission_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MyMap extends StatefulWidget {
  const MyMap({
    required this.map,
    super.key,
  });

  final GoogleMap map;

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  Future<void>? futurePermission;
  late Location locationInstance;

  @override
  void didChangeDependencies() {
    locationInstance = context.read<Location>();
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

    var serviceEnabled = await locationInstance.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await locationInstance.requestService();
      if (!serviceEnabled) {
        return;
      }
    }

    var permissionGranted = await locationInstance.hasPermission();

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
