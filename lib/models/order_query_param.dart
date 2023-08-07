import 'package:equatable/equatable.dart';

class OrderQueryParam extends Equatable {
  final String name;
  final String direction;

  const OrderQueryParam({required this.name, required this.direction});

  @override
  List<Object?> get props => [name, direction];
}
