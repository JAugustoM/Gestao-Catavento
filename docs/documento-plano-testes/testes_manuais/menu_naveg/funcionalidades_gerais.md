# Documentação de Testes Manuais - Tela de Login

## Objetivo do Teste Manual:

O objetivo deste teste é garantir que a tela de login esteja funcionando corretamente para diferentes cenários de entrada, incluindo credenciais válidas e inválidas, além de verificar a validação de campos obrigatórios e a exibição de mensagens de erro.

## Operações Testadas:

### 1. Login com Credenciais Válidas:
- **Objetivo:** Garantir que os usuários consigam acessar o sistema corretamente ao inserir credenciais válidas.
- **Resultado Esperado:** O sistema deve autenticar o usuário e redirecioná-lo para a página inicial.
- **Resultado Obtido:**  
    **[Sem erros]** O login ocorre corretamente para administradores e funcionários.
    - **Comportamento Observado:**  
        - O login é rápido e sem atrasos.  
        - A página redireciona corretamente após a autenticação.  

### 2. Login com Credenciais Inválidas:
- **Objetivo:** Garantir que o sistema não permita o acesso com credenciais incorretas.
- **Resultado Esperado:** O sistema deve exibir uma mensagem de erro informando que as credenciais são inválidas.
- **Resultado Obtido:**  
    **[Sem erros]** O sistema bloqueia o acesso e exibe uma mensagem de erro apropriada.
    - **Comportamento Observado:**  
        - A mensagem de erro é exibida imediatamente após a tentativa de login.  
        - Não há delays perceptíveis.  

### 3. Validação de Campos Obrigatórios:
- **Objetivo:** Garantir que o sistema exija o preenchimento dos campos obrigatórios.
- **Resultado Esperado:** O sistema deve exibir uma mensagem de erro informando que o campo é obrigatório.
- **Resultado Obtido:**  
        **[Erro]** O sistema exibe uma mensagem de erro, mas não destaca explicitamente que o campo é obrigatório.
    - **Comportamento Observado:**  
        - O usuário recebe uma mensagem de erro genérica, sem destaque visual.  
        - Não há indicação específica de quais campos precisam ser preenchidos.  

### 4. Feedback Visual e Mensagens:
- **Objetivo:** Avaliar a clareza das mensagens de erro e a usabilidade da interface.
- **Resultado Esperado:** O sistema deve fornecer feedback visual adequado para facilitar a correção de erros pelo usuário.
- **Resultado Obtido:**  
    **[Com melhorias a serem implementadas]**  
        - Falta um botão de "mostrar senha" para facilitar a digitação.  
        - O campo de e-mail não exibe mensagens sobre o formato correto (exemplo: @gmail.com).  
        - Os campos não apresentam bordas vermelhas ou outra indicação visual de erro.  
        - As mensagens de erro são claras e legíveis.  
        - Todas as mensagens de erro são idênticas, sem diferença para diferentes tipos de erro. Confirmação necessária se essa abordagem é intencional.  
    - **Comportamento Observado:**  
        - O usuário não recebe pistas visuais suficientes para corrigir os erros.  
        - A experiência pode ser aprimorada com feedback visual mais claro.  

## Resumo dos Resultados Obtidos:

- **Login com credenciais válidas:** Funcionando corretamente.  
- **Login com credenciais inválidas:** Funcionando corretamente.  
- **Validação de campos obrigatórios:** Mensagens de erro são exibidas, mas sem indicação visual clara.  
- **Feedback visual e mensagens:** Algumas melhorias sugeridas para aprimorar a usabilidade.  

## Conclusão:

A funcionalidade de login está operando conforme o esperado para credenciais válidas e inválidas. No entanto, melhorias podem ser feitas na validação de campos obrigatórios e na usabilidade da interface, especialmente em relação à exibição de mensagens e feedback visual dos erros.
