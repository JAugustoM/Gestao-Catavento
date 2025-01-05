part of 'trabalho_bloc.dart';

sealed class TrabalhoState {
  final DatabaseResponse databaseResponse;
  final Map<String, int> metaData;

  const TrabalhoState(this.databaseResponse, this.metaData);
}

class TrabalhoInitState extends TrabalhoState {
  TrabalhoInitState(super.databaseResponse, super.metaData);
}

class TrabalhoFinishState extends TrabalhoState {
  TrabalhoFinishState(super.databaseResponse, super.metaData);
}

class TrabalhoLoadingState extends TrabalhoState {
  TrabalhoLoadingState(super.databaseResponse, super.metaData);
}
