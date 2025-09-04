import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/domain/repositories/boulder_feedback_repository.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_location_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_message_feedback_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/contribute_boulder_map_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute/boulder_message_form_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute/contribute_boulder_map_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class ContributeBoulderScreen extends StatelessWidget {
  const ContributeBoulderScreen({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: FittedBox(
          child: Text(
            '${localizations.contributeTo} '
            '${boulder.name}',
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.comment),
            title: Text(localizations.makeSuggestion),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) =>
                      BlocProvider<BoulderMessageFeedbackViewModel>.value(
                        value: context.read<BoulderMessageFeedbackViewModel>(),
                        child: BoulderMessageFormScreen(boulder: boulder),
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.place),
            title: Text(localizations.specifyBoulderLocation),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute<void>(
                  builder: (_) => ContributeBoulderMapScreen(
                    viewModel: ContributeBoulderMapViewModel(
                      form: ContributeBoulderLocationForm(
                        latitude: boulder.rock.location.latitude,
                        longitude: boulder.rock.location.longitude,
                      ),
                      boulderFeedbackRepository:
                          GetIt.I<BoulderFeedbackRepository>(),
                      boulder: boulder,
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
