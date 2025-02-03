part of 'mock_usuario_bloc.dart';

sealed class UsuarioState extends Equatable {
  final DatabaseResponse databaseResponse;
  final Map<String, int> metaData;

  const UsuarioState(this.databaseResponse, this.metaData);
}

class UsuarioCreateState extends UsuarioState {
  const UsuarioCreateState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class UsuarioDeleteState extends UsuarioState {
  const UsuarioDeleteState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class UsuarioUpdateState extends UsuarioState {
  const UsuarioUpdateState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class UsuarioLoadingState extends UsuarioState {
  const UsuarioLoadingState(super.databaseResponse, super.metaData);

  @override
  List<Object?> get props => [databaseResponse, metaData];
}

class UsuarioErrorState extends UsuarioState {
  final String message;

  const UsuarioErrorState(super.databaseResponse, super.metaData, this.message);

  @override
  List<Object?> get props => [databaseResponse, metaData, message];
}
