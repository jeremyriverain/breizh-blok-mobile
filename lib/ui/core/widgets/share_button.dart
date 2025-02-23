import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({required this.content, super.key});

  final String content;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.share,
        semanticLabel: AppLocalizations.of(context).share,
      ),
      onPressed: () {
        context.read<ShareContentServiceInterface>().share(content);
      },
    );
  }
}
