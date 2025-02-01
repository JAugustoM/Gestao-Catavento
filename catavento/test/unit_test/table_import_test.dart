import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:mock_supabase_http_client/mock_supabase_http_client.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../mocks/mock_demanda_bloc/mock_table_import.dart';

void main() {
  late final SupabaseClient supabase;
  late final MockSupabaseHttpClient httpClient;

  setUpAll(() {
    httpClient = MockSupabaseHttpClient();

    supabase = SupabaseClient(
      'https://mock.supabase.co',
      'fakeAnonKey',
      httpClient: MockSupabaseHttpClient(),
    );
  });

  test('importExcelToSupabase', () async {
    final filePath = 'test/mocks/mock_demanda_bloc/mock_table_import.dart';
    final result = await importExcelToSupabase(filePath, supabase);

    expect(result,
        "Erro ao importar a tabela - Unsupported operation: Excel format unsupported. Only .xlsx files are supported");
  });

  test('validateFile', () async {
    final filePath = '${Directory.current.path}/test/files/vendas_diarias.xlsx';
    final result = await importExcelToSupabase(filePath, supabase);

    expect(result, "Planilha importada com sucesso!");
  });

  test('emptyFile', () async {
    final filePath = '${Directory.current.path}/test/files/planilha_vazia.xlsx';
    final result = await importExcelToSupabase(filePath, supabase);

    expect(result, "Planilha vazia");
  });

  test('invalidFile', () async {
    final filePath =
        '${Directory.current.path}/test/files/dados_invalidos.xlsx';
    final result = await importExcelToSupabase(filePath, supabase);

    expect(result, "Tabela inválida");
  });
}
