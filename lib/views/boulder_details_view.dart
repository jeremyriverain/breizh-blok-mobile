import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/components/boulder_details.dart';
import 'package:breizh_blok_mobile/components/boulder_details_navbar.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:breizh_blok_mobile/views/error_view.dart';
import 'package:breizh_blok_mobile/views/loading_view.dart';
import 'package:breizh_blok_mobile/views/not_found_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class BoulderDetailsView extends StatefulWidget {
  const BoulderDetailsView({
    required this.id,
    this.boulderAreaIri,
    super.key,
  });

  final String id;
  final String? boulderAreaIri;

  @override
  State<BoulderDetailsView> createState() => _BoulderDetailsViewState();
}

class _BoulderDetailsViewState extends State<BoulderDetailsView> {
  Future<Boulder> _findBoulder(BuildContext context) {
    if (!context.read<RequestStrategy>().offlineFirst) {
      return context.read<BoulderRepository>().find(
            widget.id,
          );
    }

    final boulderAreaIri = widget.boulderAreaIri;
    if (boulderAreaIri == null) {
      throw Exception('boulderAreaId should be defined');
    }

    final database = context.read<AppDatabase>();
    return (database.select(database.dbBoulderAreas)
          ..where(
            (tbl) => tbl.iri.equals(boulderAreaIri),
          ))
        .getSingle()
        .then((dbBoulderArea) {
      final bouldersPath = dbBoulderArea.boulders;
      if (bouldersPath == null) {
        throw Exception('boulders property should be defined');
      }
      return context.read<AppHttpClient>().get(
            Uri.parse(bouldersPath),
            offlineFirst: true,
          );
    }).then((response) {
      final boulderJson =
          // ignore: avoid_dynamic_calls
          (jsonDecode(response)['hydra:member'] as List<dynamic>)
              // ignore: avoid_dynamic_calls
              .singleWhere((json) => json['@id'] == '/boulders/${widget.id}');
      return Boulder.fromJson(
        boulderJson as Map<String, dynamic>,
      );
    });
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
          final error = snapshot.error;
          if (error is HttpExceptionWithStatus && error.statusCode == 404) {
            return const NotFoundView();
          }
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
