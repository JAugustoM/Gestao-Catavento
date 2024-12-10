part of "demanda_bloc.dart";

sealed class DemandaState {
  final DatabaseResponse databaseResponse;
  final Map<String, int> metaData;

  const DemandaState(this.databaseResponse, this.metaData);
}

class CreateState extends DemandaState {
  CreateState(super.databaseResponse, super.metaData);
}

class DeleteState extends DemandaState {
  DeleteState(super.databaseResponse, super.metaData);
}

class UpdateState extends DemandaState {
  UpdateState(super.databaseResponse, super.metaData);
}

class LoadingState extends DemandaState {
  LoadingState(super.databaseResponse, super.metaData);
}

class FilterState extends DemandaState {
  FilterState(super.databaseResponse, super.metaData);
}
