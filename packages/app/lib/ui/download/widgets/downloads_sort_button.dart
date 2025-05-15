import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_choice.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/sort_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadsSortButton extends StatelessWidget {
  const DownloadsSortButton({
    required this.onChanged,
    required this.initialSelected,
    super.key,
  });

  final void Function(ApiOrderParam orderParam) onChanged;

  final ApiOrderParam initialSelected;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);

    final choices = [
      ApiOrderChoice(
        label: localizations.downloadedRecently,
        orderParam: const ApiOrderParam(
          name: kIdOrderParam,
          direction: kDescendantDirection,
        ),
      ),
      ApiOrderChoice(
        label:
            // ignore: lines_longer_than_80_chars
            '${localizations.sortedAlphabetically} (${localizations.boulderArea.toLowerCase()})',
        orderParam: const ApiOrderParam(
          direction: kAscendantDirection,
          name: 'boulderAreaName',
        ),
      ),
      ApiOrderChoice(
        label:
            // ignore: lines_longer_than_80_chars
            '${localizations.sortedAlphabetically} (${localizations.municipality.toLowerCase()})',
        orderParam: const ApiOrderParam(
          direction: kAscendantDirection,
          name: 'municipalityName',
        ),
      ),
    ];
    return SortButton(
      choices: choices,
      initialSelected: initialSelected,
      onChanged: onChanged,
      label: '${localizations.sortBy}:',
    );
  }
}
