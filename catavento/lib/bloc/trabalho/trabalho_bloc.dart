import 'package:catavento/constants.dart';
import 'package:catavento/typedefs.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'trabalho_event.dart';
part 'trabalho_state.dart';

class TrabalhoBloc extends Bloc<TrabalhoEvent, TrabalhoState> {
  final _supabase = Supabase.instance.client;
  DatabaseResponse _currentData = [];
  DatabaseResponse _demandas = [];

  TrabalhoEvent get initialState => TrabalhoLoading(email: '', setor: '');

  TrabalhoBloc() : super(TrabalhoLoadingState([], [], {})) {
    on<TrabalhoLoading>(_onLoading);

    on<TrabalhoInit>(_onInit);

    on<TrabalhoFinish>(_onFinish);
  }

  void _onLoading(TrabalhoLoading event, Emitter<TrabalhoState> emit) async {
    if (event.email.isNotEmpty && event.setor.isNotEmpty) {
      try {
        _currentData = await _supabase
            .from('trabalho')
            .select()
            .eq('usuario_email', event.email)
            .isFilter('data_finalizacao', null);

        if (_currentData.isNotEmpty) {
          for (var demanda in _currentData) {
            var response = await _supabase
                .from('demandas')
                .select()
                .eq('id', demanda['demanda_id']);
            if (response.isNotEmpty) {
              _demandas.add(response.first);
            }
          }
          final metaData = _countTrabalho(event.setor);
          emit(TrabalhoLoadingState(
            _currentData,
            _demandas,
            metaData,
          ));
        } else {
          await _iniciarTrabalho(event.email, event.setor);
          final metaData = _countTrabalho(event.setor);
          if (_demandas.isNotEmpty) {
            emit(TrabalhoInitState(
              _currentData,
              _demandas,
              metaData,
            ));
          } else {
            emit(TrabalhoErrorState(
              _currentData,
              _demandas,
              {},
              "Nenhuma demanda disponível no momento",
            ));
          }
        }
      } catch (e) {
        final metaData = _countTrabalho(event.setor);
        emit(TrabalhoErrorState(
          _currentData,
          _demandas,
          metaData,
          "Erro ao acessar o banco de dados - $e",
        ));
      }
    } else {
      emit(TrabalhoEmptyState([], [], {}));
    }
  }

  void _onInit(TrabalhoInit event, Emitter<TrabalhoState> emit) async {
    late final DatabaseResponse response;
    if (event.setor == "montagem") {
      response = await _supabase
          .from('demandas')
          .select()
          .eq('status_${event.setor}', 0)
          .eq('status_aplique', 2)
          .eq('status_cobertura', 2)
          .order('data_adicao', ascending: true);
    } else {
      response = await _supabase
          .from('demandas')
          .select()
          .eq('status_${event.setor}', 0)
          .order('data_adicao', ascending: true)
          .order('status_aplique')
          .order('status_cobertura');
    }

    if (response.isNotEmpty) {
      final demanda = response.first;
      final data = DateFormat(timeFormat).format(DateTime.now());
      final trabalho = {
        'demanda_id': demanda['id'],
        'usuario_email': event.email,
        'data_inicio': data,
      };

      try {
        await _supabase.from('trabalho').insert(trabalho);
        await _supabase.from('demandas').update({
          'status_${event.setor}': 1,
          'status': "Em fabricação",
        }).eq('id', demanda['id']);
        _currentData.add(trabalho);
        _demandas.add(demanda);
        final metaData = _countTrabalho(event.setor);
        emit(TrabalhoInitState(
          _currentData,
          _demandas,
          metaData,
        ));
      } catch (e) {
        final metaData = _countTrabalho(event.setor);
        emit(TrabalhoErrorState(
          _currentData,
          _demandas,
          metaData,
          "Erro ao começar trabalho - $e",
        ));
      }
    } else {
      emit(TrabalhoErrorState(
        _currentData,
        _demandas,
        {},
        "Nenhuma demanda disponível no momento",
      ));
    }
  }

  void _onFinish(TrabalhoFinish event, Emitter<TrabalhoState> emit) async {
    final demanda = _demandas[0];

    final dataFinal = DateFormat(timeFormat).format(DateTime.now());

    try {
      if (event.setor == 'montagem') {
        await _supabase.from('demandas').update({
          'status_${event.setor}': 2,
          'status': "Finalizado",
        }).eq('id', demanda['id']);
      } else {
        await _supabase
            .from('demandas')
            .update({'status_${event.setor}': 2}).eq('id', demanda['id']);
      }
      _demandas.removeAt(0);

      await _supabase.from('trabalho').update(
          {'data_finalizacao': dataFinal}).eq('demanda_id', demanda['id']);
      _currentData.removeAt(0);

      final metaData = _countTrabalho(event.setor);

      emit(TrabalhoFinishState(_currentData, _demandas, metaData));
    } catch (e) {
      final metaData = _countTrabalho(event.setor);
      emit(TrabalhoErrorState(
        _currentData,
        _demandas,
        metaData,
        "Erro ao finalizar trabalho - $e",
      ));
    }
  }

  Future<void> _iniciarTrabalho(String email, String setor) async {
    late final DatabaseResponse response;
    if (setor == "montagem") {
      response = await _supabase
          .from('demandas')
          .select()
          .eq('status_$setor', 0)
          .eq('status_aplique', 2)
          .eq('status_cobertura', 2)
          .order('data_adicao', ascending: true);
    } else {
      response = await _supabase
          .from('demandas')
          .select()
          .eq('status_$setor', 0)
          .order('data_adicao', ascending: true)
          .order('status_aplique')
          .order('status_cobertura');
    }

    if (response.isNotEmpty) {
      final demanda = response.first;
      final data = DateFormat(timeFormat).format(DateTime.now());
      final trabalho = {
        'demanda_id': demanda['id'],
        'usuario_email': email,
        'data_inicio': data,
      };

      await _supabase.from('trabalho').insert(trabalho);
      await _supabase.from('demandas').update({
        'status_$setor': 1,
        'status': "Em fabricação",
      }).eq('id', demanda['id']);
      _currentData.add(trabalho);
      _demandas.add(demanda);
    }
  }

  Map<String, int> _countTrabalho(String setor) {
    var total = 0;
    var completo = 0;

    for (var trabalho in _currentData) {
      if (trabalho['status_$setor'] == 1) {
        total++;
      } else {
        completo++;
      }
    }

    return {'total': total, 'completo': completo};
  }
}
