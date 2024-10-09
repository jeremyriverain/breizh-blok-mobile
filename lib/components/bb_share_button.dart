import 'package:breizh_blok_mobile/share_content_service_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BbShareButton extends StatelessWidget {
  const BbShareButton({
    required this.content,
    super.key,
  });

  final String content;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: const Icon(
        Icons.share,
        semanticLabel: 'Partager le lien',
      ),
      onPressed: () {
        context.read<ShareContentServiceInterface>().share(content);
      },
    );
  }
}
