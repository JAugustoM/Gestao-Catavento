import 'dart:io';
// import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:excel/excel.dart';
import 'package:path_provider/path_provider.dart';

Future<void> importExcelToSupabase(String filePath) async {
  // final supabase = Supabase.instance.client;
  try {
    final fileBytes = File(filePath).readAsBytesSync();
    final excel = Excel.decodeBytes(fileBytes);

    for (var sheetName in excel.tables.keys) {
      final sheet = excel.tables[sheetName];

      if (sheet != null) {
        print('processando planilha: $sheetName');
        for (var row in sheet.rows) {
          // mapear os valores das celular para uma lista de dados puros
          final rowData =
              row.map((cell) => cell?.value?.toString() ?? '').toList();

          // print('dados da linha: $rowData');

          var rowId = 1;

          // verifica a validade da coluna (se é nula ou vazia)
          if (rowData.isNotEmpty && rowData.first.isNotEmpty) {
            try {
              if (rowData[0] != "" && rowData[2] != 'X') {
                final Map<String, dynamic> parsedData = {
                  'nomeDemanda': rowData[0],
                  'funcionario': rowData[1].isNotEmpty == true ? rowData[1] : 0,
                };

                print(
                    'dados lidos: ${parsedData['nomeDemanda']} - ${parsedData['funcionario']}');
                // await supabase.from('demandas').insert(parsedData);

                var cell = sheet.cell(CellIndex.indexByString('C$rowId'));
                cell.value = TextCellValue('X');
                rowId++;
              }
            } catch (e) {
              print('erro: $e');
            }
          }
        }
      }
    }

    final splitPath = filePath.split('/');
    final fileName = splitPath.last;

    final newTable = excel.save();
    final directory = await getApplicationDocumentsDirectory();
    if (newTable != null) {
      File('${directory.path}/$fileName')
        ..createSync(recursive: true)
        ..writeAsBytesSync(newTable);

      print('${directory.path}/$fileName');
    } else {
      print('null');
    }
  } catch (e) {
    print('erro ao importar o arquivo: $e');
  }
}
