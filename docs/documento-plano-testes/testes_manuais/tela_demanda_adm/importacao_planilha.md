# Documentação de Testes Manuais - Funcionalidade de Importação de Planilha Excel

## Objetivo do Teste:

O objetivo deste teste é garantir que a funcionalidade de importação de planilhas Excel funcione corretamente, validando a importação de dados a partir de arquivos válidos e invalidando formatos incorretos. Além disso, será verificada a exibição das mensagens de feedback durante o processo de importação.

## Operações Testadas:

### **Importação de Planilha Excel:**

#### **1. Importar uma planilha válida:**
- **Objetivo:** Validar que a aplicação consiga importar corretamente uma planilha Excel válida.
- **Resultado Esperado:** O sistema deve importar os dados da planilha sem erros, e a mensagem de sucesso da importação deve ser exibida.
- **Resultado Obtido:** 
    [Erro] Falta de mensagem de feedback
    Descrição: 
        A importação foi realizada corretamente, mas não houve exibição de mensagem de feedback ao usuário após a conclusão.
    Comportamento observado:
        - Dados foram importados corretamente para o sistema;
        - Nenhuma mensagem de confirmação ou erro foi exibida.

#### **2. Importar uma planilha com formato inválido:**
- **Objetivo:** Validar que a aplicação rejeite planilhas com formato inválido.
- **Resultado Esperado:** O sistema deve rejeitar planilhas com dados ou formatos inválidos, exibindo uma mensagem de erro clara.
- **Resultado Obtido:** 
    [Erro] Aceitação de planilhas inválidas
    Descrição:
        A aplicação aceitou uma planilha com colunas duplicadas e dados repetidos, sem exibir uma mensagem de erro apropriada.
    Comportamento observado:
        - A planilha foi importada sem erro;

    [Erro] Falta de feedback ao rejeitar planilhas com formato incorreto
    Descrição:
        Ao tentar importar planilhas com fórmulas ou relatórios, a aplicação rejeitou, mas não apresentou mensagem de erro.
    Comportamento observado:
        - A planilha foi rejeitada sem feedback claro sobre a falha.

#### **3. Importar uma planilha vazia:**
- **Objetivo:** Validar que o sistema lida corretamente com a importação de uma planilha vazia.
- **Resultado Esperado:** O sistema deve exibir uma mensagem informando que não há dados a serem importados.
- **Resultado Obtido:** 
    [Erro] Falta de mensagem informando planilha vazia
    Descrição:
        A aplicação não exibiu a mensagem de feedback sobre a planilha vazia durante a tentativa de importação para o sistema. 
    Comportamento observado:
        - O sistema não aceitou a planilha vazia, como o esperadi, mas não exibiu o feedback do sistema.

#### **4. Validar mensagens de feedback:**
- **Objetivo:** Garantir que o sistema forneça feedback adequado durante o processo de importação.
- **Resultado Esperado:** O sistema deve exibir mensagens claras durante o processo de importação (sucesso, erro, dados ausentes).
- **Resultado Obtido:** 
    [Erro] Falta de mensagens de feedback
    Descrição:
        Não foram exibidas mensagens de feedback durante o processo de importação, nem para sucesso nem para erros.
    Comportamento observado:
        - A importação de dados ocorreu corretamente, mas o sistema não comunicou o status da operação para o usuário.

## Critérios de Aceitação:

- **Importação de Planilha Válida:** O sistema deve importar corretamente os dados da planilha Excel válida.
- **Mensagem de Sucesso:** A mensagem "Importação realizada com sucesso" deve ser exibida ao usuário admin após uma importação bem-sucedida.
- **Rejeição de Planilhas Inválidas:** O sistema deve rejeitar planilhas com formato inválido e exibir uma mensagem de erro clara.
- **Mensagem de Planilha Vazia:** O sistema deve exibir uma mensagem informando que a planilha está vazia, caso não haja dados.
- **Sem Erros ou Falhas:** Não devem ocorrer erros ou falhas inesperadas durante o processo de importação.

## Resumo dos Resultados Obtidos:

- **Importação de Planilha Válida:** Funcionou, mas sem mensagem de feedback.
- **Importação de Planilha Inválida:** Funcionou parcialmente, aceitando planilhas com dados ou formatos inválidos, mas sem exibir erro adequado.
- **Importação de Planilha Vazia:** Não foi exibida mensagem de feedback informando a ausência de dados.
- **Mensagens de Feedback:** Não houve mensagens de feedback durante a importação, o que prejudica a comunicação com o usuário.

## Conclusão:

A funcionalidade de importação de planilha Excel está parcialmente funcional, mas necessita de melhorias. Embora a importação de dados ocorra corretamente, faltam mensagens de feedback claras e adequadas para o usuário, especialmente em casos de erro ou ausência de dados. A aplicação também deve rejeitar formatos inválidos de planilhas de maneira mais eficaz, com a exibição de mensagens de erro apropriadas.
