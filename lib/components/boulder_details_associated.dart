import 'package:breizh_blok_mobile/repositories/boulder_repository.dart';
import 'package:flutter/material.dart';

import 'package:breizh_blok_mobile/models/boulder.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/components/boulder_details_associated_item.dart';

class BoulderDetailsAssociated extends StatefulWidget {
  final Boulder boulder;

  const BoulderDetailsAssociated({
    Key? key,
    required this.boulder,
  }) : super(key: key);

  @override
  State<BoulderDetailsAssociated> createState() =>
      _BoulderDetailsAssociatedState();
}

class _BoulderDetailsAssociatedState extends State<BoulderDetailsAssociated>
    with AutomaticKeepAliveClientMixin {
  final boulderRepository = BoulderRepository();

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return FutureBuilder<CollectionItems<Boulder>>(
      future: boulderRepository.findBy(queryParams: {
        'pagination': ['false'],
        'rock.id': [widget.boulder.rock.id.toString()],
      }),
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
                  '${boulders.items.length == 2 ? "Bloc" : "Blocs"} sur le même rocher',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ),
              ...boulders.items
                  .where((element) => element.iri != widget.boulder.iri)
                  .map(
                    (e) => BoulderDetailsAssociatedItem(boulder: e),
                  )
                  .toList()
            ],
          );
        } else if (snapshot.hasError) {
          return const Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                'Une erreur est survenue lors de la récupération des blocs associés.',
                style: TextStyle(
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
