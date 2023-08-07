import 'package:equatable/equatable.dart';

class Response<T> extends Equatable {
  final T? data;
  final Object? error;

  const Response({
    this.data,
    this.error,
  });

  @override
  List<Object?> get props => [data, error];
}
