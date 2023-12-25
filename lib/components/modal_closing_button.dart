import 'package:flutter/material.dart';

class ModalClosingButton extends StatelessWidget {
  const ModalClosingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, -26, 0),
      child: FloatingActionButton(
        mini: true,
        tooltip: 'Fermer les critères de recherche',
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: const Icon(Icons.close),
      ),
    );
  }
}
