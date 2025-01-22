import 'package:breizh_blok_mobile/models/collection_items.dart';
import 'package:breizh_blok_mobile/models/department.dart';
import 'package:breizh_blok_mobile/repositories/department_repository.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MunicipalityListScreen extends StatefulWidget {
  const MunicipalityListScreen({super.key});

  @override
  State<MunicipalityListScreen> createState() => _MunicipalityListScreenState();
}

class _MunicipalityListScreenState extends State<MunicipalityListScreen> {
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
              setState(() {});
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
