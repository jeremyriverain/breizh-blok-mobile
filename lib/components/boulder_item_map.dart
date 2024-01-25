import 'package:breizh_blok_mobile/components/map_error_message.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/utils/map_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:map_launcher/map_launcher.dart';

const double kSizeMarker = 24;

class BoulderItemMap extends StatelessWidget {
  const BoulderItemMap({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;
  String get apiKey {
    return const String.fromEnvironment('TOMTOM_APIKEY');
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: MapLauncher.installedMaps,
      builder: (context, AsyncSnapshot<List<AvailableMap>> result) {
        if (result.hasError) {
          return const MapErrorMessage();
        }
        final data = result.data;
        if (data == null) {
          return Container();
        }

        return Stack(
          children: [
            FlutterMap(
              options: MapOptions(
                initialCenter: LatLng(
                  boulder.rock.location.latitude,
                  boulder.rock.location.longitude,
                ),
                initialZoom: 14,
              ),
              children: [
                TileLayer(
                  urlTemplate:
                      'https://api.tomtom.com/map/1/tile/sat/main/{z}/{x}/{y}.jpg?key={apiKey}',
                  additionalOptions: {'apiKey': apiKey},
                ),
                // new TileLayer(
                //   urlTemplate: "https://api.tomtom.com/map/1/tile/basic/main/"
                //       "{z}/{x}/{y}.png?key={apiKey}",
                //   additionalOptions: {"apiKey": apiKey},
                // ),
                MarkerLayer(
                  markers: [
                    Marker(
                      point: LatLng(
                        boulder.rock.location.latitude,
                        boulder.rock.location.longitude,
                      ),
                      alignment: Alignment.topCenter,
                      width: kSizeMarker,
                      height: kSizeMarker,
                      child: GestureDetector(
                        onTap: () {
                          openMapsSheet(
                            context: context,
                            availableMaps: data,
                            onMapSelectedFn: showDirections(
                              destination: boulder.rock.location,
                              destinationTitle: boulder.name,
                            ),
                          );
                        },
                        child: Stack(
                          children: [
                            Container(
                              width: kSizeMarker,
                              height: kSizeMarker,
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                            ),
                            Center(
                              child: Container(
                                width: kSizeMarker - 4,
                                height: kSizeMarker - 4,
                                decoration: const BoxDecoration(
                                  color: Colors.lightGreen,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Align(
              alignment: Alignment.bottomRight,
              child: ColoredBox(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.all(3),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text('TomTom Maps API ©'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
