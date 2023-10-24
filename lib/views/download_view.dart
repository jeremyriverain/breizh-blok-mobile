// import 'package:breizh_blok_mobile/components/empty_list_indicator.dart';
import 'package:breizh_blok_mobile/components/sort_downloads_button.dart';
import 'package:flutter/material.dart';

class DownloadView extends StatelessWidget {
  const DownloadView({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: [
            SortDownloadsButton(),
            ListTile(
              title: const Text('Cremiou'),
              subtitle: const Text('Kerlouan'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {
                //
              },
            ),
          ],
        );
      },
    );
    // return const Center(
    //   child: EmptyListIndicator(
    //     title: 'Aucun secteur téléchargé',
    //     message:
    //         '''Il est possible de télécharger des secteurs
    //de bloc afin de pouvoir y accéder même sans connexion internet.''',
    //   ),
    // );
  }
}
