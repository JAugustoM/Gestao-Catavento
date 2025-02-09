# Documentação de Testes - Cadastro e Edição de Produto

## Objetivo do Teste de Integração:

O objetivo deste teste de integração é validar o processo completo de cadastro e edição de um produto, garantindo que as interações com o formulário ocorram corretamente e que as mensagens de sucesso sejam exibidas adequadamente.

## Operações Testadas:

### 1. **Integração do Formulário de Cadastro de Produto**:
- **Objetivo:** Garantir que, ao preencher o formulário de cadastro de produto e clicar no botão "Concluir", o produto seja criado corretamente e a mensagem de sucesso seja exibida.
- **Resultado Esperado:** O formulário será preenchido corretamente com os dados do produto e, ao clicar em "Concluir", o sistema deverá exibir a mensagem `"Produto adicionado com sucesso"`.
- **Resultado Obtido:** O teste validou que o formulário foi preenchido com sucesso nos campos `InputCodigoProduto`, `InputNomeProduto` e `InputDescricaoProduto`. Após clicar no botão "Concluir", a mensagem de sucesso foi exibida, confirmando que o cadastro foi realizado corretamente.

### 2. **Integração do Formulário de Edição de Produto**:
- **Objetivo:** Garantir que, ao editar um produto existente e clicar no botão "Concluir", as informações sejam atualizadas corretamente e a mensagem de sucesso seja exibida.
- **Resultado Esperado:** O formulário de edição será preenchido corretamente com os novos dados do produto e, ao clicar em "Concluir", o sistema deverá exibir a mensagem `"Produto atualizado com sucesso"`.
- **Resultado Obtido:** O teste validou que o formulário foi preenchido com sucesso com novos valores nos campos `InputNomeProduto` e `InputDescricaoProduto`. Após clicar no botão "Concluir", a mensagem de sucesso foi exibida, confirmando que a edição foi realizada corretamente.

## Resumo dos Resultados Obtidos:

- **Preenchimento de Formulário:** Todos os campos do formulário foram preenchidos corretamente tanto no cadastro quanto na edição de um produto.
- **Mensagens de Sucesso:** Após o envio do formulário, as mensagens de sucesso foram exibidas corretamente, indicando que o produto foi cadastrado e editado com sucesso.

## Conclusão:

Os testes de integração para **Cadastro e Edição de Produto** foram concluídos com sucesso. O preenchimento do formulário, a edição e a verificação das mensagens de sucesso ocorreram conforme esperado, sem erros. A criação e atualização do produto foram realizadas com êxito, e a interface respondeu corretamente ao fluxo do usuário.

## Execução dos Testes:

Para rodar os testes de integração, utilize o seguinte comando:

```bash
flutter test integration_test/produtos_admin_test.dart -d <PLATAFORMA> --dart-define=ANON_KEY=<SUA_CHAVE_AQUI>
```
