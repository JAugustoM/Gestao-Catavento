import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:excel/excel.dart';

Future<void> importExcelToSupabase(String filePath) async {
  final supabase = Supabase.instance.client;

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
        for (var row in sheet.rows) {
          final rowData =
              row.map((cell) => cell?.value.toString() ?? '').toList();

          try {
            if ((rowData[0] != "" && rowData[0] != "null") &&
                rowData[3] != "1") {
              final Map<String, dynamic> parsedData = {
                'nomeDemanda': rowData[0],
                'funcionario': rowData[1] != "null" ? rowData[1] : "0",
                'status': rowData[3].isNotEmpty == true ? rowData[3] : '0',
              };

              // Envia os dados ao Supabase
              final response =
                  await supabase.from('demandas').insert(parsedData);

              if (response.error != null) {
                print(
                    'Erro ao inserir no Supabase: ${response.error!.message}');
              } else {
                print('Linha ${rowId + 1} enviada com sucesso: $parsedData');
              }

              // Marca a linha como processada
              var cell = sheet.cell(CellIndex.indexByColumnRow(
                columnIndex: 3,
                rowIndex: rowId,
              ));
              cell.value = TextCellValue('X');
            }
          } catch (e) {
            print('Erro ao processar a linha ${rowId + 1}: $e');
          }
          rowId++;
        }
      }
    }

    // Salva o arquivo Excel atualizado
    await file.writeAsBytes(excel.encode()!);
    print('Planilha importada e atualizada com sucesso!');
  } catch (e) {
    print('Erro ao importar a planilha: $e');
  }
}
