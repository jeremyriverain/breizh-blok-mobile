import 'package:equatable/equatable.dart';

class Response<T> extends Equatable {
  const Response({
    this.data,
    this.error,
  });
  final T? data;
  final Object? error;

  @override
  List<Object?> get props => [data, error];
}
