import 'dart:io';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:excel/excel.dart';

Future<void> importExcelToSupabase(String filePath) async {
  // final supabase = Supabase.instance.client;
  try {
    final file = File(filePath);
    final excel = Excel.decodeBytes(file.readAsBytesSync());

    for (var sheetName in excel.tables.keys) {
      final sheet = excel.tables[sheetName];

      if (sheet != null) {
        excel.link(sheetName, sheet);
        var rowId = 1;
        print('processando planilha: $sheetName');
        for (var row in sheet.rows) {
          // mapear os valores das celular para uma lista de dados puros
          final rowData =
              row.map((cell) => cell?.value?.toString() ?? '').toList();

          // print('dados da linha: $rowData');

          // verifica a validade da coluna (se é nula ou vazia)
          if (rowData.isNotEmpty && rowData.first.isNotEmpty) {
            try {
              if (rowData[0] != "" && rowData[2] != "X") {
                final Map<String, dynamic> parsedData = {
                  'nomeDemanda': rowData[0],
                  'funcionario': rowData[1].isNotEmpty == true ? rowData[1] : 0,
                  'status': rowData[2].isNotEmpty == true ? rowData[2] : 'R',
                };

                var demanda = parsedData['nomeDemanda'];
                var funcionario = parsedData['funcionario'];
                var status = parsedData['status'];

                print('Linha $rowId: $demanda - $funcionario - $status');
                // await supabase.from('demandas').insert(parsedData);

                var cell = sheet.cell(CellIndex.indexByColumnRow(
                  columnIndex: 2,
                  rowIndex: rowId,
                ));
                cell.value = TextCellValue('X');
                rowId++;
              }
            } catch (e) {
              print('erro: $e');
            }
          }
        }
        print(rowId);
      }
    }

    await file.writeAsBytes(excel.encode()!);
  } catch (e) {
    print('erro ao importar o arquivo: $e');
  }
}
