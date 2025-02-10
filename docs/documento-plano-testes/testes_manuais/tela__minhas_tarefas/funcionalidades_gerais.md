# Documentação de Testes Manuais - Tela Minhas Tarefas (Funcionário)

## Objetivo do Teste Manual:
O objetivo deste teste é garantir que as funcionalidades relacionadas a tela de "Minhas Tarefas" do funcionário funcione corretamente como os botões de inciar/finalizar tarefa, feedbacks, e atualização de informações estejam funcionando corretamente, além de identificar erros e melhorias necessárias.

## Operações Testadas:

### 1. Funcionamento dos Botões “Iniciar Bolo” e “Finalizar Bolo”:
- **Objetivo:** Garantir que os botões de “Iniciar Bolo” e “Finalizar Bolo” funcionem corretamente.
- **Resultado Esperado:** Os botões devem funcionar sem falhas e alterar o status da tarefa corretamente.
- **Resultado Obtido:**  
    **[Sem erros]** Ambos os botões funcionam corretamente.
    - **Comportamento Observado:**  
        - O botão “Iniciar Bolo” inicia a tarefa sem problemas, e o botão “Finalizar Bolo” conclui a tarefa corretamente.

### 2. Informações no Card da Tarefa (Código, Descrição):
- **Objetivo:** Garantir que o card da tarefa exiba as informações corretamente (código, descrição).
- **Resultado Esperado:** O card deve mostrar o código e a descrição da tarefa de forma correta.
- **Resultado Obtido:**  
    **[Sem erros]** O card exibe as informações corretamente.
    - **Comportamento Observado:**  
        - O código e a descrição são exibidos de forma clara e precisa.

### 3. Ampliação da Foto do Bolo:
- **Objetivo:** Garantir que seja possível ampliar a foto do bolo ao clicar nela.
- **Resultado Esperado:** A foto deve ser ampliada corretamente ao ser clicada.
- **Resultado Obtido:**  
    **[Sem erros]** A foto do bolo pode ser ampliada sem problemas.
    - **Comportamento Observado:**  
        - A ampliação da foto ocorre corretamente ao clicar sobre ela.

### 4. Exibição das Mensagens de Feedback:
- **Objetivo:** Garantir que as mensagens de feedback sejam exibidas corretamente.
- **Resultado Esperado:** As mensagens de feedback devem aparecer corretamente e em tempo hábil.
- **Resultado Obtido:**  
    **[Sem erros]** As mensagens de feedback são exibidas corretamente.
    - **Comportamento Observado:**  
        - As mensagens de feedback são claras e aparecem na tela sem falhas.

### 5. Atualização da Pilha de Tarefas:
- **Objetivo:** Garantir que a pilha de tarefas seja atualizada corretamente após a finalização de uma tarefa.
- **Resultado Esperado:** A pilha deve ser atualizada corretamente com a remoção da tarefa finalizada.
- **Resultado Obtido:**  
    **[Sem erros]** A pilha de tarefas é atualizada corretamente.
    - **Comportamento Observado:**  
        - A pilha de tarefas reflete a finalização das tarefas corretamente.

### 6. Mensagem de Feedback Após Concluir Todas as Tarefas:
- **Objetivo:** Garantir que a mensagem de feedback de conclusão de todas as tarefas seja exibida corretamente.
- **Resultado Esperado:** Uma mensagem de feedback deve aparecer informando que todas as tarefas foram concluídas.
- **Resultado Obtido:**  
    **[Sem erros]** A mensagem de feedback aparece corretamente.
    - **Comportamento Observado:**  
        - A mensagem de feedback aparece assim que todas as tarefas são finalizadas.

### 7. Erro ao Finalizar Tarefa Muito Rapidamente:
- **Objetivo:** Identificar o erro ao finalizar a tarefa rapidamente, no mesmo segundo, causando a travamento da pilha de tarefas.
- **Resultado Esperado:** O sistema não deve travar ou exibir mensagens de erro inesperadas ao finalizar a tarefa rapidamente.
- **Resultado Obtido:**  
    **[Erro]** Quando a tarefa é finalizada muito rapidamente, a pilha de tarefas trava e exibe a mensagem “Erro ao finalizar trabalho”.
    - **Comportamento Observado:**  
        - Após o erro, as tarefas somem ao trocar de tela, mas a seção “Desempenho” ainda mostra bolos a serem concluídos. Mesmo após sair e entrar na conta novamente ou compilar o projeto, a pilha de tarefas não retorna.
    - **Status do Erro:** Este erro já é de conhecimento da equipe de backend, que está trabalhando para implementar a melhoria e corrigir o funcionamento adequado.

### 8. Ideia de Melhoria - Elemento Visual para Tempo de Produção:
- **Objetivo:** Verificar a viabilidade de adicionar um elemento visual para indicar o tempo de produção por tarefa.
- **Resultado Esperado:** Um cronômetro ou relógio deverá ser exibido, mostrando o tempo de produção de cada tarefa.
- **Resultado Obtido:**  
    **[Melhoria sugerida]** A ideia de adicionar um elemento visual de tempo de produção é pertinente e pode melhorar a experiência do usuário.
    - **Comportamento Observado:**  
        - A adição de um cronômetro ou relógio ajudaria os funcionários a monitorarem o tempo de cada tarefa de maneira clara.

## Resumo dos Resultados Obtidos:
- **Botões “Iniciar Bolo” e “Finalizar Bolo”:** Funcionando corretamente.  
- **Card da Tarefa (Código, Descrição):** Funcionando corretamente.  
- **Ampliação da Foto do Bolo:** Funcionando corretamente.  
- **Mensagens de Feedback:** Funcionando corretamente.  
- **Atualização da Pilha de Tarefas:** Funcionando corretamente.  
- **Mensagem de Feedback após Concluir Todas as Tarefas:** Funcionando corretamente.  
- **Erro ao Finalizar Tarefa Rapidamente:** Erro identificado (pilha de tarefas trava e não atualiza). A equipe de backend já está ciente desse problema e está trabalhando para implementar a correção e melhorar o funcionamento. 
- **Ideia de Melhoria - Elemento Visual para Tempo de Produção:** Sugestão a ser válidada para melhorar a interface.

## Conclusão:
A maioria das funcionalidades está funcionando corretamente, incluindo os botões de tarefa, feedbacks e a pilha de tarefas. No entanto, há um erro ao tentar finalizar uma tarefa muito rapidamente, que causa o travamento da pilha e a exibição de uma mensagem de erro. A ideia de adicionar um cronômetro para monitoramento do tempo de produção pode ser uma melhoria útil para a experiência do usuário.
