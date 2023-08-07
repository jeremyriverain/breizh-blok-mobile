import 'package:breizh_blok_mobile/components/boulder_list_filter_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FilterBouldersButton extends StatelessWidget {
  const FilterBouldersButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      key: const Key('boulder-list-filter-button'),
      child: const Row(
        children: [
          Icon(CupertinoIcons.line_horizontal_3_decrease),
          SizedBox(
            width: 5,
          ),
          Text('Filtrer')
        ],
      ),
      onPressed: () {
        showModalBottomSheet(
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return FractionallySizedBox(
                heightFactor: 0.6,
                child: BoulderListFilterModal(),
              );
            });
      },
    );
  }
}
