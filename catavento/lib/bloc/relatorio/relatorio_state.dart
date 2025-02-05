part of 'relatorio_bloc.dart';

class RelatorioState extends Equatable {
  final DatabaseResponse funcionarios;
  final DatabaseResponse loja;

  const RelatorioState(this.funcionarios, this.loja);

  @override
  List<Object?> get props => [funcionarios, loja];
}

class RelatorioCompleteState extends RelatorioState {
  const RelatorioCompleteState(super.funcionarios, super.loja);
}

class RelatorioErrorState extends RelatorioState {
  final String message;

  const RelatorioErrorState(super.funcionarios, super.loja, this.message);

  @override
  List<Object?> get props => [super.funcionarios, super.loja, message];
}
