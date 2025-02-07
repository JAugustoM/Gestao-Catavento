// import 'dart:io';

// import 'package:catavento/bloc/demanda_bloc.dart';
// import 'package:catavento/constants.dart';
// import 'package:catavento/bloc/demanda_bloc.dart';
import 'package:catavento/typedefs.dart';
import 'package:equatable/equatable.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:http/http.dart';
// import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'mock_usuario_event.dart';
part 'mock_usuario_state.dart';

class UsuarioBloc extends Bloc<UsuarioEvent, UsuarioState> {
  final SupabaseClient supabase;
  DatabaseResponse currentData = [];
  UsuarioEvent get initialState => UsuarioLoading();

  UsuarioBloc(this.supabase) : super(UsuarioLoadingState([], {})) {
    on<UsuarioLoading>(_onLoading);

    on<UsuarioCreate>(_onCreate);

    on<UsuarioDelete>(_onDelete);

    on<UsuarioUpdate>(_onUpdate);
  }

  void _onCreate(UsuarioCreate event, Emitter<UsuarioState> emit) async {
    final Map<String, dynamic> usuario = {
      'nome': event.nome,
      'usuario': event.usuario,
      'email': event.email,
      'setor': event.setor,
      'tipo': event.tipo,
      'id': 0
    };

    if (usuario['email'] != null && usuario['email']!.isNotEmpty) {
      try {
        final response =
            await supabase.from('usuarios').insert([usuario]).select();
        if (response.isNotEmpty) {
          currentData.add(response[0]);
        } else {
          final metaData = _countUsuarios();
          emit(UsuarioErrorState(
            currentData,
            metaData,
            "Erro ao criar usuário",
          ));
        }
      } catch (e) {
        final metaData = _countUsuarios();
        emit(UsuarioErrorState(
          currentData,
          metaData,
          "Erro ao criar novo usuário - $e",
        ));
      }
    }

    final metaData = _countUsuarios();

    emit(UsuarioCreateState(currentData, metaData));
  }

  void _onDelete(UsuarioDelete event, Emitter<UsuarioState> emit) async {
    try {
      currentData.removeAt(event.order);
    } catch (e) {
      final metaData = _countUsuarios();
      emit(UsuarioErrorState(
        currentData,
        metaData,
        "Erro ao remover usuário - $e",
      ));
    }

    final metaData = _countUsuarios();

    emit(UsuarioDeleteState(currentData, metaData));
  }

  void _onUpdate(UsuarioUpdate event, Emitter<UsuarioState> emit) async {
    try {
      final nome = event.nome;
      final usuario = event.usuario;
      final tipo = event.tipo;
      final setor = event.setor;
      final email = event.email;
      final id = event.id;

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
        await supabase
            .from('usuarios')
            .update(atualizado)
            .eq('email', event.email);
      }

      // verificar se pode usar o id

      for (var key in atualizado.keys) {
        currentData[id][key] = atualizado[key];
      }

      final metaData = _countUsuarios();

      emit(UsuarioUpdateState(currentData, metaData));
    } catch (e) {
      final metaData = _countUsuarios();
      emit(UsuarioErrorState(
        currentData,
        metaData,
        "Erro ao atualizar usuário - $e",
      ));
    }
  }

  void _onLoading(UsuarioLoading event, Emitter<UsuarioState> emit) async {
    try {
      final response =
          await supabase.from('usuarios').select().neq('tipo', 'admin');
      currentData = response;

      final metaData = _countUsuarios();

      emit(UsuarioLoadingState(currentData, metaData));
    } catch (e) {
      final metaData = _countUsuarios();
      emit(UsuarioErrorState(
        currentData,
        metaData,
        "Erro ao acessar o banco de dados - $e",
      ));
    }
  }

  Map<String, int> _countUsuarios() {
    int numUsuarios = 0;

    for (var usuario in currentData) {
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

    for (var data in currentData) {
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
}
