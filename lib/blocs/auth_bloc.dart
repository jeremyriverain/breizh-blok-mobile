import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthEvent {}

class AuthenticateEvent extends AuthEvent {
  AuthenticateEvent();
}

class AuthState extends Equatable {
  const AuthState({
    this.isAuthenticated = false,
  });

  final bool isAuthenticated;
  @override
  List<Object?> get props => [isAuthenticated];
}

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(const AuthState()) {
    on<AuthenticateEvent>(
      (event, emit) => emit(
        const AuthState(
          isAuthenticated: true,
        ),
      ),
    );
  }
}
