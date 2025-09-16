// ignore_for_file: lines_longer_than_80_chars

import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/empty_list_indicator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_indicator.dart';
import 'package:breizh_blok_mobile/ui/download/view_models/list_downloaded_boulder_areas_view_model.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloads_sort_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DownloadedBoulderAreasScreen extends StatelessWidget {
  const DownloadedBoulderAreasScreen({super.key});

  static const ({String name, String path}) route = (
    path: '/downloads',
    name: 'downloads',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).downloads,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          return BlocProvider(
            create: (context) => ListDownloadedBoulderAreasViewModel(
              database: ref.watch(appDatabaseProvider),
            ),
            child:
                BlocBuilder<
                  ListDownloadedBoulderAreasViewModel,
                  ListDownloadedBoulderAreasStates
                >(
                  builder: (context, state) {
                    return switch (state) {
                      ListDownloadedBoulderAreasLoading() => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      ListDownloadedBoulderAreasOK(
                        :final boulderAreas,
                        :final orderParam,
                      ) =>
                        boulderAreas.isEmpty
                            ? Center(
                                child: EmptyListIndicator(
                                  title: AppLocalizations.of(
                                    context,
                                  ).noDownload,
                                  message: AppLocalizations.of(
                                    context,
                                  ).noDownloadHelper,
                                ),
                              )
                            : ListView.builder(
                                itemCount: boulderAreas.length,
                                itemBuilder: (context, index) {
                                  return Column(
                                    children: [
                                      if (index == 0)
                                        DownloadsSortButton(
                                          initialSelected: orderParam,
                                          onChanged: (ApiOrderParam orderParam) {
                                            context
                                                .read<
                                                  ListDownloadedBoulderAreasViewModel
                                                >()
                                                .add(
                                                  ListDownloadedBoulderAreasEvents.requested(
                                                    orderParam: orderParam,
                                                  ),
                                                );
                                          },
                                        ),
                                      ListTile(
                                        key: Key(
                                          boulderAreas[index].boulderAreaIri,
                                        ),
                                        title: Text(
                                          boulderAreas[index].boulderAreaName,
                                        ),
                                        subtitle: Text(
                                          boulderAreas[index].municipalityName,
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                        ),
                                        onTap: () {
                                          context.pushNamed(
                                            DownloadedBoulderAreaDetailsScreen
                                                .route
                                                .name,
                                            pathParameters: {
                                              DownloadedBoulderAreaDetailsScreen
                                                      .idParameterName:
                                                  boulderAreas[index]
                                                      .boulderAreaIri
                                                      .replaceAll(
                                                        '/boulder_areas/',
                                                        '',
                                                      ),
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  );
                                },
                              ),
                      ListDownloadedBoulderAreasError(:final orderParam) =>
                        Center(
                          child: ErrorIndicator(
                            onTryAgain: () => context
                                .read<ListDownloadedBoulderAreasViewModel>()
                                .add(
                                  ListDownloadedBoulderAreasEvents.requested(
                                    orderParam: orderParam,
                                  ),
                                ),
                          ),
                        ),
                    };
                  },
                ),
          );
        },
      ),
    );
  }
}
