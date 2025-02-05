part of 'mock_produto_bloc.dart';

sealed class ProdutoEvent {
  const ProdutoEvent();
}

class ProdutoFilter extends ProdutoEvent {
  final String column;
  final String value;

  const ProdutoFilter(this.column, this.value);
}

class ProdutoCreate extends ProdutoEvent {
  final String nomeProduto;
  final String codigo;
  final String descricaoPadrao;
  final File? imagemProduto;

  const ProdutoCreate({
    required this.nomeProduto,
    required this.codigo,
    required this.descricaoPadrao,
    required this.imagemProduto,
  });
}

class ProdutoDelete extends ProdutoEvent {
  final String id;

  const ProdutoDelete(
    this.id,
  );
}

class ProdutoUpdate extends ProdutoEvent {
  final String nomeProduto;
  final String codigo;
  final String descricaoProduto;
  final File? imagemProduto;

  const ProdutoUpdate({
    required this.nomeProduto,
    required this.codigo,
    required this.descricaoProduto,
    required this.imagemProduto,
  });
}

class ProdutoLoading extends ProdutoEvent {}
