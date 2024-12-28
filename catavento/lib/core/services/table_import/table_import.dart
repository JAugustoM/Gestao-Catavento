import 'dart:io';
import 'package:catavento/constants.dart';
import 'package:catavento/typedefs.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:excel/excel.dart';

Future<void> importExcelToSupabase(String filePath) async {
  final supabase = Supabase.instance.client;
  DatabaseResponse demandas = [];

  try {
    final file = File(filePath);
    final excel = Excel.decodeBytes(file.readAsBytesSync());

    for (var sheetName in excel.tables.keys) {
      final sheet = excel.tables[sheetName];

      if (sheet != null) {
        var rowId = 0;
        var loja = "";
        final dataAdicao = DateFormat(timeFormat).format(DateTime.now());
        for (var row in sheet.rows) {
          final rowData =
              row.map((cell) => cell?.value.toString() ?? '').toList();

          try {
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
                demanda['produto_id'] = codigo;
              }

              if (loja.isNotEmpty) {
                demanda['loja'] = loja;
              }

              demandas.add(demanda);
            } else if (rowData[0] != "" && rowData[0] != "null") {
              loja = rowData[0].toUpperCase();
            }
          } catch (e) {
            print('Erro ao processar a linha ${rowId + 1}: $e');
          }
          rowId++;
        }
      }
    }
    print('Planilha importada e atualizada com sucesso!');
  } catch (e) {
    print('Erro ao importar a planilha: $e');
  }

  try {
    await supabase.from('demandas').insert(demandas);
  } catch (e) {
    print("Erro ao enviar os dados: $e");
  }
}
