import 'package:breizh_blok_mobile/share_content_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({
    required this.content,
    super.key,
  });

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
