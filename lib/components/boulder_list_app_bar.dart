import 'package:flutter/material.dart';

import 'package:breizh_blok_mobile/components/boulder_list_app_bar_search_field.dart';

class BoulderListAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BoulderListAppBar({Key? key}) : super(key: key);

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
