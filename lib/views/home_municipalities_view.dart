import 'package:breizh_blok_mobile/components/error_indicator.dart';
import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/department.dart';
import 'package:breizh_blok_mobile/repositories/department_repository.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeMunicipalitiesView extends StatefulWidget {
  const HomeMunicipalitiesView({super.key});

  @override
  State<HomeMunicipalitiesView> createState() => _HomeMunicipalitiesViewState();
}

class _HomeMunicipalitiesViewState extends State<HomeMunicipalitiesView> {
  final _departmentRepository = DepartmentRepository();

  Future<CollectionItems<Department>> _fetch() {
    return _departmentRepository.findAll();
  }

  CollectionItems<Department> data =
      const CollectionItems(items: [], totalItems: 0);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetch(),
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
