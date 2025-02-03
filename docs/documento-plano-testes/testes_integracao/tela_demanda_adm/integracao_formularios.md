# Documentação de Testes - Integração do Formulário de Criação de uma Demanda

## Objetivo do Teste de Integração:

O objetivo deste teste de integração é validar o processo completo de criação de uma nova demanda, Desde o preenchimento do formulário de cadastro até a confirmação de sucesso. O teste garante que a interação com o formulário de criação da demanda funcione corretamente, refletindo a criação da demanda na aplicação.

## Operações Testadas:

### 1. **Integração do Formulário de Cadastro de uma Demanda**:
- **Objetivo:** Garantir que, ao preencher o formulário de cadastro de demanda e clicar no botão de "Concluir", a demanda seja criada corretamente e a mensagem de sucesso seja exibida.
- **Resultado Esperado:** O formulário será preenchido corretamente com os dados da demanda e, ao clicar em "Concluir", o sistema deverá exibir a mensagem `"Bolo adicionado com sucesso"`.
- **Resultado Obtido:** O teste validou que o formulário foi preenchido com sucesso nos campos `codigoDemandaInput`, `nomeDemandaInput`, `dataPedidoInput`, `prazoInput`, e `descricaoDemandaInput`. Após clicar no botão de "Concluir", a mensagem de sucesso `"Bolo adicionado com sucesso"` foi exibida, confirmando que a demanda foi criada corretamente.

## Resumo dos Resultados Obtidos:

- **Preenchimento de Formulário:** Todos os campos do formulário foram preenchidos corretamente com os dados de uma nova demanda.
- **Mensagem de Sucesso:** Após o envio do formulário, a mensagem de sucesso foi exibida corretamente, indicando que a demanda foi criada.

## Conclusão:

O teste de integração para o **Cadastro de Demanda** foi concluído com sucesso. O preenchimento do formulário e a verificação da mensagem de sucesso ocorreram conforme esperado, sem erros. A criação da demanda foi realizada com êxito e a interface respondeu corretamente ao fluxo do usuário.