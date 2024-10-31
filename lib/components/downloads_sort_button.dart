import 'package:breizh_blok_mobile/components/bb_sort_button.dart';
import 'package:breizh_blok_mobile/models/order_choice.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DownloadsSortButton extends StatelessWidget {
  const DownloadsSortButton({
    required this.onChanged,
    required this.initialSelected,
    super.key,
  });

  final void Function(OrderParam orderParam) onChanged;

  final OrderParam initialSelected;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final choices = [
      OrderChoice(
        label: localizations.downloadedRecently,
        orderParam: initialSelected,
      ),
      OrderChoice(
        label:
            // ignore: lines_longer_than_80_chars
            '${localizations.sortedAlphabetically} (${localizations.boulderArea.toLowerCase()})',
        orderParam: const OrderParam(
          direction: kAscendantDirection,
          name: 'boulderAreaName',
        ),
      ),
      OrderChoice(
        label:
            // ignore: lines_longer_than_80_chars
            '${localizations.sortedAlphabetically} (${localizations.municipality.toLowerCase()})',
        orderParam: const OrderParam(
          direction: kAscendantDirection,
          name: 'municipalityName',
        ),
      ),
    ];
    return BbSortButton(
      choices: choices,
      initialSelected: initialSelected,
      onChanged: onChanged,
      label: '${localizations.sortBy}:',
    );
  }
}
