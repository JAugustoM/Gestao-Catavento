part of 'relatorio_bloc.dart';

class RelatorioState extends Equatable {
  final Map<String, DatabaseResponse> funcionarios;
  final DatabaseResponse loja;
  final DatabaseResponse dadosGerais;

  const RelatorioState(this.funcionarios, this.loja, this.dadosGerais);

  @override
  List<Object?> get props => [funcionarios, loja, dadosGerais];
}

class RelatorioCompleteState extends RelatorioState {
  const RelatorioCompleteState(
      super.funcionarios, super.loja, super.dadosGerais);
}

class RelatorioErrorState extends RelatorioState {
  final String message;

  const RelatorioErrorState(
      super.funcionarios, super.loja, super.dadosGerais, this.message);

  @override
  List<Object?> get props => [message];
}
