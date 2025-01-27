part of 'trabalho_bloc.dart';

sealed class TrabalhoEvent {
  const TrabalhoEvent();
}

class TrabalhoGet extends TrabalhoEvent {
  final String email;
  final String setor;

  const TrabalhoGet({required this.email, required this.setor});
}

class TrabalhoInit extends TrabalhoEvent {
  final String email;
  final String setor;

  const TrabalhoInit({required this.email, required this.setor});
}

class TrabalhoFinish extends TrabalhoEvent {
  final String email;
  final String setor;

  const TrabalhoFinish({required this.email, required this.setor});
}

class TrabalhoLoading extends TrabalhoEvent {
  final String email;
  final String setor;

  const TrabalhoLoading({required this.email, required this.setor});
}
