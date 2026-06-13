import 'package:breizh_blok_map_launcher/breizh_blok_map_launcher.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
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
            return ref
                .watch(availableMapsProvider)
                .when(
                  data: (result) {
                    return result.fold(
                      (_) => const _ErrorWidget(),
                      (availableMaps) => availableMaps.isEmpty
                          ? _NoItemWidget()
                          : Wrap(
                              children: availableMaps
                                  .map(
                                    (map) => ListTile(
                                      onTap: () => _onMapSelected(map: map),
                                      title: Text(map.name),
                                      leading: SvgPicture.asset(
                                        map.icon,
                                        height: 30,
                                        width: 30,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const SizedBox.square(
                                                  dimension: 30,
                                                ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                    );
                  },
                  error: (error, stackTrace) => const _ErrorWidget(),
                  loading: () => const _LoadingWidget(),
                );
          },
        ),
      ),
    );
  }
}

class _LoadingWidget extends StatelessWidget {
  const _LoadingWidget();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(30),
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}

class _ErrorWidget extends StatelessWidget {
  const _ErrorWidget();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ListTile(
        title: Text(AppLocalizations.of(context).anErrorOccured),
        trailing: OutlinedButton(
          onPressed: () {},
          child: Text(AppLocalizations.of(context).tryAgain),
        ),
      ),
    );
  }
}

class _NoItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: ListTile(
        title: Text(
          AppLocalizations.of(
            context,
          ).noMappingApplicationWasDetectedOnYourDevice,
        ),
      ),
    );
  }
}
