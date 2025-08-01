import 'package:flutter/material.dart';

class FormSpinner extends StatelessWidget {
  const FormSpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox.square(
      dimension: 25,
      child: CircularProgressIndicator(),
    );
  }
}
