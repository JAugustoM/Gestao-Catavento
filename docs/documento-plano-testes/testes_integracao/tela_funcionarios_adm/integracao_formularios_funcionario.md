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
- **Resultado Obtido:** O teste validou que o formulário foi preenchido com sucesso com novos valores nos campos `EditarNomeFuncionarioInput`, `EditarFuncionarioCkeckBox`, `EditarsetorDropdown` e `EditarNomeUsuarioInput`. Após clicar no botão "Concluir", a mensagem de sucesso `"Usuário atualizado com sucesso!"` foi exibida, confirmando que a edição foi realizada corretamente.

## Resumo dos Resultados Obtidos:

- **Preenchimento de Formulário:** Todos os campos do formulário foram preenchidos corretamente tanto no cadastro quanto na edição de um funcionário.
- **Mensagens de Sucesso:** Após o envio do formulário, as mensagens de sucesso foram exibidas corretamente, indicando que o funcionário foi cadastrado e editado com sucesso.

## Conclusão:

Os testes de integração para **Cadastro e Edição de Funcionário** foram concluídos com sucesso. O preenchimento do formulário, a edição e a verificação das mensagens de sucesso ocorreram conforme esperado, sem erros. A criação e atualização do funcionário foram realizadas com êxito, e a interface respondeu corretamente ao fluxo do usuário.

## Execução dos Testes:

Para rodar os testes de integração, utilize o seguinte comando:

```bash
flutter test integration_test/funcionarios_admin_test.dart -d <PLATAFORMA> --dart-define=ANON_KEY=<SUA_CHAVE_AQUI>
```