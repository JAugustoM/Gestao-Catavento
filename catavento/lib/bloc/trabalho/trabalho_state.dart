part of 'trabalho_bloc.dart';

sealed class TrabalhoState extends Equatable {
  final DatabaseResponse trabalho;
  final DatabaseResponse demandas;
  final Map<String, int> metaData;

  const TrabalhoState(
    this.trabalho,
    this.demandas,
    this.metaData,
  );
}

class TrabalhoGetState extends TrabalhoState {
  const TrabalhoGetState(
    super.trabalho,
    super.demandas,
    super.metaData,
  );

  @override
  List<Object?> get props => [demandas, metaData];
}

class TrabalhoInitState extends TrabalhoState {
  const TrabalhoInitState(
    super.trabalho,
    super.demandas,
    super.metaData,
  );

  @override
  List<Object?> get props => [demandas, metaData];
}

class TrabalhoFinishState extends TrabalhoState {
  const TrabalhoFinishState(
    super.trabalho,
    super.demandas,
    super.metaData,
  );

  @override
  List<Object?> get props => [demandas, metaData];
}

class TrabalhoLoadingState extends TrabalhoState {
  const TrabalhoLoadingState(
    super.trabalho,
    super.demandas,
    super.metaData,
  );

  @override
  List<Object?> get props => [demandas, metaData];
}

class TrabalhoAdminState extends TrabalhoState {
  final DatabaseResponse funcionarios;
  const TrabalhoAdminState(
    super.trabalho,
    super.demandas,
    this.funcionarios,
    super.metaData,
  );

  @override
  List<Object?> get props => [demandas, metaData];
}

class TrabalhoEmptyState extends TrabalhoState {
  const TrabalhoEmptyState(
    super.trabalho,
    super.demandas,
    super.metaData,
  );

  @override
  List<Object?> get props => [demandas, metaData];
}

class TrabalhoErrorState extends TrabalhoState {
  final String message;

  const TrabalhoErrorState(
    super.trabalho,
    super.demandas,
    super.metaData,
    this.message,
  );

  @override
  List<Object?> get props => [demandas, metaData, message];
}
