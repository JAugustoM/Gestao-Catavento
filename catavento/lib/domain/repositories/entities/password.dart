import 'package:equatable/equatable.dart';

class Password extends Equatable {
  final String value;
  final String errorMessage;
  final bool hasError;

  const Password({
    required this.value,
    required this.errorMessage,
    required this.hasError,
  });

  factory Password.create(String value) {
    if (value.isEmpty || value.length < 6) {
      return Password(
          value: value,
          errorMessage: 'Sua senha deve ter no mínimo 6 caracteres.',
          hasError: true);
    }
    return Password(value: value, errorMessage: '', hasError: false);
  }

  @override
  List<Object?> get props => [value, errorMessage, hasError];

  static const empty = Password(value: '', errorMessage: '', hasError: false);
}
