part of 'trabalho_bloc.dart';

sealed class TrabalhoEvent {
  const TrabalhoEvent();
}

class TrabalhoInit extends TrabalhoEvent {
  final String email;
  final String setor;

  TrabalhoInit({required this.email, required this.setor});
}

class TrabalhoFinish extends TrabalhoEvent {
  final String email;
  final String setor;

  TrabalhoFinish({required this.email, required this.setor});
}

class TrabalhoLoading extends TrabalhoEvent {}
