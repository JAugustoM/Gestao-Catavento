# Documentação de Testes - Integração do Formulário de Criação e Edição de uma Demanda

## Objetivo do Teste de Integração:

O objetivo deste teste de integração é validar o processo completo de criação e edição de uma demanda, desde o preenchimento do formulário até a confirmação de sucesso. O teste garante que a interação com o formulário de cadastro e edição funcione corretamente, refletindo as mudanças na aplicação.

## Operações Testadas:

### 1. **Integração do Formulário de Cadastro de uma Demanda**:
- **Objetivo:** Garantir que, ao preencher o formulário de cadastro de demanda e clicar no botão "Concluir", a demanda seja criada corretamente e a mensagem de sucesso seja exibida.
- **Resultado Esperado:** O formulário será preenchido corretamente com os dados da demanda e, ao clicar em "Concluir", o sistema deverá exibir a mensagem `"Bolo adicionado com sucesso"`.
- **Resultado Obtido:** O teste validou que o formulário foi preenchido com sucesso nos campos `codigoDemandaInput`, `nomeDemandaInput`, `dataPedidoInput`, `prazoInput` e `descricaoDemandaInput`. Após clicar no botão "Concluir", a mensagem de sucesso `"Bolo adicionado com sucesso"` foi exibida, confirmando que a demanda foi criada corretamente.

### 2. **Integração do Formulário de Edição de uma Demanda**:
- **Objetivo:** Garantir que, ao editar uma demanda existente e clicar no botão "Concluir", as informações sejam atualizadas corretamente e a mensagem de sucesso seja exibida.
- **Resultado Esperado:** O formulário de edição será preenchido corretamente com os novos dados da demanda e, ao clicar em "Concluir", o sistema deverá exibir a mensagem `"Bolo atualizado com sucesso!"`.
- **Resultado Obtido:** O teste validou que o formulário foi preenchido com sucesso com novos valores nos campos `codigoDemandaInput`, `nomeDemandaInput`, `dataPedidoInput`, `prazoInput` e `descricaoDemandaInput`. Após clicar no botão "Concluir", a mensagem de sucesso `"Bolo atualizado com sucesso!"` foi exibida, confirmando que a edição foi realizada corretamente.

## Resumo dos Resultados Obtidos:

- **Preenchimento de Formulário:** Todos os campos do formulário foram preenchidos corretamente tanto na criação quanto na edição de uma demanda.
- **Mensagens de Sucesso:** Após o envio do formulário, as mensagens de sucesso foram exibidas corretamente, indicando que a demanda foi criada e editada com sucesso.

## Conclusão:

Os testes de integração para **Cadastro e Edição de Demanda** foram concluídos com sucesso. O preenchimento do formulário, a edição e a verificação das mensagens de sucesso ocorreram conforme esperado, sem erros. A criação e atualização da demanda foram realizadas com êxito, e a interface respondeu corretamente ao fluxo do usuário.

## Execução dos Testes:

Para rodar os testes de integração, utilize o seguinte comando:

```bash
flutter test integration_test -d <PLATAFORMA> --dart-define=ANON_KEY=<SUA_CHAVE_AQUI>
