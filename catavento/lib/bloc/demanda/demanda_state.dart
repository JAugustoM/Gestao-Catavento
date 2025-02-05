part of "demanda_bloc.dart";

sealed class DemandaState extends Equatable {
  final DatabaseResponse databaseResponse;
  final Map<String, int> metaData;

  const DemandaState(this.databaseResponse, this.metaData);
}

class DemandaCreateState extends DemandaState {
  const DemandaCreateState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class DemandaDeleteState extends DemandaState {
  const DemandaDeleteState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class DemandaUpdateState extends DemandaState {
  const DemandaUpdateState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class DemandaLoadingState extends DemandaState {
  const DemandaLoadingState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class DemandaFilterState extends DemandaState {
  const DemandaFilterState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class DemandaErrorState extends DemandaState {
  final String message;

  const DemandaErrorState(super.databaseResponse, super.metaData, this.message);

  @override
  List<Object?> get props => [databaseResponse, metaData, message];
}
