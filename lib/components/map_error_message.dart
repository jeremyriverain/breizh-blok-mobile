import 'package:flutter/material.dart';

class MapErrorMessage extends StatelessWidget {
  const MapErrorMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Text(
          "Une erreur est survenue pendant l'affichage de la carte",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: Colors.red,
              ),
        ),
      ),
    );
  }
}
