import 'package:breizh_blok_mobile/domain/entities/domain_exception/domain_exception.dart';
import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/i18n/app_localizations.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'boulder_list_builder_filter_grade.g.dart';

class BoulderListBuilderFilterGrade extends StatelessWidget {
  const BoulderListBuilderFilterGrade({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          AppLocalizations.of(context).grade,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Consumer(
          builder: (context, ref, _) {
            return ref
                .watch(_allValuesProvider)
                .when(
                  data: (data) => data.length < 2
                      ? const _Loader()
                      : MyRangeSlider<Grade>(
                          allValues: data,
                          selectedValues: context
                              .watch<BoulderFilterGradeBloc>()
                              .state
                              .grades
                              .map(
                                (g) => RangeEntry(name: g.name, value: g),
                              )
                              .toSet(),
                          onChangeEnd: (selectedGrades) {
                            context.read<BoulderFilterGradeBloc>().add(
                              BoulderFilterGradeEvent(
                                selectedGrades.map((r) => r.value).toSet(),
                              ),
                            );
                          },
                        ),
                  error: (error, stackTrace) => const _ErrorBanner(),
                  loading: _Loader.new,
                );
          },
        ),
        Consumer(
          builder: (context, ref, _) {
            return ref
                .watch(_findAllGradesProvider)
                .when(
                  skipLoadingOnRefresh: false,
                  data: (data) => data.isLeft()
                      ? const _ErrorBanner()
                      : const SizedBox.shrink(),
                  error: (_, _) => const _ErrorBanner(),
                  loading: () => const SizedBox.shrink(),
                );
          },
        ),
      ],
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  const _ErrorBanner();
  @override
  Widget build(BuildContext context) {
    final errorWidget = ListTile(
      title: Text(
        AppLocalizations.of(context).anErrorOccuredWhileListingGrades,
      ),
      trailing: Consumer(
        builder: (context, ref, _) {
          return OutlinedButton(
            onPressed: () {
              ref
                ..invalidate(_findAllGradesProvider)
                ..invalidate(_allValuesProvider);
            },
            child: Text(AppLocalizations.of(context).tryAgain),
          );
        },
      ),
    );
    return Consumer(
      builder: (context, ref, _) {
        return ref
            .watch(_allValuesProvider)
            .when(
              data: (data) =>
                  data.length < 2 ? errorWidget : const SizedBox.shrink(),
              error: (_, _) => errorWidget,
              loading: () => const SizedBox.shrink(),
            );
      },
    );
  }
}

class _Loader extends StatelessWidget {
  const _Loader();
  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: CircularProgressIndicator(),
    );
  }
}

@riverpod
Stream<List<RangeEntry<Grade>>> _allValues(Ref ref) async* {
  final gradeRepository = ref.watch(gradeRepositoryProvider);

  yield* gradeRepository.watchAll.map(
    (grades) => grades.map((g) => RangeEntry(name: g.name, value: g)).toList(),
  );
}

Duration? _disableRetry(int retryCount, Object error) {
  return null;
}

@Riverpod(
  retry: _disableRetry,
)
class _FindAllGrades extends _$FindAllGrades {
  @override
  Future<Either<DomainException, void>> build() async {
    final gradeRepository = ref.watch(
      gradeRepositoryProvider,
    );

    return gradeRepository.findAll().run();
  }
}
