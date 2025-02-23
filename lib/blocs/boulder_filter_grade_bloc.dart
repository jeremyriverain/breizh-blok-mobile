import 'package:breizh_blok_mobile/domain/models/grade/grade.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boulder_filter_grade_bloc.freezed.dart';

class BoulderFilterGradeBloc
    extends Bloc<BoulderFilterGradeEvent, BoulderFilterGradeState> {
  BoulderFilterGradeBloc(super.initialState) {
    on<BoulderFilterGradeEvent>(
      (event, emit) => emit(BoulderFilterGradeState(grades: event.grades)),
    );
  }
}

class BoulderFilterGradeEvent {
  BoulderFilterGradeEvent(this.grades);

  final Set<Grade> grades;
}

@freezed
abstract class BoulderFilterGradeState with _$BoulderFilterGradeState {
  const factory BoulderFilterGradeState({
    @Default(<Grade>{}) Set<Grade> grades,
  }) = _BoulderFilterGradeState;
}
