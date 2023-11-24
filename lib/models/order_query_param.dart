import 'package:equatable/equatable.dart';

const kGradeOrderQueryParam = 'order[grade.name]';
const kIdOrderQueryParam = 'order[id]';

const kAscendantDirection = 'asc';
const kDescendantDirection = 'desc';

class OrderQueryParam extends Equatable {
  const OrderQueryParam({required this.name, required this.direction});

  final String name;
  final String direction;

  @override
  List<Object?> get props => [name, direction];
}
