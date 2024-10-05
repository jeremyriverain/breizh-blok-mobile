import 'package:breizh_blok_mobile/components/bb_share_button.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:flutter/material.dart';

class BoulderDetailsNavbar extends StatelessWidget
    implements PreferredSizeWidget {
  const BoulderDetailsNavbar({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(
        child: Text(
          boulder.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        BbShareButton(
          content: boulder.shareableContent,
        ),
      ],
    );
  }
}
