import 'package:breizh_blok_mobile/data/data_sources/api/model/iri_parser.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/request_strategy.dart';
import 'package:breizh_blok_mobile/domain/entities/boulder/boulder.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/boulder/forms/contribute_boulder_message_form.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_message_feedback_view_model.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_associated.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_height.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/boulder_details_line_boulders.dart';
import 'package:breizh_blok_mobile/ui/boulder/widgets/contribute/contribute_boulder_screen.dart';
import 'package:breizh_blok_mobile/ui/boulder_area/widgets/boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class BoulderDetailsTab extends StatelessWidget {
  const BoulderDetailsTab({required this.boulder, super.key});

  final Boulder boulder;

  @override
  Widget build(BuildContext context) {
    final grade = boulder.grade;
    final height = boulder.height;
    final description = boulder.description;
    final offlineFirst = context.read<RequestStrategy>().offlineFirst;
    final municipality = boulder.rock.boulderArea.municipality;
    final localizations = AppLocalizations.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: ListView(
        key: const Key('boulder-details-list-view'),
        children: [
          BoulderDetailsLineBoulders(lineBoulders: boulder.lineBoulders),
          if (description != null)
            ListTile(
              title: Text(description),
              leading: Text(AppLocalizations.of(context).description),
            ),
          if (grade != null)
            ListTile(
              title: Text(grade.name),
              leading: Text(AppLocalizations.of(context).grade),
            ),
          if (height != null) BoulderDetailsHeight(height: height),
          if (municipality != null)
            ListTile(
              title: Text(municipality.name),
              leading: Text(AppLocalizations.of(context).municipality),
              key: const Key('municipality-details-link'),
              onTap: offlineFirst
                  ? null
                  : () async {
                      await context.pushNamed(
                        MunicipalityDetailsScreen.route.name,
                        pathParameters: {
                          MunicipalityDetailsScreen.idParameterName:
                              IriParser.id(municipality.iri),
                        },
                      );
                    },
            ),
          ListTile(
            title: Text(boulder.rock.boulderArea.name),
            leading: Text(AppLocalizations.of(context).boulderArea),
            key: const Key('boulder-area-details-link'),
            onTap: () async {
              final routeName = offlineFirst
                  ? DownloadedBoulderAreaDetailsScreen.route.name
                  : BoulderAreaDetailsScreen.route.name;
              await context.pushNamed(
                routeName,
                pathParameters: {
                  offlineFirst
                      ? DownloadedBoulderAreaDetailsScreen.idParameterName
                      : BoulderAreaDetailsScreen.idParameterName: IriParser.id(
                    boulder.rock.boulderArea.iri,
                  ),
                },
              );
            },
          ),
          const SizedBox(height: 20),

          const Divider(),
          Consumer(
            builder: (context, ref, child) {
              return BlocProvider(
                create: (context) => BoulderMessageFeedbackViewModel(
                  form: ContributeBoulderMessageForm(),
                  boulderFeedbackRepository: ref.watch(
                    boulderFeedbackRepositoryProvider,
                  ),
                  boulder: boulder,
                ),
                child: Builder(
                  builder: (parentContext) {
                    return ListTile(
                      leading: const Icon(Icons.feedback),
                      title: Text(localizations.contribute),
                      trailing: const Icon(Icons.arrow_right_outlined),
                      onTap: () async {
                        await Navigator.push(
                          context,
                          MaterialPageRoute<void>(
                            builder: (context) =>
                                BlocProvider<
                                  BoulderMessageFeedbackViewModel
                                >.value(
                                  value: parentContext
                                      .read<BoulderMessageFeedbackViewModel>(),
                                  child: ContributeBoulderScreen(
                                    boulder: boulder,
                                  ),
                                ),
                          ),
                        );
                      },
                    );
                  },
                ),
              );
            },
          ),
          BoulderDetailsAssociated(boulder: boulder),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
