import 'package:flutter/material.dart';

class MapLoadingIndicator extends StatelessWidget {
  const MapLoadingIndicator({
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
