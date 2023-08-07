import 'package:breizh_blok_mobile/models/boulder_area.dart';
import 'package:breizh_blok_mobile/models/grade.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BoulderFilterBloc extends Bloc<BoulderFilterEvent, BoulderFilterState> {
  BoulderFilterBloc(BoulderFilterState initialState) : super(initialState) {
    on<BoulderFilterSearched>(
      (event, emit) {
        emit(state.copyWith(term: event.term));
      },
    );

    on<BoulderFilterLocation>(
      (event, emit) {
        emit(state.copyWith(boulderAreas: event.boulderAreas));
      },
    );

    on<BoulderFilterGrade>(
      (event, emit) {
        emit(state.copyWith(grades: event.grades));
      },
    );
  }
}

abstract class BoulderFilterEvent {}

class BoulderFilterSearched extends BoulderFilterEvent {
  final String? term;

  BoulderFilterSearched(this.term);
}

class BoulderFilterLocation extends BoulderFilterEvent {
  final Set<BoulderArea> boulderAreas;

  BoulderFilterLocation(this.boulderAreas);
}

class BoulderFilterGrade extends BoulderFilterEvent {
  final Set<Grade> grades;

  BoulderFilterGrade(this.grades);
}

class BoulderFilterState extends Equatable {
  final String? term;
  final Set<BoulderArea> boulderAreas;
  final Set<Grade> grades;

  BoulderFilterState({
    this.term,
    Set<BoulderArea>? boulderAreas,
    Set<Grade>? grades,
  })  : boulderAreas = boulderAreas ?? <BoulderArea>{},
        grades = grades ?? <Grade>{};

  @override
  List<Object?> get props => [term, boulderAreas, grades];

  BoulderFilterState copyWith({
    String? term,
    Set<BoulderArea>? boulderAreas,
    Set<Grade>? grades,
  }) {
    return BoulderFilterState(
      term: term ?? this.term,
      boulderAreas: boulderAreas ?? this.boulderAreas,
      grades: grades ?? this.grades,
    );
  }
}
