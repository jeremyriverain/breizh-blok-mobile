import 'package:flutter/material.dart';

class AppBarHelper extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  final String label;
  const AppBarHelper({
    super.key,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      '($label)',
      style: Theme.of(context).textTheme.bodySmall,
    );
  }
}
