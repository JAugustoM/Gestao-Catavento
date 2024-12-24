part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginEmailAddressChanged extends LoginEvent {}

class LoginPasswordChanged extends LoginEvent {}

class LoginButtonPressed extends LoginEvent {}



