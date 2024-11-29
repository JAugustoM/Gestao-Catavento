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
        if (sheet.maxColumns == 3) {
          sheet.insertColumn(3);
        }
        var rowId = 0;
        print('processando planilha: $sheetName');
        for (var row in sheet.rows) {
          // mapear os valores das celular para uma lista de dados puros
          final rowData =
              row.map((cell) => cell?.value.toString() ?? '').toList();

          // print('dados da linha: $rowData');
          try {
            if ((rowData[0] != "" && rowData[0] != "null") &&
                rowData[3] != "X") {
              final Map<String, dynamic> parsedData = {
                'nomeDemanda': rowData[0],
                'funcionario': rowData[1] != "null" ? rowData[1] : "0",
                'status': rowData[3].isNotEmpty == true ? rowData[3] : 'R',
              };

              var demanda = parsedData['nomeDemanda'];
              var funcionario = parsedData['funcionario'];
              var status = parsedData['status'];

              print('Linha ${rowId + 1}: $demanda - $funcionario - $status');
              // await supabase.from('demandas').insert(parsedData);

              var cell = sheet.cell(CellIndex.indexByColumnRow(
                columnIndex: 3,
                rowIndex: rowId,
              ));
              cell.value = TextCellValue('X');
            }
          } catch (e) {
            print('erro: $e');
          }
          rowId++;
        }
        print(rowId);
      }
    }

    await file.writeAsBytes(excel.encode()!);
  } catch (e) {
    print('erro ao importar o arquivo: $e');
  }
}
