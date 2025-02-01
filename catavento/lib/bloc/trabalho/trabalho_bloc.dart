import 'package:catavento/constants.dart';
import 'package:catavento/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'trabalho_event.dart';
part 'trabalho_state.dart';

class TrabalhoBloc extends Bloc<TrabalhoEvent, TrabalhoState> {
  final _supabase = Supabase.instance.client;
  DatabaseResponse _currentData = [];
  final DatabaseResponse _demandas = [];

  TrabalhoEvent get initialState => TrabalhoLoading(email: '', setor: '');

  TrabalhoBloc() : super(TrabalhoLoadingState([], [], {})) {
    on<TrabalhoLoading>(_onLoading);

    on<TrabalhoGet>(_onGet);

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
          final metaData = await _countTrabalho(event.setor, event.email);
          emit(TrabalhoLoadingState(
            _currentData,
            _demandas,
            metaData,
          ));
        } else {
          await _iniciarTrabalho(event.email, event.setor);
          final metaData = await _countTrabalho(event.setor, event.email);
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
        final metaData = await _countTrabalho(event.setor, event.email);
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

  void _onGet(TrabalhoGet event, Emitter<TrabalhoState> emit) async {
    late final DatabaseResponse response;
    if (event.setor.toLowerCase() == "montagem") {
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
          .eq('status', "Pendente")
          .order('data_adicao', ascending: true)
          .order('status_aplique')
          .order('status_cobertura');
    }

    if (response.isNotEmpty) {
      final demanda = response.first;
      final trabalho = {
        'demanda_id': demanda['id'],
        'usuario_email': event.email,
      };

      try {
        await _supabase.from('trabalho').insert(trabalho);
        _currentData.add(trabalho);
        _demandas.add(demanda);
        final metaData = await _countTrabalho(event.setor, event.email);
        emit(TrabalhoGetState(
          _currentData,
          _demandas,
          metaData,
        ));
      } on PostgrestException catch (e) {
        final metaData = await _countTrabalho(event.setor, event.email);
        if (e.code != "23505") {
          emit(TrabalhoErrorState(
            _currentData,
            _demandas,
            metaData,
            "Erro ao importar bolo do banco de dados - $e",
          ));
        }
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

  void _onInit(TrabalhoInit event, Emitter<TrabalhoState> emit) async {
    final trabalho = _currentData.first;
    final demanda = _demandas.first;

    final data = DateFormat(timeFormat).format(DateTime.now());
    trabalho['data_inicio'] = data;
    demanda['status_${event.setor}'] = 1;
    demanda['status'] = "Em fabricação";

    try {
      await _supabase.from('trabalho').update({
        'data_inicio': data,
      }).eq('demanda_id', trabalho['demanda_id']);
      await _supabase.from('demandas').update({
        'status_${event.setor}': 1,
        'status': "Em fabricação",
      }).eq('id', demanda['id']);
      _currentData.first = trabalho;
      _demandas.first = demanda;
      final metaData = await _countTrabalho(event.setor, event.email);
      emit(TrabalhoInitState(
        _currentData,
        _demandas,
        metaData,
      ));
    } catch (e) {
      final metaData = await _countTrabalho(event.setor, event.email);
      emit(TrabalhoErrorState(
        _currentData,
        _demandas,
        metaData,
        "Erro ao começar trabalho - $e",
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

      final metaData = await _countTrabalho(event.setor, event.email);

      emit(TrabalhoFinishState(_currentData, _demandas, metaData));
    } catch (e) {
      final metaData = await _countTrabalho(event.setor, event.email);
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
      final trabalho = {
        'demanda_id': demanda['id'],
        'usuario_email': email,
      };

      await _supabase.from('trabalho').insert(trabalho);
      _currentData.add(trabalho);
      _demandas.add(demanda);
    }
  }

  Future<Map<String, int>> _countTrabalho(String setor, String email) async {
    var total = 0;
    var completo = 0;
    var faltam = 0;

    try {
      final trabalho = await _supabase
          .from('trabalho')
          .select()
          .eq('usuario_email', email)
          .not('data_finalizacao', 'is', null)
          .count();
      completo = trabalho.count;

      final demandas = await _supabase.from('demandas').select().count();

      total = demandas.count;
      faltam = total;

      for (var demanda in demandas.data) {
        if (demanda['status_$setor'] == 2) {
          faltam--;
        }
      }
    } catch (e) {
      print(e);
    }

    return {'total': total, 'completo': completo, 'faltam': faltam};
  }
}
