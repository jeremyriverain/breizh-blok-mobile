import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/repositories/grade_repository.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_filter_grade.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('BoulderListBuilderFilterGrade', () {
    late GradeRepository repository;

    setUp(() {
      repository = MockGradeRepository();
    });
    testWidgets(
      'Given there is at least 2 grades in the local DB '
      'Then it displays MyRangeSlider',
      (tester) async {
        when(
          () => repository.watchAll,
        ).thenAnswer((_) => Stream.value([fakeGrade6a, fakeGrade6b]));
        await tester.myPumpWidget(
          overrides: [
            gradeRepositoryProvider.overrideWith((_) => repository),
          ],
          widget: BlocProvider(
            create: (context) => BoulderFilterGradeBloc(
              const BoulderFilterGradeState(),
            ),
            child: Builder(
              builder: (context) {
                return const BoulderListBuilderFilterGrade();
              },
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(MyRangeSlider<Grade>), findsOneWidget);
      },
    );

    testWidgets(
      'Given there is less than 2 grades in the local DB '
      'Then it does not display MyRangeSlider',
      (tester) async {
        when(
          () => repository.watchAll,
        ).thenAnswer((_) => Stream.value([fakeGrade6a]));
        await tester.myPumpWidget(
          overrides: [
            gradeRepositoryProvider.overrideWith((_) => repository),
          ],
          widget: BlocProvider(
            create: (context) => BoulderFilterGradeBloc(
              const BoulderFilterGradeState(),
            ),
            child: Builder(
              builder: (context) {
                return const BoulderListBuilderFilterGrade();
              },
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(MyRangeSlider<Grade>), findsNothing);
      },
    );
  });
}
