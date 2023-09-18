import 'package:breizh_blok_mobile/components/boulder_details.dart';
import 'package:breizh_blok_mobile/components/boulder_details_navbar.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:breizh_blok_mobile/views/loading_view.dart';
import 'package:flutter/material.dart';

class BoulderDetailsView extends StatelessWidget {
  BoulderDetailsView({required this.id, super.key});

  final String id;
  final boulderRepository = BoulderRepository();

  Future<Boulder> _findBoulder() {
    return boulderRepository.find(id);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Boulder>(
      future: _findBoulder(),
      builder: (context, snapshot) {
        final boulder = snapshot.data;
        if (boulder != null) {
          return Scaffold(
            appBar: BoulderDetailsNavbar(boulder: boulder),
            body: BoulderDetails(boulder: boulder),
          );
        } else if (snapshot.hasError) {
          return ErrorView(onTryAgain: _findBoulder);
        }

        return const LoadingView();
      },
    );
  }
}
