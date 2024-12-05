import 'package:breizh_blok_mobile/ui/widgets/boulder_list_app_bar_search_field.dart';
import 'package:flutter/material.dart';

class BoulderListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BoulderListAppBar({
    super.key,
  });

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      centerTitle: false,
      title: const BoulderListAppBarSearchField(),
    );
  }
}
