# Documentação de Testes Manuais - Operações CRUD e Filtragem da Tela de Produtos

## Objetivo do Teste Manual

O objetivo deste teste é garantir que as operações básicas de adicionar produtos na aplicação funcionem corretamente. As operações cobertas pelo teste incluem **Criação (Create)**, **Leitura (Read)**, **Atualização (Update)**, **Exclusão (Delete)** e **Filtragem (Filter)**. Cada uma dessas operações deve ser realizada com sucesso, sem erros ou falhas de dados.

## Operações Testadas

### 1. Criação (Create)
- **Objetivo:** Garantir que um novo produto seja criado corretamente.
- **Resultado Esperado:** O produto criado será registrado com sucesso, com os dados corretos refletidos no estado da aplicação.
- **Resultado Obtido:**  
    [Sem erros] Funcionalidade de criação funcionando corretamente  
    Descrição: 
        A funcionalidade funciona como esperado. No entanto, não há indicação de campos obrigatórios ou mensagens de erro caso algum campo necessário não seja preenchido.  
    Comportamento observado: 
        - O produto é adicionado corretamente à lista de produtos;  
        - Não há validação visual para campos obrigatórios.  

### 2. Leitura (Read)
- **Objetivo:** Garantir que os produtos existentes sejam carregados corretamente.
- **Resultado Esperado:** O estado será atualizado com os produtos corretos.
- **Resultado Obtido:**  
    [Sem erros] Funcionalidade de leitura funcionando corretamente  
    Descrição:
        O sistema apresenta todas as informações corretamente.  
    Comportamento observado:
        - Todos os produtos adicionados são exibidos corretamente na tela;  

### 3. Atualização (Update)
- **Objetivo:** Garantir que os produtos existentes possam ser atualizados corretamente.
- **Resultado Esperado:** O produto será atualizado corretamente com os novos dados e o estado refletirá as mudanças.
- **Resultado Obtido:**  
    [Erro] Edição de produto limitada ao campo "Descrição"  
    Descrição: 
        A funcionalidade de editar um produto não funciona corretamente, pois apenas o campo "Descrição" pode ser modificado.  
    Comportamento observado:
        - Ao tentar editar outros campos, as alterações não são salvas;  
        - Apenas o campo "Descrição" permite edição e atualização com sucesso.  

### 4. Exclusão (Delete)
- **Objetivo:** Garantir que os produtos possam ser excluídos corretamente.
- **Resultado Esperado:** O produto será excluído com sucesso, e o estado será atualizado para refletir a remoção, com a lista de produtos reduzida adequadamente.
- **Resultado Obtido:**  
    [Sem erros] Funcionalidade de exclusão funcionando corretamente.  
    Descrição:  
        A funcionalidade de exclusão funciona como esperado, removendo corretamente o produto da lista.  
    Comportamento observado:  
        - O produto é removido corretamente após a confirmação;  
        - A lista é atualizada e o produto excluído não aparece mais.  

### 5. Filtragem (Filter)
- **Objetivo:** Garantir que os produtos possam ser filtrados corretamente com base em um critério específico.
- **Resultado Esperado:** O sistema retornará apenas os produtos que atendem ao critério de filtragem, e o estado será atualizado com a lista filtrada de produtos.
- **Resultado Obtido:**  
    [Erro] Funcionalidade de filtragem não funciona.  
    Descrição: 
        A funcionalidade de filtragem não retorna resultados corretamente. Ao aplicar um filtro, a lista de produtos não é alterada.  
    Comportamento observado: 
        - O critério de filtragem é aplicado, mas a lista permanece inalterada;    

## Resumo dos Resultados Obtidos

- **Criação:** A funcionalidade funciona como esperado, mas não há indicação de campos obrigatórios.  
- **Leitura:** As informações dos produtos são exibidas corretamente.  
- **Atualização:** Apenas a descrição pode ser editada, os demais campos não permitem modificação.  
- **Exclusão:** Funciona corretamente.  
- **Filtragem:** A funcionalidade de filtragem **não está funcionando**.   

## Conclusão

As operações de **CRUD** e **Filtragem** apresentam algumas inconsistências. Enquanto a criação e a exclusão de produtos funcionam como esperado, a edição está limitada à descrição, e a filtragem não funciona. Além disso, não há mensagens de erro ao tentar adicionar um produto sem preencher todos os campos obrigatórios. Essas falhas precisam ser corrigidas para garantir uma experiência do usuário mais intuitiva e eficiente.
