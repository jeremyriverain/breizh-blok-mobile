import 'dart:ui' as ui;

import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_marker_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/blocs/map_bloc.dart';
import 'package:breizh_blok_mobile/components/app_bar_helper.dart';
import 'package:breizh_blok_mobile/components/boulder_area_bar_chart.dart';
import 'package:breizh_blok_mobile/components/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/components/boulder_map.dart';
import 'package:breizh_blok_mobile/components/download_area_button.dart';
import 'package:breizh_blok_mobile/components/map_error_message.dart';
import 'package:breizh_blok_mobile/components/map_launcher_button.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

class BoulderAreaDetails extends StatelessWidget {
  const BoulderAreaDetails({
    required this.boulderArea,
    super.key,
  });

  final BoulderArea boulderArea;

  Future<BitmapDescriptor> test() async {
    return BitmapDescriptor.fromBytes(
      await getBytesFromAsset('assets/parking-icon.png', 110),
    );
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    final data = await rootBundle.load(path);
    final codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetWidth: width,
    );
    final fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
        .buffer
        .asUint8List();
  }

  @override
  Widget build(BuildContext context) {
    final offlineFirst = context.read<RequestStrategy>().offlineFirst;
    context.read<BoulderMarkerBloc>().add(
          BoulderMarkerRequested(
            filterState: context.read<BoulderFilterBloc>().state,
            offlineFirst: offlineFirst,
          ),
        );

    final location = boulderArea.resolveLocation();
    final parkingLocation = boulderArea.parkingLocation;

    final tabs = [
      const Tab(text: 'Blocs'),
      const Tab(
        text: 'Description',
      ),
      const Tab(text: 'Carte'),
    ];

    final numberOfBouldersGroupedByGrade =
        boulderArea.numberOfBouldersGroupedByGrade;
    final tabViews = [
      BoulderListBuilder(
        boulderFilterBloc: context.read<BoulderFilterBloc>(),
        onPageRequested: (int page) {
          return BoulderListViewRequested(
            page: page,
            filterState: context.read<BoulderFilterBloc>().state,
            orderQueryParam: context.read<BoulderOrderBloc>().state,
            grades: context.read<BoulderFilterGradeBloc>().state.grades,
            offlineFirst: context.read<RequestStrategy>().offlineFirst,
          );
        },
        bottomHeaderWidget: DownloadAreaButton(
          boulderArea: boulderArea,
        ),
      ),
      Column(
        children: [
          if (boulderArea.description != null)
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: Text(
                key: const Key('boulder-area-details-description'),
                boulderArea.description ?? '',
              ),
            ),
          if (numberOfBouldersGroupedByGrade != null)
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: BoulderAreaBarChart(
                data: numberOfBouldersGroupedByGrade,
              ),
            ),
        ],
      ),
      Column(
        children: [
          Expanded(
            child: FutureBuilder(
              future: Future.wait([
                getMarkerIconFromAsset(path: kParkingIcon),
                MapLauncher.installedMaps,
              ]),
              builder: (context, AsyncSnapshot<List<Object>> snapshot) {
                if (snapshot.hasError) {
                  return const MapErrorMessage();
                }
                final data = snapshot.data;
                if (data == null) {
                  return Container();
                }

                final icon = data[0] as BitmapDescriptor;
                final availableMaps = data[1] as List<AvailableMap>;
                return BoulderMap(
                  initialPosition: context.watch<MapBloc>().state.mapLatLng,
                  initialZoom: context.watch<MapBloc>().state.mapZoom,
                  boulderMarkerBuilder: markerBuilderFactory(
                    context,
                    offlineFirst: context.read<RequestStrategy>().offlineFirst,
                  ),
                  markers: parkingLocation == null
                      ? {}
                      : {
                          Marker(
                            markerId: MarkerId('${boulderArea.iri}-parking'),
                            position: LatLng(
                              parkingLocation.latitude,
                              parkingLocation.longitude,
                            ),
                            icon: icon,
                            onTap: () {
                              openMapsSheet(
                                context: context,
                                availableMaps: availableMaps,
                                onMapSelectedFn: showDirections(
                                  destination: parkingLocation,
                                  destinationTitle:
                                      'Parking du secteur ${boulderArea.name}',
                                ),
                              );
                            },
                          ),
                        },
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: MapLauncherButton(
              destination: location,
              destinationTitle: parkingLocation != null
                  ? 'Parking du secteur ${boulderArea.name}'
                  : 'Secteur ${boulderArea.name}',
              labelButton:
                  // ignore: lines_longer_than_80_chars
                  'Itinéraire vers le ${parkingLocation != null ? 'parking' : 'secteur'}',
            ),
          ),
        ],
      ),
    ];

    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        appBar: AppBar(
          key: const Key('boulder-area-details-app-bar'),
          title: Column(
            children: [
              const AppBarHelper(label: 'secteur'),
              Text(
                boulderArea.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          bottom: TabBar(
            tabs: tabs,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: TabBarView(
            children: tabViews,
          ),
        ),
      ),
    );
  }
}
