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
  String? _setor;

  TrabalhoEvent get initialState =>
      TrabalhoLoading(email: _supabase.auth.currentUser!.email!, setor: null);

  TrabalhoBloc() : super(TrabalhoLoadingState([], [], {})) {
    on<TrabalhoLoading>(_onLoading);

    on<TrabalhoInit>(_onInit);

    on<TrabalhoFinish>(_onFinish);
  }

  void _onLoading(TrabalhoLoading event, Emitter<TrabalhoState> emit) async {
    _setor = event.setor;

    _currentData = await _supabase
        .from('trabalho')
        .select()
        .eq('usuario_email', event.email);

    for (var demanda in _currentData) {
      var response = await _supabase
          .from('demandas')
          .select()
          .eq('id', demanda['demanda_id']);
      if (response.isNotEmpty) {
        _demandas.add(response.first);
      }
    }

    emit(TrabalhoLoadingState(_currentData, _demandas, {}));
  }

  void _onInit(TrabalhoInit event, Emitter<TrabalhoState> emit) async {
    _setor = event.setor;

    final response = await _supabase
        .from('demandas')
        .select()
        .eq('status_${event.setor}', 0)
        .order('data_adicao');

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
        await _supabase
            .from('demandas')
            .update({'status_${event.setor}': 1}).eq('id', demanda['id']);
        _currentData.add(trabalho);
        _demandas.add(demanda);
        emit(TrabalhoInitState(
          _currentData,
          _demandas,
          {},
        ));
      } catch (e) {
        print('Erro ao receber demanda: $e');
      }
    }
  }

  void _onFinish(TrabalhoFinish event, Emitter<TrabalhoState> emit) async {
    final demanda = _demandas.last;

    final dataFinal = DateFormat(timeFormat).format(DateTime.now());

    try {
      await _supabase
          .from('demandas')
          .update({'status_${event.setor}': 2}).eq('id', demanda['id']);
      _demandas.last['status_${event.setor}'] = 2;

      await _supabase.from('trabalho').update(
          {'data_finalizacao': dataFinal}).eq('demanda_id', demanda['id']);
      _currentData.last['data_finalizacao'] = dataFinal;

      emit(TrabalhoFinishState(_currentData, _demandas, {}));
    } catch (e) {
      print("Erro ao finalizar o trabalho");
    }
  }

  Map<String, int>? _countTrabalho() {
    if (_setor != null) {
      var total = 0;
      var completo = 0;

      for (var trabalho in _currentData) {
        if (trabalho['status_$_setor'] == 1) {
          total++;
        } else {
          completo++;
        }
      }

      return {'total': total, 'completo': completo};
    } else {
      return null;
    }
  }
}
