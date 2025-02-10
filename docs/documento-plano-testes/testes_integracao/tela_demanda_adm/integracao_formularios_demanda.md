# Documentação de Testes - Integração do Formulário de Cadastro e Edição de Funcionário

## Objetivo do Teste de Integração:

O objetivo deste teste de integração é validar o processo completo de cadastro e edição de um funcionário, desde o preenchimento do formulário até a confirmação de sucesso. O teste garante que a interação com o formulário de cadastro e edição funcione corretamente, refletindo as mudanças na aplicação.

## Operações Testadas:

### 1. **Integração do Formulário de Cadastro de Funcionário**:
- **Objetivo:** Garantir que, ao preencher o formulário de cadastro de funcionário e clicar no botão "Concluir", o funcionário seja criado corretamente e a mensagem de sucesso seja exibida.
- **Resultado Esperado:** O formulário será preenchido corretamente com os dados do funcionário e, ao clicar em "Concluir", o sistema deverá exibir a mensagem `"Usuário criado com sucesso!"`.
- **Resultado Obtido:** O teste validou que o formulário foi preenchido com sucesso nos campos `NomeFuncionarioInput`, `FuncionarioCkeckBox`, `setorDropdown`, `EmailFuncionarioInput`, `NomeUsuarioInput` e `SenhaFuncionarioInput`. Após clicar no botão "Concluir", a mensagem de sucesso `"Usuário criado com sucesso!"` foi exibida, confirmando que o cadastro foi realizado corretamente.

### 2. **Integração do Formulário de Edição de Funcionário**:
- **Objetivo:** Garantir que, ao editar um funcionário existente e clicar no botão "Concluir", as informações sejam atualizadas corretamente e a mensagem de sucesso seja exibida.
- **Resultado Esperado:** O formulário de edição será preenchido corretamente com os novos dados do funcionário e, ao clicar em "Concluir", o sistema deverá exibir a mensagem `"Usuário atualizado com sucesso!"`.
- **Resultado Obtido:** O teste encontrou um erro ao tentar editar um funcionário. Após preencher os campos `EditarNomeFuncionarioInput`, `EditarFuncionarioCheckBox`, `EditarsetorDropdown` e `EditarNomeUsuarioInput`, o sistema retornou a mensagem `"Erro ao acessar banco de dados"`, impedindo a conclusão da edição.

## Resumo dos Resultados Obtidos:

- **Preenchimento de Formulário:** O formulário de cadastro foi preenchido corretamente, enquanto o formulário de edição encontrou erro ao acessar o banco de dados.
- **Mensagens de Sucesso:** A criação de um novo funcionário foi concluída com sucesso, porém a edição não foi realizada devido a um erro de banco de dados.

## Conclusão:

Os testes de integração para **Cadastro e Edição de Funcionário** apresentaram sucesso no fluxo de cadastro, mas falharam na etapa de edição devido a um erro ao acessar o banco de dados. 

## Execução dos Testes:

Para rodar os testes de integração, utilize o seguinte comando:

```bash
flutter test integration_test/funcionarios_admin_test.dart -d <PLATAFORMA> --dart-define=ANON_KEY=<SUA_CHAVE_AQUI>
```
