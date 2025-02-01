# Documentação de Testes Manuais - Operações CRUD da página de Funcionários

## Objetivo do Teste Manuais:

O objetivo deste teste é garantir que as operações básicas de manipulação de funcionários na aplicação funcionem corretamente. As operações cobertas pelo teste incluem **Criação**, **Leitura**, **Atualização**, **Exclusão**, e funcionalidades gerias relacionadas ao processo de cadastro de funcionários.

## Operações Testadas:

### 1. Criação (Create):
- **Objetivo:** Garantir que a funcionalidade de adicionar um novo funcionário funcione corretamente.
- **Resultado Esperado:** O funcionário será adicionado com sucesso, com todos os campos necessários preenchidos e validados corretamente.
- **Resultado Obtido:** 
    [Erro] Falta de validação de campos obrigatórios
    Descrição:
        Não há validação para garantir que o campo "email" siga um formato correto, como "gmail.com", e os campos obrigatórios, como "gerente/funcionário" e "setor", não exibem mensagens de aviso de campos vazios ou obrigatórios.
    Comportamento observado:
        - O sistema permite adicionar um email sem o domínio correto;
        - Não é exibida nenhuma mensagem informando sobre a obrigatoriedade de marcar "gerente/funcionário" ou escolher um "setor";
        - Não há mensagens de aviso para campos obrigatórios não preenchidos;
        - O novo funcionário é adicionado, mas os dados no formulário não são apagados automaticamente após a criação do funcionário;
        - A falta de filtro na busca de funcionários e a ordenação do novo funcionário no final da lista foram observadas. Seria interessante mover o novo funcionário para o topo da lista.
        
### 2. Leitura (Read):
- **Objetivo:** Garantir que as informações de um funcionário possam ser visualizadas corretamente.
- **Resultado Esperado:** O sistema deve exibir as informações do funcionário de maneira correta e clara ao visualizar o perfil de um funcionário.
- **Resultado Obtido:** 
    [Sem erros] Funcionalidade de visualização funcionando corretamente
    Descrição:
        As informações do funcionário foram carregadas corretamente e exibidas como esperado.
    Comportamento observado:
        - A funcionalidade de visualização está funcionando sem erros, e todas as informações do funcionário são exibidas corretamente.

### 3. Atualização (Update):
- **Objetivo:** Garantir que as informações de um funcionário existente possam ser editadas corretamente.
- **Resultado Esperado:** O sistema permitirá editar as informações de um funcionário existente, com a validação de campos obrigatórios durante a edição.
- **Resultado Obtido:** 
    [Erro] Edição inconsistente de informações
    Descrição:
        A edição de informações do funcionário nem sempre funciona corretamente. O sistema não fornece feedback claro sobre quais informações são obrigatórias durante a edição, o que leva a falhas no processo de atualização.
    Comportamento observado:
        - Em alguns casos, as alterações não são salvas corretamente;
        - Não há feedback sobre os campos obrigatórios que precisam ser preenchidos durante a edição;
        - Não é possível concluir a edição sem saber quais campos estão faltando ou precisam ser corrigidos.

### 4. Exclusão (Delete):
- **Objetivo:** Garantir que o funcionário possa ser excluído corretamente do sistema.
- **Resultado Esperado:** O funcionário será removido com sucesso da lista e o sistema será atualizado adequadamente.
- **Resultado Obtido:** 
    [Sem erros] Exclusão funcionando corretamente
    Descrição:
        A exclusão do funcionário foi realizada corretamente, sem falhas, e a lista de funcionários foi atualizada de acordo.
    Comportamento observado:
        - A funcionalidade de exclusão está funcionando conforme esperado, removendo o funcionário da lista de maneira adequada.

## Resumo dos Resultados Obtidos:

- **Criação:** Funcionou parcialmente, mas sem validação de campos obrigatórios e sem feedback para campos ausentes.
- **Leitura:** Funcionalidade funcionando corretamente, com as informações sendo exibidas como esperado.
- **Atualização:** A edição funcionou de forma inconsistente, com falta de mensagens de erro e validação de campos obrigatórios.
- **Exclusão:** Exclusão do funcionário funcionando como esperado.

## Conclusão:

As funcionalidades de **Criação**, **Leitura** e **Atualização** funcionam de maneira razoável, algumas funcionalidade necessitam de ajustes para garantir que os dados sejam salvos corretamente e que o usuário tenha um feedback claro sobre os campos obrigatórios. Além disso, a experiência do usuário pode ser melhorada com validações de email, mensagens de alerta para campos obrigatórios, e melhorias no processo de busca de funcionários.
