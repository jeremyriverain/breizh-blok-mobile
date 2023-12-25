import 'package:equatable/equatable.dart';

const kGradeOrderParam = 'order[grade.name]';
const kIdOrderParam = 'order[id]';

const kAscendantDirection = 'asc';
const kDescendantDirection = 'desc';

class OrderParam extends Equatable {
  const OrderParam({required this.name, required this.direction});

  final String name;
  final String direction;

  @override
  List<Object?> get props => [name, direction];
}
