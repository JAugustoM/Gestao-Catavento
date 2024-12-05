import 'dart:io';

import 'package:catavento/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'demanda_event.dart';

class DemandaBloc extends Bloc<DemandaEvent, DatabaseResponse> {
  final supabase = Supabase.instance.client;
  DatabaseResponse currentData = [];

  DemandaEvent get initialState => DemandaLoading();

  DemandaBloc() : super([]) {
    on<DemandaFilter>(_onFilter);

    on<DemandaLoading>(_onLoading);

    on<DemandaCreate>(_onCreate);

    on<DemandaDelete>(_onDelete);
  }

  void _onFilter(DemandaFilter event, Emitter<DatabaseResponse> emit) async {
    final column = event.column;
    final value = event.value;

    final response = await supabase.from('demandas').select().eq(column, value);
    currentData = response;
    emit(response);
  }

  void _onLoading(DemandaLoading event, Emitter<DatabaseResponse> emit) async {
    final response = await supabase.from('demandas').select();
    currentData = response;
    emit(currentData);
  }

  void _onCreate(DemandaCreate event, Emitter<DatabaseResponse> emit) async {
    String? fotoUrl;

    final demanda = {
      'nomeDemanda': event.nomeDemanda,
      'codigo': event.codigo,
      'descricao': event.descricao,
      'status': event.status,
    };

    if (event.foto != null) {
      try {
        final fileName = '${DateTime.now().millisecondsSinceEpoch}.jpg';
        await supabase.storage.from('imagens').upload(fileName, event.foto!);
        fotoUrl = supabase.storage.from('imagens').getPublicUrl(fileName);
      } catch (_) {
        throw Exception('Erro ao fazer upload da foto');
      }
    }

    if (fotoUrl != null) {
      demanda['imagemUrl'] = fotoUrl;
    }

    try {
      final response = await supabase.from('demandas').insert(demanda).select();
      if (response.isNotEmpty) {
        currentData.add(response[0]);
      } else {
        throw Exception("Erro ao adiciona demanda");
      }
    } catch (_) {
      throw Exception('Erro ao adicionar demanda');
    }
    await Future.delayed(Duration(microseconds: 10));
    emit(currentData);
  }

  void _onDelete(DemandaDelete event, Emitter<DatabaseResponse> emit) async {
    try {
      final response =
          await supabase.from('demandas').delete().eq('id', event.id).select();
      if (response.isNotEmpty) {
        currentData.removeAt(event.order);
      }
    } catch (e) {
      print('Erro ao buscar dados: $e');
    }
    emit(currentData);
  }
}
