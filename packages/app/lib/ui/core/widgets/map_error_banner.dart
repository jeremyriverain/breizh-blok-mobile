import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/map/view_models/map_screen_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MapErrorBanner extends StatelessWidget {
  const MapErrorBanner({required this.onTryAgain, super.key});

  final VoidCallback onTryAgain;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, child) {
        return child ?? const SizedBox.shrink();
      },
      child: MaterialBanner(
        content: Text(
          AppLocalizations.of(
            context,
          ).anErrorOccuredWhileDisplayingMap,
        ),
        leading: const Icon(Icons.error),
        forceActionsBelow: true,

        actions: <Widget>[
          Consumer(
            builder: (context, ref, _) {
              return TextButton(
                onPressed: onTryAgain,
                child: Text(
                  AppLocalizations.of(context).tryAgain,
                ),
              );
            },
          ),
          Consumer(
            builder: (context, ref, child) {
              return IconButton(
                onPressed: () {
                  ref
                      .read(
                        activatePotentialErrorBannerViewModelProvider.notifier,
                      )
                      .deactivatePotentialErrorBanner();
                },
                icon: child ?? const SizedBox.shrink(),
              );
            },
            child: Icon(
              Icons.close,
              semanticLabel: AppLocalizations.of(context).closeTheBanner,
            ),
          ),
        ],
      ),
    );
  }
}
