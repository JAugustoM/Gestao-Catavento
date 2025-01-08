part of 'auth_bloc.dart';

sealed class AuthEvent {}

class AuthSignIn extends AuthEvent {
  final String email;
  final String password;

  AuthSignIn({
    required this.email,
    required this.password,
  });
}

class AuthSignOut extends AuthEvent {}

class AuthLoading extends AuthEvent {}
