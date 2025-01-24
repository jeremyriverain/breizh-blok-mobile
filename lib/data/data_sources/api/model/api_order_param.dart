import 'package:equatable/equatable.dart';

const kGradeOrderParam = 'order[grade.name]';
const kIdOrderParam = 'order[id]';

const kAscendantDirection = 'asc';
const kDescendantDirection = 'desc';

class ApiOrderParam extends Equatable {
  const ApiOrderParam({required this.name, required this.direction});

  final String name;
  final String direction;

  @override
  List<Object?> get props => [name, direction];
}
