import 'package:breizh_blok_mobile/ui/boulder_area/view_models/boulder_area_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/map_error_banner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class BoulderAreaDetailsMapBottom extends StatelessWidget {
  const BoulderAreaDetailsMapBottom({
    required this._areaId,
    required this._child,
    super.key,
  });

  final int _areaId;
  final Widget _child;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        void onTryAgain() {
          ref.invalidate(findByAreaBoulderGeoPointsProvider(_areaId));
        }

        void onClose() {
          ref
              .read(
                activatePotentialErrorBannerViewModelProvider.notifier,
              )
              .deactivatePotentialErrorBanner();
        }

        ref.listen(findByAreaBoulderGeoPointsProvider(_areaId), (prev, next) {
          ref
              .read(activatePotentialErrorBannerViewModelProvider.notifier)
              .activatePotentialErrorBanner();
        });

        return ref
            .watch(findByAreaBoulderGeoPointsProvider(_areaId))
            .when(
              skipLoadingOnRefresh: false,
              data: (result) {
                if (result.isLeft()) {
                  return ref.watch(
                        activatePotentialErrorBannerViewModelProvider,
                      )
                      ? MapErrorBanner(
                          onTryAgain: onTryAgain,
                          onClose: onClose,
                        )
                      : const SizedBox.shrink();
                }

                return _child;
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
