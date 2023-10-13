import 'package:breizh_blok_mobile/components/error_indicator.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/department.dart';
import 'package:breizh_blok_mobile/repositories/department_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class HomeMunicipalitiesView extends StatefulWidget {
  const HomeMunicipalitiesView({super.key});

  @override
  State<HomeMunicipalitiesView> createState() => _HomeMunicipalitiesViewState();
}

class _HomeMunicipalitiesViewState extends State<HomeMunicipalitiesView> {
  Future<CollectionItems<Department>> _fetch(BuildContext context) {
    return context.read<DepartmentRepository>().findAll();
  }

  CollectionItems<Department> data =
      const CollectionItems(items: [], totalItems: 0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetch(context),
      builder: (context, AsyncSnapshot<CollectionItems<Department>> snapshot) {
        final data = snapshot.data;
        if (data != null) {
          this.data = data;
          return ListView.builder(
            itemCount: data.totalItems,
            itemBuilder: (BuildContext context, int index) {
              final department = data.items[index];

              return Column(
                children: [
                  ListTile(
                    title: Text(
                      department.name,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  ...department.municipalities.map(
                    (municipality) => ListTile(
                      title: Text(municipality.name),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        context.pushNamed(
                          'municipality_details',
                          pathParameters: {
                            'id': municipality.iri
                                .replaceAll('/municipalities/', ''),
                          },
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        }

        if (snapshot.hasError) {
          return ErrorIndicator(
            onTryAgain: () {
              setState(() {
                this.data = const CollectionItems(items: [], totalItems: 0);
              });
            },
          );
        }

        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
