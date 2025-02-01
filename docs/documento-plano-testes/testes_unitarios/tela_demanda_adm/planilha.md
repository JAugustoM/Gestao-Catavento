# Documentação de Testes - Planilha Excel

## Objetivo
Testar a função `importExcelToSupabase` que importa dados de uma planilha Excel para uma base de dados Supabase. A função deve ser capaz de lidar com arquivos válidos, vazios, inválidos e com formatos incorretos, retornando mensagens adequadas para cada situação.

## Pré-condições
- O teste utiliza a biblioteca `flutter_test` para realização dos testes unitários.
- A função `importExcelToSupabase` está implementada no arquivo `mock_table_import.dart`.
- A aplicação supõe o uso do Supabase como banco de dados, e é utilizado o cliente mock `MockSupabaseHttpClient` para simular a comunicação com o banco de dados.
- As planilhas utilizadas nos testes estão localizadas no diretório `test/files/`.

## Descrição dos Testes

### 1. Teste: `importExcelToSupabase` com Arquivo com Formato Incompatível
- **Objetivo:** Verificar se a função lida corretamente com arquivos que não são no formato Excel.
- **Entrada:** Um arquivo com extensão `.dart` (não um arquivo Excel) localizado em `test/mocks/mock_demanda_bloc/mock_table_import.dart`.
- **Resultado Esperado:** `Erro ao importar a tabela - Unsupported operation: Excel format unsupported. Only .xlsx files are supported`.
- **Resultado Obtido:** Teste passou conforme esperado.

### 2. Teste: Importação de Planilha Válida
- **Objetivo:** Verificar se a função importa corretamente uma planilha válida.
- **Entrada:** Arquivo `vendas_diarias.xlsx` localizado em `test/files/vendas_diarias.xlsx`.
- **Resultado Esperado:** `Planilha importada com sucesso!`.
- **Resultado Obtido:** Teste passou conforme esperado.

### 3. Teste: Importação de Planilha Vazia
- **Objetivo:** Verificar se a função retorna erro ao importar uma planilha sem dados.
- **Entrada:** Arquivo `planilha_vazia.xlsx` localizado em `test/files/planilha_vazia.xlsx`.
- **Resultado Esperado:** `Planilha vazia`.
- **Resultado Obtido:** Teste passou conforme esperado.

### 4. Teste: Importação de Planilha com Dados Inválidos
- **Objetivo:** Verificar se a função retorna erro ao importar uma planilha com dados inválidos.
- **Entrada:** Arquivo `dados_invalidos.xlsx` localizado em `test/files/dados_invalidos.xlsx`.
- **Resultado Esperado:** `Tabela inválida`.
- **Resultado Obtido:** Teste passou conforme esperado.

## Conclusão
Todos os testes foram executados com sucesso e os resultados obtidos estão de acordo com o esperado. A função `importExcelToSupabase` demonstrou ser robusta e capaz de lidar com diferentes cenários de entrada.
