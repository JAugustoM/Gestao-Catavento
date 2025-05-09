import 'dart:io';

import 'package:catavento/constants.dart';
import 'package:catavento/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'demanda_event.dart';
part 'demanda_state.dart';

class DemandaBloc extends Bloc<DemandaEvent, DemandaState> {
  final _supabase = Supabase.instance.client;
  DatabaseResponse _currentData = [];
  bool _newEvent = false;

  DemandaEvent get initialState => DemandaLoading();

  DemandaBloc() : super(DemandaLoadingState([], {})) {
    on<DemandaFilter>(_onFilter);

    on<DemandaLoading>(_onLoading);

    on<DemandaCreate>(_onCreate);

    on<DemandaDelete>(_onDelete);

    on<DemandaUpdate>(_onUpdate);

    on<DemandaFetch>(_onFetch);
  }

  @override
  void onEvent(DemandaEvent event) {
    super.onEvent(event);
    if (event is! DemandaFilter && event is! DemandaLoading) {
      _newEvent = true;
    }
  }

  bool isLocalEvent() {
    if (_newEvent) {
      _newEvent = false;
      return _newEvent;
    } else {
      return true;
    }
  }

  void _onFilter(DemandaFilter event, Emitter<DemandaState> emit) {
    final column = event.column;
    var value = event.value;
    DatabaseResponse newData = [];

    if (value != "") {
      value = value.toLowerCase();
      for (var data in _currentData) {
        if (data[column] != null) {
          var string = data[column] as String;
          string = string.toLowerCase();
          if (string.contains(value)) {
            newData.add(data);
          }
        }
      }
    }

    final metaData = _countDemandas();

    if (newData.isEmpty) {
      emit(DemandaFilterState(_currentData, metaData));
    } else {
      emit(DemandaFilterState(newData, metaData));
    }
  }

  void _onLoading(DemandaLoading event, Emitter<DemandaState> emit) async {
    final hoje = DateTime.now();
    final dataFormatada = DateFormat(dateFormat).format(hoje);

    final response = await _supabase
        .from('demandas')
        .select()
        .gte('data_adicao', '${dataFormatada}T00:00:00')
        .order('data_adicao', ascending: true)
        .order('id', ascending: true);

    _currentData = response;

    final metaData = _countDemandas();

    emit(DemandaLoadingState(_currentData, metaData));
  }

  void _onCreate(DemandaCreate event, Emitter<DemandaState> emit) async {
    final demanda = {
      'nome_demanda': event.nomeDemanda,
      'descricao': event.descricao == '' ? 'Bolo normal' : event.descricao,
      'status': 'Pendente',
      'status_cobertura': 0,
      'status_aplique': 0,
      'status_montagem': 0,
      'loja': event.loja,
    };

    try {
      final produto =
          await _supabase.from('produtos').select().eq('id', event.codigo);

      if (produto.isNotEmpty) {
        demanda['produto_id'] = event.codigo;
        if (event.descricao == '') {
          demanda['descricao'] = produto[0]['descricao_padrao'];
        }
        if (event.nomeDemanda == '') {
          demanda['nome_demanda'] = produto[0]['nome_produto'];
        }
      }
    } catch (e) {
      final metaData = _countDemandas();
      emit(DemandaErrorState(
        _currentData,
        metaData,
        "Erro ao acessar o banco de dados - $e",
      ));
    }

    late String dataAdicao;

    if (event.data == null || event.data!.length != 8) {
      dataAdicao = DateFormat(timeFormat).format(DateTime.now());
    } else {
      final splitData = event.data!.split('/');
      final time = DateFormat('HH:mm:ss').format(DateTime.now());
      final dataSting =
          '20${splitData[2]}-${splitData[1]}-${splitData[0]} $time';
      final dateTime = DateFormat(timeFormat).tryParse(dataSting);
      if (dateTime != null) dataAdicao = dataSting;
    }

    demanda['data_adicao'] = dataAdicao;

    if (event.prazo == null || event.prazo!.length != 8) {
      demanda['prazo'] = demanda['data_adicao'] as String;
    } else {
      final splitData = event.prazo!.split('/');
      final time = DateFormat('HH:mm:ss').format(DateTime.now());
      final dataSting =
          '20${splitData[2]}-${splitData[1]}-${splitData[0]} $time';
      final dateTime = DateFormat(timeFormat).tryParse(dataSting);
      if (dateTime != null) demanda['prazo'] = dataSting;
    }

    try {
      final response =
          await _supabase.from('demandas').insert(demanda).select();
      if (response.isNotEmpty) {
        _currentData.add(response[0]);

        final metaData = _countDemandas();

        emit(DemandaCreateState(_currentData, metaData));
      } else {
        final metaData = _countDemandas();
        emit(DemandaErrorState(
          _currentData,
          metaData,
          "Erro ao adicionar demanda",
        ));
      }
    } catch (e) {
      final metaData = _countDemandas();
      emit(DemandaErrorState(
        _currentData,
        metaData,
        "Erro ao adicionar demanda - $e",
      ));
    }
  }

