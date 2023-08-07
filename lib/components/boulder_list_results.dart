import 'package:flutter/material.dart';

class BoulderListResults extends StatelessWidget {
  final int totalItems;

  const BoulderListResults({
    Key? key,
    required this.totalItems,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: '${totalItems.toString()} ',
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: totalItems > 1 ? 'blocs' : 'bloc'),
            ],
          ),
        )
      ],
    );
  }
}
