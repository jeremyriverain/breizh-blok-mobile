import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({required this.content, super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        return IconButton(
          icon: Icon(
            Icons.share,
            semanticLabel: AppLocalizations.of(context).share,
          ),
          onPressed: () {
            ref.read(shareContentProvider).share(content).run();
          },
        );
      },
    );
  }
}
