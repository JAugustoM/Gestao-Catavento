part of 'auth_bloc.dart';

sealed class AuthState {}

class AuthSignInState extends AuthState {
  final Map<String, dynamic> userData;

  AuthSignInState(this.userData);
}

class AuthLoadingState extends AuthState {
  final String? email;

  AuthLoadingState(this.email);
}

class AuthFailState extends AuthState {}

class AuthSignOutState extends AuthState {}

class AuthCreateUserState extends AuthState {}

class AuthErrorState extends AuthState {
  final String message;

  AuthErrorState(this.message);
}
