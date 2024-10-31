import 'dart:convert';

import 'package:breizh_blok_mobile/app_http_client.dart';
import 'package:breizh_blok_mobile/components/boulder_details_associated_item.dart';
import 'package:breizh_blok_mobile/database/app_database.dart';
import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/order_param.dart';
import 'package:breizh_blok_mobile/models/request_strategy.dart';
import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class BoulderDetailsAssociated extends StatefulWidget {
  const BoulderDetailsAssociated({
    required this.boulder,
    super.key,
  });

  final Boulder boulder;

  @override
  State<BoulderDetailsAssociated> createState() =>
      _BoulderDetailsAssociatedState();
}

class _BoulderDetailsAssociatedState extends State<BoulderDetailsAssociated>
    with AutomaticKeepAliveClientMixin {
  Future<CollectionItems<Boulder>> _findBoulders(BuildContext context) {
    if (!context.read<RequestStrategy>().offlineFirst) {
      return context.read<BoulderRepository>().findBy(
        queryParams: {
          'pagination': ['false'],
          'rock.id': [widget.boulder.rock.id],
          'order[name]': [kAscendantDirection],
        },
      );
    }

    final database = context.read<AppDatabase>();
    return (database.select(database.dbBoulderAreas)
          ..where(
            (tbl) => tbl.iri.equals(widget.boulder.rock.boulderArea.iri),
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
      final bouldersJson =
          // ignore: avoid_dynamic_calls
          (jsonDecode(response)['hydra:member'] as List<dynamic>)
              // ignore: avoid_dynamic_calls
              .where((json) => json['rock']['@id'] == widget.boulder.rock.iri)
              .toList();
      return CollectionItems(
        items: bouldersJson
            .map((json) => Boulder.fromJson(json as Map<String, dynamic>))
            .toList()
          ..sort((a, b) => a.name.compareTo(b.name)),
        totalItems: bouldersJson.length,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<CollectionItems<Boulder>>(
      future: _findBoulders(context),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final boulders = snapshot.data!;

          if (boulders.items.length < 2) {
            return Container();
          }

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Divider(),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 5, 10, 15),
                child: Text(
                  AppLocalizations.of(context)
                      .nBouldersOnTheSameRock(count: boulders.items.length - 1),
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ...boulders.items
                  .where((element) => element.iri != widget.boulder.iri)
                  .map(
                    (e) => BoulderDetailsAssociatedItem(boulder: e),
                  ),
            ],
          );
        } else if (snapshot.hasError) {
          return Padding(
            padding: const EdgeInsets.all(10),
            child: Center(
              child: Text(
                AppLocalizations.of(context).errorOccuredWhileFetchingBoulders,
                style: const TextStyle(
                  color: Colors.red,
                ),
              ),
            ),
          );
        }

        return const Padding(
          padding: EdgeInsets.only(top: 10, bottom: 10),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}
