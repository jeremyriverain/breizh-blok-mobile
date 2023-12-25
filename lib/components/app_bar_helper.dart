import 'package:flutter/material.dart';

class AppBarHelper extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHelper({
    required this.label,
    super.key,
  });
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      '($label)',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
