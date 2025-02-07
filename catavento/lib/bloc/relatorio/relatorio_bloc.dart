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
  DatabaseResponse _dadosGerais = [];
  DatabaseResponse _bolos = [];
  List<DatabaseResponse> _demandas = [];

  RelatorioBloc() : super(RelatorioCompleteState([], [], [])) {
    on<RelatorioLoad>(_onLoad);
  }

  void _onLoad(RelatorioLoad event, Emitter<RelatorioState> emit) async {
    try {
      final relatorio = await _gerarRelatorioLoja();
      _loja = relatorio[0];
      _dadosGerais = relatorio[1];
      _bolos = relatorio[2];

      emit(RelatorioCompleteState(_funcionarios, _loja, _dadosGerais));
    } catch (e) {
      emit(RelatorioErrorState(_funcionarios, _loja, _dadosGerais,
          "Erro ao gerar o relatório - $e"));
    }
  }

  Future<List<DatabaseResponse>> _getDemandas() async {
    try {
      final hoje = DateTime.now();

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

      _demandas = [demandasDiarias, demandasSemanais, demandasMensais];
      return _demandas;
    } catch (e) {
      return [];
    }
  }

  Future<List<DatabaseResponse>> _gerarRelatorioLoja() async {
    try {
      late final List<DatabaseResponse> demandas;
      if (_demandas.isEmpty) {
        demandas = await _getDemandas();
      } else {
        demandas = _demandas;
      }
      final List<Map<String, int>> vendasLojas = [
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

      final dadosGeraisD = {
        'total': 0,
        'produzidos': 0,
        'pendentes': 0,
      };

      final dadosGeraisS = {
        'total': 0,
        'produzidos': 0,
        'pendentes': 0,
      };

      final dadosGeraisM = {
        'total': 0,
        'produzidos': 0,
        'pendentes': 0,
      };

      final Map<String, int> bolosD = {};
      final Map<String, int> bolosS = {};
      final Map<String, int> bolosM = {};

      if (demandas[0].isNotEmpty) {
        for (var demanda in demandas[0]) {
          switch (demanda['loja'].toString().toUpperCase()) {
            case "MAGALU":
              vendasLojas[0]["MAGALU"] = vendasLojas[0]["MAGALU"]! + 1;
            case "MERCADO LIVRE":
              vendasLojas[0]["MERCADO LIVRE"] =
                  vendasLojas[0]["MERCADO LIVRE"]! + 1;
            case "SITE":
              vendasLojas[0]["SITE"] = vendasLojas[0]["SITE"]! + 1;
            case "ELO 7":
              vendasLojas[0]["ELO 7"] = vendasLojas[0]["ELO 7"]! + 1;
            case "SHOPEE":
              vendasLojas[0]["SHOPEE"] = vendasLojas[0]["SHOPEE"]! + 1;
          }

          if (demanda['status'] == 'Finalizado') {
            dadosGeraisD['produzidos'] = dadosGeraisD['produzidos']! + 1;
          } else {
            dadosGeraisD['pendentes'] = dadosGeraisD['pendentes']! + 1;
          }
          final nomeDemanda =
              "${demanda['nome_demanda']} (${demanda['produto_id'] ?? "*"})";

          bolosD[nomeDemanda] = (bolosD[nomeDemanda] ?? 0) + 1;
        }
        dadosGeraisD['total'] =
            dadosGeraisD['produzidos']! + dadosGeraisD['pendentes']!;
      }
      if (demandas[1].isNotEmpty) {
        for (var demanda in demandas[1]) {
          switch (demanda['loja'].toString().toUpperCase()) {
            case "MAGALU":
              vendasLojas[1]["MAGALU"] = vendasLojas[1]["MAGALU"]! + 1;
            case "MERCADO LIVRE":
              vendasLojas[1]["MERCADO LIVRE"] =
                  vendasLojas[1]["MERCADO LIVRE"]! + 1;
            case "SITE":
              vendasLojas[1]["SITE"] = vendasLojas[1]["SITE"]! + 1;
            case "ELO 7":
              vendasLojas[1]["ELO 7"] = vendasLojas[1]["ELO 7"]! + 1;
            case "SHOPEE":
              vendasLojas[1]["SHOPEE"] = vendasLojas[1]["SHOPEE"]! + 1;
          }
          if (demanda['status'] == 'Finalizado') {
            dadosGeraisS['produzidos'] = dadosGeraisS['produzidos']! + 1;
          } else {
            dadosGeraisS['pendentes'] = dadosGeraisS['pendentes']! + 1;
          }

          final nomeDemanda =
              "${demanda['nome_demanda']} (${demanda['produto_id'] ?? "*"})";

          bolosS[nomeDemanda] = (bolosS[nomeDemanda] ?? 0) + 1;
        }
        dadosGeraisS['total'] =
            dadosGeraisS['produzidos']! + dadosGeraisS['pendentes']!;
      }
      if (demandas[2].isNotEmpty) {
        for (var demanda in demandas[2]) {
          switch (demanda['loja'].toString().toUpperCase()) {
            case "MAGALU":
              vendasLojas[2]["MAGALU"] = vendasLojas[2]["MAGALU"]! + 1;
            case "MERCADO LIVRE":
              vendasLojas[2]["MERCADO LIVRE"] =
                  vendasLojas[2]["MERCADO LIVRE"]! + 1;
            case "SITE":
              vendasLojas[2]["SITE"] = vendasLojas[2]["SITE"]! + 1;
            case "ELO 7":
              vendasLojas[2]["ELO 7"] = vendasLojas[2]["ELO 7"]! + 1;
            case "SHOPEE":
              vendasLojas[2]["SHOPEE"] = vendasLojas[2]["SHOPEE"]! + 1;
          }

          if (demanda['status'] == 'Finalizado') {
            dadosGeraisM['produzidos'] = dadosGeraisM['produzidos']! + 1;
          } else {
            dadosGeraisM['pendentes'] = dadosGeraisM['pendentes']! + 1;
          }

          final nomeDemanda =
              "${demanda['nome_demanda']} (${demanda['produto_id'] ?? "*"})";

          bolosM[nomeDemanda] = (bolosM[nomeDemanda] ?? 0) + 1;
        }
        dadosGeraisM['total'] =
            dadosGeraisM['produzidos']! + dadosGeraisM['pendentes']!;
      }

      final dadosGerais = [dadosGeraisD, dadosGeraisS, dadosGeraisM];
      final bolos = [bolosD, bolosS, bolosM];

      return [vendasLojas, dadosGerais, bolos];
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

  Map<String, dynamic> bolosDiario() {
    if (_bolos.isNotEmpty) {
      final diario = _bolos[0];
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

  Map<String, dynamic> bolosSemanal() {
    if (_bolos.isNotEmpty) {
      final semanal = _bolos[1];
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

      final Map<String, dynamic> sortedMensal = {};

      for (var entry in sortedMensalList) {
        sortedMensal[entry.key] = entry.value;
      }

      return sortedMensal;
    } else {
      return {};
    }
  }

  Map<String, dynamic> bolosMensal() {
    if (_bolos.isNotEmpty) {
      final mensal = _bolos[2];
      final sortedMensalList = mensal.entries.toList()
        ..sort((entry1, entry2) {
          final aValue = entry1.value as int;
          final bValue = entry2.value as int;

          return bValue.compareTo(aValue);
        });

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
