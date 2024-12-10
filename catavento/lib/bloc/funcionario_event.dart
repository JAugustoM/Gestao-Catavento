sealed class FuncionarioEvent {
  const FuncionarioEvent();
}

class FuncionarioCreate extends FuncionarioEvent {
  final String nome;
  final String setor;
  final String email;
  final String usuario;
  final String senha;

  const FuncionarioCreate(
    this.nome,
    this.setor,
    this.email,
    this.usuario,
    this.senha,
  );
}
