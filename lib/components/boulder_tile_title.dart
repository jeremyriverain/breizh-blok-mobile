import 'package:flutter/material.dart';

import 'package:breizh_blok_mobile/models/boulder.dart';

class BoulderTileTitle extends StatelessWidget {
  const BoulderTileTitle({
    Key? key,
    required this.boulder,
  }) : super(key: key);

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        children: <TextSpan>[
          TextSpan(
            text: boulder.name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          if (boulder.grade != null)
            TextSpan(
              text: ' (${boulder.grade?.name ?? ''})',
              style: const TextStyle(
                fontSize: 16,
              ),
            )
        ],
      ),
    );
  }
}
