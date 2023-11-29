import 'dart:ui' as ui;

import 'package:breizh_blok_mobile/blocs/boulder_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/blocs/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/components/boulder_list_builder.dart';
import 'package:breizh_blok_mobile/components/modal_closing_button.dart';
import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/boulder_marker.dart';
import 'package:breizh_blok_mobile/models/location.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_maps_cluster_manager/google_maps_cluster_manager.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_launcher/map_launcher.dart';

const kDefaultInitialPosition = LatLng(
  48.066152,
  -2.967056,
);

const kSizeSimpleMarker = 75;

const kParkingIcon = 'assets/parking-icon.png';

Future<BitmapDescriptor> getMarkerBitmap(int size, {String? text}) async {
  final pictureRecorder = ui.PictureRecorder();
  final canvas = Canvas(pictureRecorder);
  final paint1 = Paint()..color = Colors.lightGreen;
  final paint2 = Paint()..color = Colors.white;

  canvas
    ..drawCircle(Offset(size / 2, size / 2), size / 2.0, paint1)
    ..drawCircle(Offset(size / 2, size / 2), size / 2.2, paint2)
    ..drawCircle(Offset(size / 2, size / 2), size / 2.8, paint1);

  if (text != null) {
    final painter = TextPainter(textDirection: TextDirection.ltr)
      ..text = TextSpan(
        text: text,
        style: TextStyle(
          fontSize: size / 3,
          color: Colors.white,
          fontWeight: FontWeight.normal,
        ),
      )
      ..layout();
    painter.paint(
      canvas,
      Offset(size / 2 - painter.width / 2, size / 2 - painter.height / 2),
    );
  }

  final img = await pictureRecorder.endRecording().toImage(size, size);
  final data = await img.toByteData(format: ui.ImageByteFormat.png);

  return BitmapDescriptor.fromBytes(data!.buffer.asUint8List());
}

Future<BitmapDescriptor> getMarkerIconFromAsset({
  required String path,
  int width = 110,
}) async {
  return BitmapDescriptor.fromBytes(
    await getBytesFromAsset(path, width),
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

Future<Marker> Function(Cluster<BoulderMarker>) markerBuilderFactory(
  BuildContext context, {
  bool offlineFirst = false,
  BoulderArea? boulderArea,
}) {
  return (cluster) async {
    return Marker(
      markerId: MarkerId(cluster.getId()),
      position: cluster.location,
      onTap: () {
        showModalBottomSheet<void>(
          context: context,
          isScrollControlled: true,
          builder: (BuildContext context) {
            return RepositoryProvider(
              create: (_) => RequestStrategy(
                offlineFirst: offlineFirst,
              ),
              child: Builder(
                builder: (context) {
                  return FractionallySizedBox(
                    heightFactor: 0.8,
                    child: Scaffold(
                      floatingActionButton: const ModalClosingButton(),
                      floatingActionButtonLocation:
                          FloatingActionButtonLocation.endTop,
                      body: BoulderListBuilder(
                        boulderFilterBloc:
                            BoulderFilterBloc(BoulderFilterState()),
                        onPageRequested: (int page) {
                          final orderParam =
                              context.read<BoulderOrderBloc>().state;

                          final boulderIds =
                              cluster.items.map((e) => e.id.toString()).toSet();

                          if (boulderArea != null && offlineFirst) {
                            return DbBouldersRequested(
                              boulderArea: boulderArea,
                              orderParam: orderParam,
                              boulderIds: boulderIds,
                            );
                          }
                          return BoulderRequested(
                            page: page,
                            boulderIds: boulderIds,
                            orderParam: orderParam,
                          );
                        },
                        showFilterButton: false,
                      ),
                    ),
                  );
                },
              ),
            );
          },
        );
      },
      icon: await getMarkerBitmap(
        cluster.isMultiple ? 125 : kSizeSimpleMarker,
        text: cluster.isMultiple ? cluster.count.toString() : null,
      ),
    );
  };
}

void Function({
  required AvailableMap map,
}) showDirections({
  required Location destination,
  required String destinationTitle,
}) {
  return ({
    required AvailableMap map,
  }) =>
      {
        map.showDirections(
          destination: Coords(destination.latitude, destination.longitude),
          destinationTitle: destinationTitle,
        ),
      };
}

Future<void> openMapsSheet({
  required BuildContext context,
  required List<AvailableMap> availableMaps,
  required void Function({required AvailableMap map}) onMapSelectedFn,
}) async {
  try {
    await showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: SingleChildScrollView(
            child: Wrap(
              children: <Widget>[
                for (final map in availableMaps)
                  ListTile(
                    onTap: () => onMapSelectedFn(map: map),
                    title: Text(map.mapName),
                    leading: SvgPicture.asset(
                      map.icon,
                      height: 30,
                      width: 30,
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
    // ignore: empty_catches
  } catch (e) {}
}
