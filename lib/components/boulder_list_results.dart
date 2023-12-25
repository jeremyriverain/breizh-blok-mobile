import 'package:flutter/material.dart';

class BoulderListResults extends StatelessWidget {
  const BoulderListResults({
    required this.totalItems,
    super.key,
  });
  final int totalItems;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '$totalItems ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: totalItems > 1 ? 'blocs' : 'bloc'),
            ],
          ),
        ),
      ],
    );
  }
}
