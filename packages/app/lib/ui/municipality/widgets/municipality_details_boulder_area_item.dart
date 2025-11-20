import 'package:breizh_blok_mobile/domain/entities/boulder_area/boulder_area.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/clickable_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MunicipalityDetailsBoulderAreaItem extends StatelessWidget {
  const MunicipalityDetailsBoulderAreaItem({
    required this.boulderArea,
    super.key,
  });

  final BoulderArea boulderArea;

  @override
  Widget build(BuildContext context) {
    final subtitle = boulderArea.nBouldersRated(AppLocalizations.of(context));
    return ClickableListTile(
      title: Text(boulderArea.name),
      subtitle: subtitle != null ? Text(subtitle) : null,
      onTap: () async {
        await context.pushNamed(
          BoulderAreaDetailsScreen.route.name,
          pathParameters: {
            BoulderAreaDetailsScreen.idParameterName: boulderArea.iri
                .replaceAll('/boulder_areas/', ''),
          },
        );
      },
    );
  }
}
