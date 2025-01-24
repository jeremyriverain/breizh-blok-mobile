import 'package:breizh_blok_mobile/domain/models/boulder_area.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
    return ListTile(
      title: Text(boulderArea.name),
      subtitle: subtitle != null ? Text(subtitle) : null,
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: () {
        context.pushNamed(
          'boulder_area_details',
          pathParameters: {
            'id': boulderArea.iri.replaceAll('/boulder_areas/', ''),
          },
        );
      },
    );
  }
}
