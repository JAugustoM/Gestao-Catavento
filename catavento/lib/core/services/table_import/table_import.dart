import 'dart:io';
import 'package:catavento/constants.dart';
import 'package:catavento/typedefs.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:excel/excel.dart';

Future<String> importExcelToSupabase(String filePath) async {
  final supabase = Supabase.instance.client;
  DatabaseResponse demandas = [];

  try {
    final file = File(filePath);
    final excel = Excel.decodeBytes(file.readAsBytesSync());

    final sheetName = excel.tables.keys.first;
    final sheet = excel.tables[sheetName];

    if (sheet != null && sheet.maxColumns != 0) {
      var loja = "";
      final dataAdicao = DateFormat(timeFormat).format(DateTime.now());
      for (var row in sheet.rows) {
        final rowData =
            row.map((cell) => cell?.value.toString() ?? '').toList();

        if ((rowData[2].isNotEmpty && rowData[2] != "null") ||
            (rowData[3].isNotEmpty && rowData[3] != "null")) {
          return "Tabela inválida";
        }

        if ((rowData[0] != "" && rowData[0] != "null") &&
            (rowData[1] != "" && rowData[1] != "null")) {
          final Map<String, dynamic> demanda = {
            'nome_demanda': rowData[0],
            'data_adicao': dataAdicao,
            'descricao': 'Bolo normal',
            'status': 'Pendente',
          };

          final codigo = int.tryParse(rowData[1]);

          if (codigo != null) {
            final produto =
                await supabase.from('produtos').select().eq('id', codigo);

            if (produto.isNotEmpty) {
              demanda['produto_id'] = codigo;
              demanda['descricao'] = produto[0]['descricao_padrao'];
              demanda['nome_demanda'] = produto[0]['nome_produto'];
            }
          }

          if (loja.isNotEmpty) {
            demanda['loja'] = loja;
          }

          demandas.add(demanda);
        } else if (rowData[0] != "" && rowData[0] != "null") {
          loja = rowData[0].toUpperCase();
        }
      }
    } else {
      return "Planilha vazia";
    }
  } catch (e) {
    return "Erro ao importar a tabela - $e";
  }

  try {
    var order = 0;
    for (var demanda in demandas) {
      if (demanda['produto_id'] != null) {
        final id = demanda['produto_id'];
        final dados = await supabase.from('produtos').select().eq('id', id);
        if (dados.isNotEmpty) {
          final dadosBolo = dados.first;
          demandas[order]['descricao'] = dadosBolo['descricao_padrao'];
        }
      }
      order++;
    }
  } catch (e) {
    return "Falha ao importar dados do produto";
  }

  try {
    await supabase.from('demandas').insert(demandas);
    return "Planilha importada com sucesso!";
  } catch (e) {
    return "Erro ao enviar os dados para o banco de dados: $e";
  }
}
