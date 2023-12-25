import 'package:breizh_blok_mobile/components/empty_list_indicator.dart';
import 'package:breizh_blok_mobile/components/sort_downloads_button.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/models/downloaded_boulder_area.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:flutter/material.dart';
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
    return FutureBuilder(
      future: _findDownloads(_orderParam),
      builder: (context, snapshot) {
        final data = snapshot.data;

        if (data != null) {
          if (data.isEmpty) {
            return const Center(
              child: EmptyListIndicator(
                title: 'Aucun secteur téléchargé',
                message: '''
Il est possible de télécharger des secteurs
        de bloc afin de pouvoir y accéder même sans connexion internet.''',
              ),
            );
          }
          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  if (index == 0)
                    SortDownloadsButton(
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
    );
  }
}
