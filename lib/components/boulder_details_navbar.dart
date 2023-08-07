import 'package:flutter/material.dart';

import 'package:breizh_blok_mobile/models/boulder.dart';

class BoulderDetailsNavbar extends StatelessWidget
    implements PreferredSizeWidget {
  final Boulder boulder;

  const BoulderDetailsNavbar({
    Key? key,
    required this.boulder,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(
        fit: BoxFit.contain,
        child: Text(
          boulder.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
