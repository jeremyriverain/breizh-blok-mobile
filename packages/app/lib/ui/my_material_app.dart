import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_marker/boulder_marker_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/grade/grade_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/locale.dart';
import 'package:breizh_blok_mobile/service_locator/service_locator.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/widget_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyMaterialApp extends ConsumerWidget {
  const MyMaterialApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final localDatabase = ref.watch(appDatabaseProvider);
    final httpClient = ref.watch(apiClientProvider);

    final boulderFilterBloc = BoulderFilterBloc(const BoulderFilterState());

    final boulderOrderBloc = BoulderOrderBloc(
      const ApiOrderParam(direction: kDescendantDirection, name: kIdOrderParam),
    );

    final boulderFilterGradeBloc = BoulderFilterGradeBloc(
      const BoulderFilterGradeState(),
    );

    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<BoulderAreaRepository>(
          create: (context) => BoulderAreaRepository(httpClient: httpClient),
        ),
        RepositoryProvider<BoulderRepository>(
          create: (context) => BoulderRepository(httpClient: httpClient),
        ),
        RepositoryProvider<BoulderMarkerRepository>(
          create: (context) => BoulderMarkerRepository(httpClient: httpClient),
        ),
        RepositoryProvider<DepartmentRepository>(
          create: (context) => DepartmentRepository(httpClient: httpClient),
        ),
        RepositoryProvider<GradeRepository>(
          create: (context) => GradeRepository(httpClient: httpClient),
        ),
        RepositoryProvider<MunicipalityRepository>(
          create: (context) => MunicipalityRepository(httpClient: httpClient),
        ),
        RepositoryProvider<ApiClient>(create: (context) => httpClient),
        RepositoryProvider<DownloadedBoulderRepository>(
          create: (context) => DownloadedBoulderRepository(
            httpClient: httpClient,
            database: localDatabase,
          ),
        ),
      ],
      child: Consumer(
        builder: (context, ref, _) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<BoulderFilterBloc>(
                create: (BuildContext context) => boulderFilterBloc,
              ),
              BlocProvider<BoulderOrderBloc>(
                create: (BuildContext context) => boulderOrderBloc,
              ),
              BlocProvider<BoulderFilterGradeBloc>(
                create: (BuildContext context) => boulderFilterGradeBloc,
              ),
            ],
            child: Builder(
              builder: (context) {
                final router = ref.watch(routerProvider);
                return MaterialApp.router(
                  routeInformationProvider: router.routeInformationProvider,
                  routeInformationParser: router.routeInformationParser,
                  routerDelegate: router.routerDelegate,
                  theme: ThemeData(
                    useMaterial3: true,
                    colorSchemeSeed: Colors.pink,
                  ),
                  debugShowCheckedModeBanner: false,
                  localizationsDelegates:
                      AppLocalizations.localizationsDelegates,
                  supportedLocales: AppLocalizations.supportedLocales,
                  locale: ref.watch(myLocaleProvider),
                  builder: (context, child) =>
                      WidgetConfig(child: child ?? const SizedBox.shrink()),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
