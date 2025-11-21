import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/clickable_list_tile.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/error_indicator.dart';
import 'package:breizh_blok_mobile/ui/department/view_models/list_departments_view_model.dart';
import 'package:breizh_blok_mobile/ui/municipality/widgets/municipality_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DepartmentListScreen extends StatelessWidget {
  const DepartmentListScreen({super.key});

  static const ({String name, String path}) route = (
    name: 'department_list',
    path: '/municipalities',
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppLocalizations.of(context).municipalities,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: BlocProvider(
        create: (context) => ListDepartmentsViewModel(
          repository: context.read<DepartmentRepository>(),
        ),
        child: BlocBuilder<ListDepartmentsViewModel, ListDepartmentsStates>(
          builder: (context, state) {
            return switch (state) {
              ListDepartmentsLoading() => const Center(
                child: CircularProgressIndicator(),
              ),
              ListDepartmentsOK(:final departments) => ListView.builder(
                itemCount: departments.totalItems,
                itemBuilder: (BuildContext context, int index) {
                  final department = departments.items[index];

                  return Column(
                    children: [
                      ListTile(
                        title: Text(
                          department.name,
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      ...department.municipalities.map(
                        (municipality) => ClickableListTile(
                          title: Text(municipality.name),
                          onTap: () async {
                            await context.pushNamed(
                              MunicipalityDetailsScreen.route.name,
                              pathParameters: {
                                MunicipalityDetailsScreen.idParameterName:
                                    municipality.iri.replaceAll(
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
              ),
              ListDepartmentsError() => ErrorIndicator(
                onTryAgain: () {
                  context.read<ListDepartmentsViewModel>().add(
                    const ListDepartmentsEvents.requested(),
                  );
                },
              ),
            };
          },
        ),
      ),
    );
  }
}
