import 'package:breizh_blok_mobile/domain/models/height_boulder/height_boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:flutter/material.dart';

class BoulderDetailsHeight extends StatelessWidget {
  const BoulderDetailsHeight({required this.height, super.key});

  final HeightBoulder height;

  @override
  Widget build(BuildContext context) {
    final translator = AppLocalizations.of(context);
    String title() {
      final min = height.min;
      final max = height.max;
      if (min == 0 && max != null) {
        return translator.lessThanNMeters(value: max);
      }

      if (max != null) {
        return translator.betweenXAndYMeters(min: min, max: max);
      }
      return translator.moreThanNMeters(value: min);
    }

    return ListTile(title: Text(title()), leading: Text(translator.height));
  }
}
