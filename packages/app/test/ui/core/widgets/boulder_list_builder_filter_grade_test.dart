import 'package:breizh_blok_mobile/domain/entities/grade/grade.dart';
import 'package:breizh_blok_mobile/domain/repositories/grade_repository.dart';
import 'package:breizh_blok_mobile/service_locator/repositories.dart';
import 'package:breizh_blok_mobile/ui/boulder/view_models/boulder_filter_grade_bloc.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/boulder_list_builder_filter_grade.dart';
import 'package:breizh_blok_mobile/ui/core/widgets/my_range_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fpdart/fpdart.dart';
import 'package:mocktail/mocktail.dart';

import '../../../mocks.dart';
import '../../../test_utils.dart';
import '../../../widget_test_utils.dart';

void main() {
  group('BoulderListBuilderFilterGrade', () {
    late GradeRepository repository;
    late BoulderFilterGradeBloc bloc;

    setUp(() {
      repository = MockGradeRepository();
      bloc = BoulderFilterGradeBloc(
        const BoulderFilterGradeState(),
      );
    });
    testWidgets(
      'Given there is at least 2 grades in the local DB '
      'Then it displays MyRangeSlider',
      (tester) async {
        when(
          () => repository.watchAll,
        ).thenAnswer((_) => Stream.value([fakeGrade6a, fakeGrade6b]));

        when(
          () => repository.findAll(),
        ).thenAnswer((_) => TaskEither.right(null));
        await tester.myPumpWidget(
          overrides: [
            gradeRepositoryProvider.overrideWith((_) => repository),
          ],
          widget: BlocProvider(
            create: (context) => bloc,
            child: Builder(
              builder: (context) {
                return const BoulderListBuilderFilterGrade();
              },
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(MyRangeSlider<Grade>), findsOneWidget);
        expect(
          find.textContaining(fakeGrade6a.name, findRichText: true),
          findsOneWidget,
        );
        expect(
          find.textContaining(fakeGrade6b.name, findRichText: true),
          findsOneWidget,
        );

        verify(
          () => repository.watchAll,
        ).called(1);

        verify(
          () => repository.findAll(),
        ).called(1);

        verifyNoMoreInteractions(repository);
      },
    );

    testWidgets(
      'Given there is less than 2 grades in the local DB '
      'Then it does not display MyRangeSlider',
      (tester) async {
        when(
          () => repository.watchAll,
        ).thenAnswer((_) => Stream.value([fakeGrade6a]));

        when(
          () => repository.findAll(),
        ).thenAnswer((_) => TaskEither.right(null));
        await tester.myPumpWidget(
          overrides: [
            gradeRepositoryProvider.overrideWith((_) => repository),
          ],
          widget: BlocProvider(
            create: (context) => bloc,
            child: Builder(
              builder: (context) {
                return const BoulderListBuilderFilterGrade();
              },
            ),
          ),
        );

        await tester.pump();

        expect(find.byType(MyRangeSlider<Grade>), findsNothing);

        verify(
          () => repository.watchAll,
        ).called(1);

        verify(
          () => repository.findAll(),
        ).called(1);

        verifyNoMoreInteractions(repository);
      },
    );

    testWidgets(
      'Given there is at least 2 grades in the local DB '
      'And I change the selection of grade '
      'Then the bloc is notified',
      (tester) async {
        const grades = [
          Grade(iri: '/grades/1', name: '5'),
          Grade(iri: '/grades/2', name: '6a'),
          Grade(iri: '/grades/3', name: '6b'),
          Grade(iri: '/grades/4', name: '6c'),
          Grade(iri: '/grades/4', name: '7a'),
        ];
        when(
          () => repository.watchAll,
        ).thenAnswer((_) => Stream.value(grades));

        when(
          () => repository.findAll(),
        ).thenAnswer((_) => TaskEither.right(null));

        expect(bloc.state.grades.length, equals(0));

        await tester.myPumpWidget(
          overrides: [
            gradeRepositoryProvider.overrideWith((_) => repository),
          ],
          widget: BlocProvider(
            create: (context) => bloc,
            child: Builder(
              builder: (context) {
                return const BoulderListBuilderFilterGrade();
              },
            ),
          ),
        );

        await tester.pump();

        verify(
          () => repository.watchAll,
        ).called(1);

        verify(
          () => repository.findAll(),
        ).called(1);

        verifyNoMoreInteractions(repository);

        final leftTarget = tester
            .getTopLeft(find.byType(RangeSlider))
            .translate(20, 16);
        final rightTarget = tester
            .getTopRight(find.byType(RangeSlider))
            .translate(-20, 16);

        final middleOffset = Offset((leftTarget.dx + rightTarget.dx) / 2, 0);

        await tester.dragFrom(rightTarget, -middleOffset);
        await tester.pumpAndSettle();

        expect(
          bloc.state.grades,
          equals({
            const Grade(iri: '/grades/1', name: '5'),
            const Grade(iri: '/grades/2', name: '6a'),
            const Grade(iri: '/grades/3', name: '6b'),
          }),
        );

        await tester.dragFrom(
          rightTarget - middleOffset,
          middleOffset + const Offset(1, 0),
        );

        expect(bloc.state.grades, equals(<Grade>{}));
      },
    );
  });
}
