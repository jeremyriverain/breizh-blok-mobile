import 'package:equatable/equatable.dart';

class BoulderApiResponse<T> extends Equatable {
  const BoulderApiResponse({
    this.data,
    this.error,
  });
  final T? data;
  final Object? error;

  @override
  List<Object?> get props => [data, error];
}
