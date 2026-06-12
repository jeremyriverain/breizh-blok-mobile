import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AvailableMapsSheet extends StatelessWidget {
  const AvailableMapsSheet({
    required this._onMapSelected,
    super.key,
  });

  final void Function({required AvailableMap map}) _onMapSelected;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      key: const Key('maps-modal-bottom-sheet'),
      child: SingleChildScrollView(
        child: Consumer(
          builder: (context, ref, _) {
            return Wrap(
              children: ref
                  .watch(availableMapsProvider)
                  .when(
                    data: (result) {
                      return result.fold(
                        (e) => [const Text('error')],
                        (availableMaps) => availableMaps
                            .map(
                              (map) => ListTile(
                                onTap: () => _onMapSelected(map: map),
                                title: Text(map.name),
                                leading: SvgPicture.asset(
                                  map.icon,
                                  height: 30,
                                  width: 30,
                                ),
                              ),
                            )
                            .toList(),
                      );
                    },
                    error: (_, _) => const [Text('error')],
                    loading: () => [
                      const Center(
                        child: CircularProgressIndicator(),
                      ),
                    ],
                  ),
            );
          },
        ),
      ),
    );
  }
}
