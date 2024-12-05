part of "demanda_bloc.dart";

sealed class DemandaState {
  final DatabaseResponse databaseResponse;

  const DemandaState(this.databaseResponse);
}

class CreateState extends DemandaState {
  CreateState(super.databaseResponse);
}

class DeleteState extends DemandaState {
  DeleteState(super.databaseResponse);
}

class LoadingState extends DemandaState {
  LoadingState(super.databaseResponse);
}

class FilterState extends DemandaState {
  FilterState(super.databaseResponse);
}
