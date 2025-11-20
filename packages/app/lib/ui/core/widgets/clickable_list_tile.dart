import 'package:flutter/material.dart';

class ClickableListTile extends StatelessWidget {
  const ClickableListTile({
    required this.onTap,
    super.key,
    this.title,
    this.leading,
    this.subtitle,
  });

  final Widget? title;
  final Widget? subtitle;
  final Widget? leading;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: leading,
      subtitle: subtitle,
      title: title,
      trailing: const Icon(Icons.arrow_right_outlined),
      onTap: onTap,
    );
  }
}
