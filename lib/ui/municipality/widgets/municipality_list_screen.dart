import 'package:breizh_blok_mobile/data/data_sources/api/model/paginated_collection.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/domain/models/department/department.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_indicator.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class MunicipalityListScreen extends StatefulWidget {
  const MunicipalityListScreen({super.key});

  @override
  State<MunicipalityListScreen> createState() => _MunicipalityListScreenState();
}

class _MunicipalityListScreenState extends State<MunicipalityListScreen> {
  Future<PaginatedCollection<Department>> _fetch(BuildContext context) {
    return context.read<DepartmentRepository>().findAll();
  }

  PaginatedCollection<Department> data = const PaginatedCollection(
    items: [],
    totalItems: 0,
  );

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _fetch(context),
      builder: (
        context,
        AsyncSnapshot<PaginatedCollection<Department>> snapshot,
      ) {
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
                          MunicipalityDetailsScreen.route.name,
                          pathParameters: {
                            'id': municipality.iri.replaceAll(
                              '/municipalities/',
                              '',
                            ),
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

        return const Center(child: CircularProgressIndicator());
      },
    );
  }
}
