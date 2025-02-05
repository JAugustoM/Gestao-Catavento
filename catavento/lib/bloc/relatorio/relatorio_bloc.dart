import 'package:catavento/constants.dart';
import 'package:catavento/typedefs.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'relatorio_event.dart';
part 'relatorio_state.dart';

class RelatorioBloc extends Bloc<RelatorioEvent, RelatorioState> {
  final _supabase = Supabase.instance.client;
  DatabaseResponse _funcionarios = [];
  DatabaseResponse _loja = [];

  RelatorioBloc() : super(RelatorioCompleteState([], [])) {
    on<RelatorioLoad>(_onLoad);
  }

  void _onLoad(RelatorioLoad event, Emitter<RelatorioState> emit) async {
    try {
      _loja = await _gerarRelatorio();

      emit(RelatorioCompleteState(_funcionarios, _loja));
    } catch (e) {
      emit(RelatorioErrorState(
          _funcionarios, _loja, "Erro ao gerar o relatório - $e"));
    }
  }

  Future<List<Map<String, int>>> _gerarRelatorio() async {
    try {
      final hoje = DateTime.now();
      final List<Map<String, int>> relatorio = [
        {
          "MAGALU": 0,
          "MERCADO LIVRE": 0,
          "SITE": 0,
          "ELO 7": 0,
          "SHOPEE": 0,
        },
        {
          "MAGALU": 0,
          "MERCADO LIVRE": 0,
          "SITE": 0,
          "ELO 7": 0,
          "SHOPEE": 0,
        },
        {
          "MAGALU": 0,
          "MERCADO LIVRE": 0,
          "SITE": 0,
          "ELO 7": 0,
          "SHOPEE": 0,
        },
      ];
      var dataFormatada = DateFormat(dateFormat).format(hoje);
      final demandasDiarias = await _supabase
          .from('demandas')
          .select()
          .gte('data_adicao', '${dataFormatada}T00:00:00');

      var duration = Duration(days: hoje.weekday - 1);
      var dataInicial = hoje.subtract(duration);
      var dataInicialFormatada = DateFormat(dateFormat).format(dataInicial);
      duration = Duration(days: (DateTime.daysPerWeek - hoje.weekday));
      var dataFinal = hoje.add(duration);
      var dataFinalFormatada = DateFormat(dateFormat).format(dataFinal);
      final demandasSemanais = await _supabase
          .from('demandas')
          .select()
          .gte('data_adicao', '${dataInicialFormatada}T00:00:00')
          .lte('data_adicao', '${dataFinalFormatada}T23:59:59');

      dataInicial = DateTime(hoje.year, hoje.month);
      dataInicialFormatada = DateFormat(dateFormat).format(dataInicial);
      dataFinal = DateTime(hoje.year, hoje.month + 1, 0);
      dataFinalFormatada = DateFormat(dateFormat).format(dataFinal);
      final demandasMensais = await _supabase
          .from('demandas')
          .select()
          .gte('data_adicao', '${dataInicialFormatada}T00:00:00')
          .lte('data_adicao', '${dataFinalFormatada}T23:59:59');

      if (demandasDiarias.isNotEmpty) {
        for (var demanda in demandasDiarias) {
          switch (demanda['loja']) {
            case "MAGALU":
              relatorio[0]["MAGALU"] = relatorio[0]["MAGALU"]! + 1;
            case "MERCADO LIVRE":
              relatorio[0]["MERCADO LIVRE"] =
                  relatorio[0]["MERCADO LIVRE"]! + 1;
            case "SITE":
              relatorio[0]["SITE"] = relatorio[0]["SITE"]! + 1;
            case "ELO 7":
              relatorio[0]["ELO 7"] = relatorio[0]["ELO 7"]! + 1;
            case "SHOPEE":
              relatorio[0]["SHOPEE"] = relatorio[0]["SHOPEE"]! + 1;
          }
        }
      }
      if (demandasSemanais.isNotEmpty) {
        for (var demanda in demandasSemanais) {
          switch (demanda['loja']) {
            case "MAGALU":
              relatorio[1]["MAGALU"] = relatorio[1]["MAGALU"]! + 1;
            case "MERCADO LIVRE":
              relatorio[1]["MERCADO LIVRE"] =
                  relatorio[1]["MERCADO LIVRE"]! + 1;
            case "SITE":
              relatorio[1]["SITE"] = relatorio[1]["SITE"]! + 1;
            case "ELO 7":
              relatorio[1]["ELO 7"] = relatorio[1]["ELO 7"]! + 1;
            case "SHOPEE":
              relatorio[1]["SHOPEE"] = relatorio[1]["SHOPEE"]! + 1;
          }
        }
      }
      if (demandasMensais.isNotEmpty) {
        for (var demanda in demandasMensais) {
          switch (demanda['loja']) {
            case "MAGALU":
              relatorio[2]["MAGALU"] = relatorio[2]["MAGALU"]! + 1;
            case "MERCADO LIVRE":
              relatorio[2]["MERCADO LIVRE"] =
                  relatorio[2]["MERCADO LIVRE"]! + 1;
            case "SITE":
              relatorio[2]["SITE"] = relatorio[2]["SITE"]! + 1;
            case "ELO 7":
              relatorio[2]["ELO 7"] = relatorio[2]["ELO 7"]! + 1;
            case "SHOPEE":
              relatorio[2]["SHOPEE"] = relatorio[2]["SHOPEE"]! + 1;
          }
        }
      }

      return relatorio;
    } catch (e) {
      return [];
    }
  }

  Map<String, dynamic> diario() {
    if (_loja.isNotEmpty) {
      final diario = _loja[0];
      final sortedDiarioList = diario.entries.toList()
        ..sort((entry1, entry2) {
          final aValue = entry1.value as int;
          final bValue = entry2.value as int;

          return bValue.compareTo(aValue);
        });

      final Map<String, dynamic> sortedDiario = {};

      for (var entry in sortedDiarioList) {
        sortedDiario[entry.key] = entry.value;
      }

      return sortedDiario;
    } else {
      return {};
    }
  }

  Map<String, dynamic> semanal() {
    if (_loja.isNotEmpty) {
      final semanal = _loja[1];
      final sortedSemanalList = semanal.entries.toList()
        ..sort((entry1, entry2) {
          final aValue = entry1.value as int;
          final bValue = entry2.value as int;

          return bValue.compareTo(aValue);
        });

      final Map<String, dynamic> sortedSemanal = {};

      for (var entry in sortedSemanalList) {
        sortedSemanal[entry.key] = entry.value;
      }

      return sortedSemanal;
    } else {
      return {};
    }
  }

  Map<String, dynamic> mensal() {
    if (_loja.isNotEmpty) {
      final mensal = _loja[2];
      final sortedMensalList = mensal.entries.toList()
        ..sort((entry1, entry2) {
          final aValue = entry1.value as int;
          final bValue = entry2.value as int;

          return bValue.compareTo(aValue);
        });

      print(sortedMensalList);

      final Map<String, dynamic> sortedMensal = {};

      for (var entry in sortedMensalList) {
        sortedMensal[entry.key] = entry.value;
      }

      return sortedMensal;
    } else {
      return {};
    }
  }
}
