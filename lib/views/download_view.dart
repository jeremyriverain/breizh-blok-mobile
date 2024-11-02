import 'package:breizh_blok_mobile/components/bb_empty_list_indicator.dart';
import 'package:breizh_blok_mobile/components/downloads_sort_button.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/models/downloaded_boulder_area.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';

class DownloadView extends StatefulWidget {
  const DownloadView({
    required this.database,
    super.key,
  });

  final AppDatabase database;

  @override
  State<DownloadView> createState() => _DownloadViewState();
}

class _DownloadViewState extends State<DownloadView> {
  Future<List<DownloadedBoulderArea>> _findDownloads(
    OrderParam orderParam,
  ) async {
    final response = await widget.database.allDownloads(orderParam: orderParam);
    return response;
  }

  var _orderParam = const OrderParam(
    name: kIdOrderParam,
    direction: kDescendantDirection,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).downloads,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: FutureBuilder(
        future: _findDownloads(_orderParam),
        builder: (context, snapshot) {
          final data = snapshot.data;

          if (data != null) {
            if (data.isEmpty) {
              return Center(
                child: BbEmptyListIndicator(
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
                        onChanged: (OrderParam orderParam) {
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
                          'downloaded_boulder_area_details',
                          pathParameters: {
                            'id': data[index]
                                .boulderAreaIri
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
            return const ErrorView();
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
