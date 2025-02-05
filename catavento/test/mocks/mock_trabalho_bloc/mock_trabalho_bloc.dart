import 'package:catavento/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'mock_trabalho_event.dart';
part 'mock_trabalho_state.dart';

class TrabalhoBloc extends Bloc<TrabalhoEvent, TrabalhoState> {
  final SupabaseClient _supabase;
  DatabaseResponse currentData = [];
  DatabaseResponse demandas = [];

  TrabalhoEvent get initialState => TrabalhoLoading(email: '', setor: '');

  TrabalhoBloc(this._supabase) : super(TrabalhoLoadingState([], [], {})) {
    on<TrabalhoLoading>(_onLoading);

    on<TrabalhoGet>(_onGet);

    on<TrabalhoInit>(_onInit);

    on<TrabalhoFinish>(_onFinish);

    on<TrabalhoAdmin>(_onAdmin);
  }

  void _onAdmin(TrabalhoAdmin event, Emitter<TrabalhoState> emit) async {
    try {
      final dataFinal = DateFormat('yyyy-MM-dd').format(DateTime.now());
      final trabalhos = await _supabase
          .from('trabalho')
          .select()
          .like('data_inicio', dataFinal);
      final funcionarios =
          await _supabase.from('usuarios').select().eq('tipo', 'padrao');

      var presentes = 0;

      for (var funcionario in funcionarios) {
        for (var trabalho in trabalhos) {
          if (trabalho['usuario_email'] == funcionario['email']) {
            presentes++;
            break;
          }
        }
      }

      emit(
        TrabalhoAdminState(
          trabalhos,
          [],
          funcionarios,
          {"presentes": presentes},
        ),
      );
    } catch (e) {
      emit(TrabalhoErrorState([], [], {}, "Erro ao carregar o banco de dados"));
    }
  }

  void _onLoading(TrabalhoLoading event, Emitter<TrabalhoState> emit) async {
    if (event.email.isNotEmpty && event.setor.isNotEmpty) {
      try {
        currentData = await _supabase
            .from('trabalho')
            .select()
            .eq('usuario_email', event.email)
            .isFilter('data_finalizacao', null);

        if (currentData.isNotEmpty) {
          for (var demanda in currentData) {
            var response = await _supabase
                .from('demandas')
                .select()
                .eq('id', demanda['demanda_id']);
            if (response.isNotEmpty) {
              demandas.add(response.first);
            }
          }
          final metaData = await _countTrabalho(event.setor, event.email);
          emit(TrabalhoLoadingState(
            currentData,
            demandas,
            metaData,
          ));
        } else {
          await _iniciarTrabalho(event.email, event.setor);
          final metaData = await _countTrabalho(event.setor, event.email);
          if (demandas.isNotEmpty) {
            emit(TrabalhoInitState(
              currentData,
              demandas,
              metaData,
            ));
          } else {
            emit(TrabalhoErrorState(
              currentData,
              demandas,
              {},
              "Nenhuma demanda disponível no momento",
            ));
          }
        }
      } catch (e) {
        final metaData = await _countTrabalho(event.setor, event.email);
        emit(TrabalhoErrorState(
          currentData,
          demandas,
          metaData,
          "Erro ao acessar o banco de dados - $e",
        ));
      }
    } else {
      emit(TrabalhoEmptyState([], [], {}));
    }
  }

  void _onGet(TrabalhoGet event, Emitter<TrabalhoState> emit) async {
    try {
      final demanda = {
        'id': 1,
        'nome_demanda': "Bolo Fake",
        'status': "Pendente",
        'status_cobertura': 0,
        'status_aplique': 0,
        'status_montagem': 0,
        'data_adicao': "2025-02-04T12:00:00",
      };

      final trabalho = {
        'demanda_id': demanda['id'],
        'usuario_email': event.email,
      };

      try {
        await _supabase.from('trabalho').insert(trabalho);
        currentData.add(trabalho);
        demandas.add(demanda);
        final metaData = await _countTrabalho(event.setor, event.email);
        emit(TrabalhoGetState(
          currentData,
          demandas,
          metaData,
        ));
      } on PostgrestException catch (e) {
        final metaData = await _countTrabalho(event.setor, event.email);
        if (e.code != "23505") {
          emit(TrabalhoErrorState(
            currentData,
            demandas,
            metaData,
            "Erro ao importar bolo do banco de dados - $e",
          ));
        }
      } catch (e) {
        final metaData = await _countTrabalho(event.setor, event.email);
        emit(TrabalhoErrorState(
          currentData,
          demandas,
          metaData,
          "Erro ao importar bolo do banco de dados - $e",
        ));
      }
    } catch (e) {
      emit(TrabalhoErrorState(
        currentData,
        demandas,
        {},
        "Teste - $e",
      ));
    }
  }

  void _onInit(TrabalhoInit event, Emitter<TrabalhoState> emit) async {
    final trabalho = currentData.first;
    final demanda = demandas.first;

    final data = "2025-02-04T12:00:00";
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
      currentData.first = trabalho;
      demandas.first = demanda;
      final metaData = await _countTrabalho(event.setor, event.email);
      emit(TrabalhoInitState(
        currentData,
        demandas,
        metaData,
      ));
    } catch (e) {
      final metaData = await _countTrabalho(event.setor, event.email);
      emit(TrabalhoErrorState(
        currentData,
        demandas,
        metaData,
        "Erro ao começar trabalho - $e",
      ));
    }
  }

  void _onFinish(TrabalhoFinish event, Emitter<TrabalhoState> emit) async {
    final demanda = demandas[0];

    final dataFinal = "2025-02-04T12:00:00";

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
      demandas.removeAt(0);

      await _supabase.from('trabalho').update(
          {'data_finalizacao': dataFinal}).eq('demanda_id', demanda['id']);
      currentData.removeAt(0);

      final metaData = await _countTrabalho(event.setor, event.email);

      emit(TrabalhoFinishState(currentData, demandas, metaData));
    } catch (e) {
      final metaData = await _countTrabalho(event.setor, event.email);
      emit(TrabalhoErrorState(
        currentData,
        demandas,
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
      currentData.add(trabalho);
      demandas.add(demanda);
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
