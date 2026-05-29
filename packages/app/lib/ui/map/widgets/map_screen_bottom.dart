import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:breizh_blok_mobile/ui/map/widgets/map_screen_error_banner.dart';
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

        return ref
            .watch(findAllBoulderGeoPointsProvider)
            .when(
              skipLoadingOnRefresh: false,
              data: (result) {
                if (result.isLeft()) {
                  return MapScreenErrorBanner(
                    onTryAgain: onTryAgain,
                  );
                }

                return const SizedBox.shrink();
              },
              error: (_, _) => MapScreenErrorBanner(
                onTryAgain: onTryAgain,
              ),
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
