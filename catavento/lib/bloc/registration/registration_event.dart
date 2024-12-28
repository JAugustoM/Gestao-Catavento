part of 'registration_bloc.dart';

abstract class RegistrationEvent {}

class RegistrationRegisterButtonPressed extends RegistrationEvent {}

class RegistrationEmailAddressChanged extends RegistrationEvent {
  final String value;
  RegistrationEmailAddressChanged(this.value);
}

class RegistrationPasswordChanged extends RegistrationEvent {
  final String value;
  RegistrationPasswordChanged(this.value);
}

class RegistrationConfirmPasswordChanged extends RegistrationEvent {
  final String value;
  RegistrationConfirmPasswordChanged(this.value);
}
