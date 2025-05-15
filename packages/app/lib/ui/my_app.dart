import 'package:breizh_blok_mobile/data/data_sources/api/api_client.dart';
import 'package:breizh_blok_mobile/data/data_sources/api/model/api_order_param.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/app_database.dart';
import 'package:breizh_blok_mobile/data/data_sources/local/model/image_boulder_cache.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder/boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/boulder_area/boulder_area_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/department/department_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/downloaded_boulder_repository/downloaded_boulder_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/grade/grade_repository.dart';
import 'package:breizh_blok_mobile/data/repositories/municipality/municipality_repository.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/services/share_content/share_content_service_interface.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_order_bloc.dart';
import 'package:breizh_blok_mobile/ui/locale/view_models/locale_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localDatabase = GetIt.I<AppDatabase>();
    final httpClient = ApiClient(database: localDatabase);

    final imageBoulderCache = ImageBoulderCache();

    final boulderFilterBloc = BoulderFilterBloc(const BoulderFilterState());

    final boulderOrderBloc = BoulderOrderBloc(
      const ApiOrderParam(direction: kDescendantDirection, name: kIdOrderParam),
    );

    final boulderFilterGradeBloc = BoulderFilterGradeBloc(
      const BoulderFilterGradeState(),
    );

    final router = GetIt.I<GoRouter>();

    return SentryWidget(
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<BoulderAreaRepository>(
            create: (context) => BoulderAreaRepository(httpClient: httpClient),
          ),
          RepositoryProvider<BoulderRepository>(
            create: (context) => BoulderRepository(httpClient: httpClient),
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
          RepositoryProvider<AppDatabase>(create: (context) => localDatabase),
          RepositoryProvider<ApiClient>(create: (context) => httpClient),
          RepositoryProvider<ImageBoulderCache>(
            create: (context) => imageBoulderCache,
          ),
          RepositoryProvider<ShareContentServiceInterface>(
            create: (context) => GetIt.I<ShareContentServiceInterface>(),
          ),
          RepositoryProvider<DownloadedBoulderRepository>(
            create:
                (context) => DownloadedBoulderRepository(
                  httpClient: httpClient,
                  database: localDatabase,
                ),
          ),
        ],
        child: MultiBlocProvider(
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
            BlocProvider<LocaleViewModel>(
              create: (context) => GetIt.I<LocaleViewModel>(),
            ),
          ],
          child: Builder(
            builder: (context) {
              return MaterialApp.router(
                routeInformationProvider: router.routeInformationProvider,
                routeInformationParser: router.routeInformationParser,
                routerDelegate: router.routerDelegate,
                theme: ThemeData(
                  useMaterial3: true,
                  colorSchemeSeed: Colors.lightBlue,
                ),
                debugShowCheckedModeBanner: false,
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: context.watch<LocaleViewModel>().state.locale,
              );
            },
          ),
        ),
      ),
    );
  }
}
