import 'package:flutter/material.dart';

class BbBoulderListBuilderBackToTopButton extends StatelessWidget {
  const BbBoulderListBuilderBackToTopButton({
    required this.onPressed,
    super.key,
  });
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      key: const Key('boulder-list-back-to-top-button'),
      bottom: 10,
      right: 10,
      child: FloatingActionButton(
        mini: true,
        heroTag: 'backToTopButton',
        tooltip: 'Revenir en haut de la liste',
        shape: const CircleBorder(),
        onPressed: onPressed,
        child: const Icon(Icons.arrow_upward_outlined),
      ),
    );
  }
}
