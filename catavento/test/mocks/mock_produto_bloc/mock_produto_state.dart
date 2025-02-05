part of 'mock_produto_bloc.dart';

sealed class ProdutoState extends Equatable {
  final DatabaseResponse databaseResponse;
  final Map<String, int> metaData;

  const ProdutoState(this.databaseResponse, this.metaData);
}

class ProdutoCreateState extends ProdutoState {
  const ProdutoCreateState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class ProdutoDeleteState extends ProdutoState {
  const ProdutoDeleteState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class ProdutoUpdateState extends ProdutoState {
  const ProdutoUpdateState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class ProdutoLoadingState extends ProdutoState {
  const ProdutoLoadingState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class ProdutoFilterState extends ProdutoState {
  const ProdutoFilterState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class ProdutoErrorState extends ProdutoState {
  final String message;

  const ProdutoErrorState(super.databaseResponse, super.metaData, this.message);

  @override
  List<Object?> get props => [databaseResponse, metaData, message];
}
