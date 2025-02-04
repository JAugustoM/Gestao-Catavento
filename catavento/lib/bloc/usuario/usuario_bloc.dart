import 'package:catavento/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'usuario_event.dart';
part 'usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final _supabase = Supabase.instance.client;
  DatabaseResponse _currentData = [];
  UsuarioEvent get initialState => UsuarioLoading();

  UsuarioBloc() : super(UsuarioLoadingState([], {})) {
    on<UsuarioLoading>(_onLoading);

    on<UsuarioCreate>(_onCreate);

    on<UsuarioDelete>(_onDelete);

    on<UsuarioUpdate>(_onUpdate);
  }

  void _onCreate(UsuarioCreate event, Emitter<UsuarioState> emit) async {
    final usuario = {
      'nome': event.nome,
      'usuario': event.usuario,
      'email': event.email,
      'setor': event.setor,
      'tipo': event.tipo
    };

    if (usuario['email'] != null && usuario['email']!.isNotEmpty) {
      try {
        final user = _supabase.auth.currentUser;
        final userData = await _supabase
            .from('usuarios')
            .select('tipo')
            .eq('email', user!.email!);
        final userTipo = userData.first['tipo'] as String;

        if (userTipo != 'admin' && event.tipo == 'gerente') {
          final metaData = _countUsuarios();
          emit(UsuarioErrorState(_currentData, metaData,
              'Apenas o admin pode cadastrar gerentes'));
        }

        final authResponse = await _supabase.auth.signUp(
          email: event.email,
          password: event.senha,
        );
        if (authResponse.user != null) {
          final response =
              await _supabase.from('usuarios').insert(usuario).select();
          if (response.isNotEmpty) {
            _currentData.add(response[0]);
          } else {
            final metaData = _countUsuarios();
            emit(UsuarioErrorState(
              _currentData,
              metaData,
              "Erro ao criar usuário",
            ));
          }
        }

        final metaData = _countUsuarios();

        emit(UsuarioCreateState(_currentData, metaData));
      } catch (e) {
        final metaData = _countUsuarios();
        emit(UsuarioErrorState(
          _currentData,
          metaData,
          "Erro ao criar novo usuário - $e",
        ));
      }
    }
  }

  void _onDelete(UsuarioDelete event, Emitter<UsuarioState> emit) async {
    try {
      final response = await _supabase
          .from('usuarios')
          .delete()
          .eq('email', event.email)
          .select();
      if (response.isNotEmpty) {
        _currentData.removeAt(event.order);
      }

      final metaData = _countUsuarios();

      emit(UsuarioDeleteState(_currentData, metaData));
    } catch (e) {
      final metaData = _countUsuarios();
      emit(UsuarioErrorState(
        _currentData,
        metaData,
        "Erro ao remover usuário - $e",
      ));
    }
  }

  void _onUpdate(UsuarioUpdate event, Emitter<UsuarioState> emit) async {
    try {
      final nome = event.nome;
      final usuario = event.usuario;
      final tipo = event.tipo;
      final setor = event.setor;
      final email = event.email;
      final id = event.id;

      try {
        final user = _supabase.auth.currentUser;
        final userData = await _supabase
            .from('usuarios')
            .select('tipo')
            .eq('email', user!.email!);
        final userTipo = userData.first['tipo'] as String;

        if (userTipo != 'admin' && tipo == 'gerente') {
          final metaData = _countUsuarios();
          emit(UsuarioErrorState(_currentData, metaData,
              'Apenas o admin pode cadastrar gerentes'));
        }
      } catch (e) {
        final metaData = _countUsuarios();
        emit(UsuarioErrorState(
            _currentData, metaData, 'Erro ao acessar o banco de dados - $e'));
      }

      Map<String, dynamic> atualizado = {};

      if (nome.isNotEmpty) {
        atualizado['nome'] = nome;
      }

      if (usuario.isNotEmpty) {
        atualizado['usuario'] = usuario;
      }

      if (tipo.isNotEmpty) {
        atualizado['tipo'] = tipo;
      }

      if (setor.isNotEmpty) {
        atualizado['setor'] = setor;
      }

      if (email.isNotEmpty) {
        atualizado['email'] = email;
      }

      if (atualizado.isNotEmpty) {
        await _supabase
            .from('usuarios')
            .update(atualizado)
            .eq('email', event.email);
      }

      // verificar se pode usar o id

      for (var key in atualizado.keys) {
        _currentData[id][key] = atualizado[key];
      }

      final metaData = _countUsuarios();

      emit(UsuarioUpdateState(_currentData, metaData));
    } catch (e) {
      final metaData = _countUsuarios();
      emit(UsuarioErrorState(
        _currentData,
        metaData,
        "Erro ao atualizar usuário - $e",
      ));
    }
  }

  void _onLoading(UsuarioLoading event, Emitter<UsuarioState> emit) async {
    try {
      final response =
          await _supabase.from('usuarios').select().neq('tipo', 'admin');
      _currentData = response;

      final metaData = _countUsuarios();

      emit(UsuarioLoadingState(_currentData, metaData));
    } catch (e) {
      final metaData = _countUsuarios();
      emit(UsuarioErrorState(
        _currentData,
        metaData,
        "Erro ao acessar o banco de dados - $e",
      ));
    }
  }

  Map<String, int> _countUsuarios() {
    int numUsuarios = 0;

    for (var usuario in _currentData) {
      if (usuario["tipo"] != "admin") {
        numUsuarios++;
      }
    }
    final metaData = {"total": numUsuarios};
    return metaData;
  }

  Map<String, dynamic>? getUser(String email) {
    Map<String, dynamic>? user;
    int id = 0;

    for (var data in _currentData) {
      if (data['email'] == email) {
        user = data;
        break;
      }
      id++;
    }

    if (user != null) {
      user['id'] = id;
    }

    return user;
  }

  DatabaseResponse getUsers(String setor) {
    final users = _currentData.where((test) => test['setor'] == setor);
    return users.toList();
  }
}
