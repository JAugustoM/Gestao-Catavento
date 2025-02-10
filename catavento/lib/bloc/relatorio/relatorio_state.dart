part of 'relatorio_bloc.dart';

class RelatorioState extends Equatable {
  final Map<String, DatabaseResponse> funcionariosDiario;
  final Map<String, DatabaseResponse> funcionariosSemanal;
  final Map<String, DatabaseResponse> funcionariosMensal;
  final DatabaseResponse loja;
  final DatabaseResponse dadosGerais;

  const RelatorioState(
    this.funcionariosDiario,
    this.funcionariosSemanal,
    this.funcionariosMensal,
    this.loja,
    this.dadosGerais,
  );

  @override
  List<Object?> get props => [funcionariosDiario, loja, dadosGerais];
}

class RelatorioCompleteState extends RelatorioState {
  const RelatorioCompleteState(
    super.funcionariosDiario,
    super.funcionariosSemanal,
    super.funcionariosMensal,
    super.loja,
    super.dadosGerais,
  );
}

class RelatorioErrorState extends RelatorioState {
  final String message;

  const RelatorioErrorState(
    super.funcionariosDiario,
    super.funcionariosSemanal,
    super.funcionariosMensal,
    super.loja,
    super.dadosGerais,
    this.message,
  );

  @override
  List<Object?> get props => [message];
}
