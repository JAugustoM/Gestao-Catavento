sealed class FuncionarioEvent {
  const FuncionarioEvent();
}

class FuncionarioCreate extends FuncionarioEvent {
  final String nome;
  final String setor;
  final String email;
  final String tipo;

  const FuncionarioCreate(
    this.nome,
    this.setor,
    this.email,
    this.tipo,
  );
}

class FuncionarioDelete extends FuncionarioEvent {
  final int id;
  final int order;

  const FuncionarioDelete(
    this.id,
    this.order,
  );
}

class FuncionarioUpdate extends FuncionarioEvent {
  final int id;
  final String nome;
  final String setor;
  final String email;
  final String tipo;

  const FuncionarioUpdate(
    this.nome,
    this.setor,
    this.email,
    this.tipo,
    this.id,
  );
}

class FuncionarioLoading extends FuncionarioEvent {}
