import 'package:file_picker/file_picker.dart';
import 'package:path_provider/path_provider.dart';

Future<String?> tablePicker() async {
  //retorna o caminho do arquivo
  try {
    final dir = await getApplicationDocumentsDirectory();
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['xlsx'],
      initialDirectory: dir.path,
    );

    if (result != null && result.files.isNotEmpty) {
      return result.files.single.path; //retornar caminho do arquivo
    }
  } catch (e) {
    print("Erro escolhendo o arquivo: $e");
  }
  return null; //nulo se nenhum arquivo foi selecionado ou se um erro aconteceu
}
