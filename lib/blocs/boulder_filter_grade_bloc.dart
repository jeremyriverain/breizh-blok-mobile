import 'package:breizh_blok_mobile/domain/models/grade.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

class BoulderFilterGradeState extends Equatable {
  BoulderFilterGradeState({Set<Grade>? grades}) : grades = grades ?? <Grade>{};

  final Set<Grade> grades;

  @override
  List<Object?> get props => [grades];
}
