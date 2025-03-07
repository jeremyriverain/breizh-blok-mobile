import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/downloaded_boulder_area.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/empty_list_indicator.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloaded_boulder_area_details_screen.dart';
import 'package:breizh_blok_mobile/ui/download/widgets/downloads_sort_button.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';

class DownloadedBoulderAreasScreen extends StatefulWidget {
  const DownloadedBoulderAreasScreen({super.key});

  static const route = (path: '/downloads', name: 'downloads');

  @override
  State<DownloadedBoulderAreasScreen> createState() =>
      _DownloadedBoulderAreasScreenState();
}

class _DownloadedBoulderAreasScreenState
    extends State<DownloadedBoulderAreasScreen> {
  Future<List<DownloadedBoulderArea>> _findDownloads(
    ApiOrderParam orderParam,
  ) async {
    final response = await GetIt.I<AppDatabase>().allDownloads(
      orderParam: orderParam,
    );
    return response;
  }

  var _orderParam = const ApiOrderParam(
    name: kIdOrderParam,
    direction: kDescendantDirection,
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
      body: FutureBuilder(
        future: _findDownloads(_orderParam),
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data != null) {
            if (data.isEmpty) {
              return Center(
                child: EmptyListIndicator(
                  title: AppLocalizations.of(context).noDownload,
                  message: AppLocalizations.of(context).noDownloadHelper,
                ),
              );
            }
            return ListView.builder(
              itemCount: data.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    if (index == 0)
                      DownloadsSortButton(
                        initialSelected: _orderParam,
                        onChanged: (ApiOrderParam orderParam) {
                          setState(() {
                            _orderParam = orderParam;
                          });
                        },
                      ),
                    ListTile(
                      key: Key(data[index].boulderAreaIri),
                      title: Text(data[index].boulderAreaName),
                      subtitle: Text(data[index].municipalityName),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        context.pushNamed(
                          DownloadedBoulderAreaDetailsScreen.route.name,
                          pathParameters: {
                            DownloadedBoulderAreaDetailsScreen
                                .idParameterName: data[index].boulderAreaIri
                                .replaceAll('/boulder_areas/', ''),
                          },
                        );
                      },
                    ),
                  ],
                );
              },
            );
          }
          if (snapshot.hasError) {
            return const ErrorScreen();
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
