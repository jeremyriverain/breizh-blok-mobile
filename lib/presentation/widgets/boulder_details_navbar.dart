import 'package:breizh_blok_mobile/iri_parser.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/presentation/widgets/bb_share_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoulderDetailsNavbar extends StatelessWidget
    implements PreferredSizeWidget {
  const BoulderDetailsNavbar({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: FittedBox(
        child: Text(
          boulder.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      actions: [
        BbShareButton(
          content: AppLocalizations.of(context).shareableBoulder(
            boulderName: boulder.name,
            boulderAreaName: boulder.rock.boulderArea.name,
            boulderIri: IriParser.id(
              boulder.iri,
            ),
          ),
        ),
      ],
    );
  }
}
