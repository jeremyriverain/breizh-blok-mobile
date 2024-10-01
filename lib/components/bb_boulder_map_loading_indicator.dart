import 'package:flutter/material.dart';

class BbBoulderMapLoadingIndicator extends StatelessWidget {
  const BbBoulderMapLoadingIndicator({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80),
          child: CircularProgressIndicator(
            color: Colors.red,
            semanticsLabel: 'Récupération de la liste des blocs',
          ),
        ),
      ],
    );
  }
}
