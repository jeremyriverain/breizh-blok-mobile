import 'package:equatable/equatable.dart';

class OrderQueryParam extends Equatable {
  const OrderQueryParam({required this.name, required this.direction});

  final String name;
  final String direction;

  @override
  List<Object?> get props => [name, direction];
}
