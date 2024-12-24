import 'package:2024.2-Fehu/catavento/lib/bloc/login/metodos/EmailAdress_state.dart';
import 'package:2024.2-Fehu/catavento/lib/bloc/login/metodos/FinalPassword_state.dart';

part of 'login_bloc.dart';

enum FormSubmissionStatus {
  initial,
  submitting,
  success,
  failure,
}

class LoginState extends Equatable {
  final EmailAddress email;
  final Password password;
  final FormSubmissionStatus formSubmissionStatus;


  LoginState(
      this.email = EmailAddress.empty,
      this.password = Password.empty,
      this.formSubmissionStatus = FormSubmissionStatus.Initial,
  );

  LoginState copyWith({
      EmailAddress? email,
      Password? password,
      FormSubmissionStatus? formSubmissionStatus,
  }) => LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
  );

  @override
  List<Object?> get props => [
        email,
        password,
        formSubmissionStatus,
  ];

  bool isSubmitting() =>
    formSubmissionStatus == FormSubmissionStatus.submitting;

  bool isSubmissionSuccessOrFailure() =>
    formSubmissionStatus == FormSubmissionStatus.success ||
    formSubmissionStatus == FormSubmissionStatus.failure;

  bool get isValid => !email.hasError && !password.hasError;
}

