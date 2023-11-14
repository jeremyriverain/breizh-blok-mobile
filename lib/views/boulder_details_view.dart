import 'package:breizh_blok_mobile/components/boulder_details.dart';
import 'package:breizh_blok_mobile/components/boulder_details_navbar.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:breizh_blok_mobile/views/loading_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderDetailsView extends StatefulWidget {
  const BoulderDetailsView({
    required this.id,
    super.key,
  });

  final String id;

  @override
  State<BoulderDetailsView> createState() => _BoulderDetailsViewState();
}

class _BoulderDetailsViewState extends State<BoulderDetailsView> {
  Future<Boulder> _findBoulder(BuildContext context) {
    final offlineFirst = context.read<RequestStrategy>().offlineFirst;
    return context.read<BoulderRepository>().find(
          widget.id,
          offlineFirst: offlineFirst,
        );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Boulder>(
      future: _findBoulder(context),
      builder: (context, snapshot) {
        final boulder = snapshot.data;
        if (boulder != null) {
          return Scaffold(
            appBar: BoulderDetailsNavbar(boulder: boulder),
            body: BoulderDetails(boulder: boulder),
          );
        } else if (snapshot.hasError) {
          return ErrorView(
            onTryAgain: () {
              setState(() => {});
            },
          );
        }

        return const LoadingView();
      },
    );
  }
}
