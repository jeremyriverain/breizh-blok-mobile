import 'package:breizh_blok_mobile/ui/core/widgets/map_error_banner.dart';
import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapScreenBottom extends StatelessWidget {
  const MapScreenBottom({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        void onTryAgain() {
          ref.invalidate(findAllBoulderGeoPointsProvider);
        }

        void onClose() {
          ref
              .read(
                activatePotentialErrorBannerViewModelProvider.notifier,
              )
              .deactivatePotentialErrorBanner();
        }

        ref.listen(findAllBoulderGeoPointsProvider, (prev, next) {
          ref
              .read(activatePotentialErrorBannerViewModelProvider.notifier)
              .activatePotentialErrorBanner();
        });

        return ref
            .watch(findAllBoulderGeoPointsProvider)
            .when(
              skipLoadingOnRefresh: false,
              data: (result) {
                if (result.isLeft()) {
                  return ref.watch(
                        activatePotentialErrorBannerViewModelProvider,
                      )
                      ? MapErrorBanner(
                          onClose: onClose,
                          onTryAgain: onTryAgain,
                        )
                      : const SizedBox.shrink();
                }

                return const SizedBox.shrink();
              },
              error: (e, _) =>
                  ref.watch(activatePotentialErrorBannerViewModelProvider)
                  ? MapErrorBanner(
                      onClose: onClose,
                      onTryAgain: onTryAgain,
                    )
                  : const SizedBox.shrink(),
              loading: () => const Padding(
                padding: EdgeInsets.all(30),
                child: SizedBox.square(
                  dimension: 50,

                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                  ),
                ),
              ),
            );
      },
    );
  }
}