  void _onDelete(DemandaDelete event, Emitter<DemandaState> emit) async {
    try {
      final response =
          await _supabase.from('demandas').delete().eq('id', event.id).select();
      if (response.isNotEmpty) {
        _currentData.removeWhere((test) => test['id'] == event.id);
      }
      final metaData = _countDemandas();

      emit(DemandaDeleteState(_currentData, metaData));
    } catch (e) {
      final metaData = _countDemandas();
      emit(DemandaErrorState(
        _currentData,
        metaData,
        "Erro ao deletar demanda - $e",
      ));
    }
  }

  void _onUpdate(DemandaUpdate event, Emitter<DemandaState> emit) async {
    try {
      final nomeDemanda = event.nomeDemanda;
      final descricao = event.descricao;
      final loja = event.loja;

      final demanda = {};

      final order = _currentData.indexWhere((test) => test['id'] == event.id);

      if (nomeDemanda.isNotEmpty) {
        demanda["nome_demanda"] = nomeDemanda;
        _currentData[order]['nome_demanda'] = nomeDemanda;
      }

      if (descricao.isNotEmpty) {
        demanda["descricao"] = descricao;
        _currentData[order]['descricao'] = descricao;
      }

      if (loja.isNotEmpty) {
        demanda["loja"] = loja;
        _currentData[order]['loja'] = loja;
      }

      if (event.data!.length == 8) {
        final splitData = event.data!.split('/');
        final time = DateFormat('HH:mm:ss').format(DateTime.now());
        final dataString =
            '20${splitData[2]}-${splitData[1]}-${splitData[0]} $time';
        final dateTime = DateFormat(timeFormat).tryParse(dataString);
        if (dateTime != null) {
          demanda['data_adicao'] = dataString;
          _currentData[order]['data_adicao'] = dataString;
        }
      }

      if (event.prazo!.length == 8) {
        final splitData = event.prazo!.split('/');
        final time = DateFormat('HH:mm:ss').format(DateTime.now());
        final dataString =
            '20${splitData[2]}-${splitData[1]}-${splitData[0]} $time';
        final dateTime = DateFormat(timeFormat).tryParse(dataString);
        if (dateTime != null) {
          demanda['prazo'] = dataString;
          _currentData[order]['prazo'] = dataString;
        }
      }

      await _supabase.from('demandas').update(demanda).eq('id', event.id);

      final metaData = _countDemandas();

      emit(DemandaUpdateState(_currentData, metaData));
    } catch (e) {
      final metaData = _countDemandas();
      emit(DemandaErrorState(
        _currentData,
        metaData,
        "Erro ao atualizar demanda - $e",
      ));
    }
  }

  void _onFetch(DemandaFetch event, Emitter<DemandaState> emit) {
    emit(DemandaLoadingState(_currentData, {}));
    try {
      final metaData = _countDemandas();
      emit(DemandaLoadedState(_currentData, {}, producao: metaData));
    } catch (e) {
      final metaData = _countDemandas();
      emit(DemandaErrorState(
          _currentData, metaData, "Erro ao obter dados - $e"));
    }
  }

  Map<String, int> _countDemandas() {
    int completo = 0;
    int espera = 0;
    int fabricacao = 0;

    for (var data in _currentData) {
      switch (data['status']) {
        case '0' || 'Pendente':
          espera++;
        case '1' || 'Em fabricação':
          fabricacao++;
        case '2' || 'Finalizado':
          completo++;
      }
    }

    int total = espera + fabricacao + completo;
    int restantes = espera + fabricacao;

    final metaData = {
      'completo': completo,
      'espera': espera,
      'fabricacao': fabricacao,
      'total': total,
      'restantes': restantes,
    };

    return metaData;
  }

  Map<String, dynamic>? getDemanda(int id) {
    final demanda = _currentData.firstWhere(
      (test) => test['id'] == id,
      orElse: () => {},
    );
    return demanda;
  }
}
