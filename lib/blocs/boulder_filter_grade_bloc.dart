import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderFilterGradeBloc
    extends Bloc<BoulderFilterGradeEvent, BoulderFilterGradeState> {
  BoulderFilterGradeBloc(BoulderFilterGradeState initialState)
      : super(initialState) {
    on<BoulderFilterGradeEvent>(
      (event, emit) => emit(BoulderFilterGradeState(grades: event.grades)),
    );
  }
}

class BoulderFilterGradeEvent {
  final Set<Grade> grades;

  BoulderFilterGradeEvent(this.grades);
}

class BoulderFilterGradeState extends Equatable {
  final Set<Grade> grades;

  BoulderFilterGradeState({Set<Grade>? grades}) : grades = grades ?? <Grade>{};

  @override
  List<Object?> get props => [grades];
}
