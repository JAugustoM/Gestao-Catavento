
# Documentação de Testes Manuais - Operações CRUD e Filtragem

## Objetivo do Teste Unitário:

O objetivo deste teste é garantir que as operações básicas de manipulação de demandas na aplicação funcionem corretamente. As operações cobertas pelo teste incluem **Criação (Create)**, **Leitura (Read)**, **Atualização (Update)**, **Exclusão (Delete)** e **Filtragem (Filter)**. Cada uma dessas operações deve ser realizada com sucesso, sem erros ou falhas de dados.

## Operações Testadas:

### 1. Criação (Create):
- **Objetivo:** Garantir que uma nova demanda seja criada corretamente.
- **Resultado Esperado:** A demanda criada será registrada com sucesso, com os dados corretos (nome, código, descrição, data e outros campos relevantes) refletidos no estado da aplicação.
- **Resultado Obtido:** 
    [Erro] Falha ao adicionar imagem na funcionalidade "Adicionar Demanda"
    Descrição:
        Ao tentar adicionar uma imagem no botão "Adicionar Demanda", ocorre um erro com a seguinte mensagem:
        "Error adding request - PostgrestException(message: Could not find 'requests' column 'image_url' in schema cache, code: PGRST204, details: Invalid request, hint: null)"

    Comportamento observado:
        - Apesar do erro, os dados inseridos na demanda não são perdidos. Mesmo ao clicar em “Confirmar Saída”, a janela é fechada, mas os dados permanecem ao reabrir;
        - Não há um botão de “Excluir” imagem, impossibilitando a remoção sem reiniciar o sistema;
        - Para realizar novos testes no botão "Adicionar Demanda", foi necessário reiniciar o projeto;
        - A janela de "adiconar demanda" não tem campo para adiconar de qual plataforma o pedido pertence.  

### 2. Leitura (Read):
- **Objetivo:** Garantir que as demandas existentes/adiconados a lista sejam carregadas corretamente.
- **Resultado Esperado:** O estado será atualizado com as demandas corretas.
- **Resultado Obtido:** 
    [Erro] Código da demanda não exibido corretamente
    Descrição:
        Ao adicionar uma nova demanda com o campo "Código" preenchido, a informação não é exibida corretamente ao acessar o componente de visualização. Em vez do código inserido, aparece a mensagem "Sem código".

    Comportamento observado:
        - O campo "Código" é preenchido corretamente no momento da adição da demanda, mas ao abrir o componente para visualizar as informações, o código não aparece;
        - Os demais campos, como "Nome", "Data do Pedido", "Prazo" e "Descrição", são exibidos corretamente.

### 3. Atualização (Update):
- **Objetivo:** Garantir que as demandas existentes possam ser atualizadas corretamente.
- **Resultado Esperado:** A demanda será atualizada corretamente com os novos dados (como nome e descrição), e o estado será refletido com as mudanças.
- **Resultado Obtido:** 
        [Erro] Dados não recuperados no componente "Editar Demanda"
        Descrição:
            Ao acessar o componente de edição de demanda, os dados existentes não são carregados automaticamente, obrigando o usuário a reescrever todo o conteúdo ao invés de editar apenas partes específicas.

        Comportamento observado:
            - O componente de edição é funcional e permite alterar os dados e atualizá-los corretamente, no entanto, ao abrir a demanda para edição, os campos aparecem vazios em vez de preencherem recuperando os dados atuais;
            - Para modificar qualquer informação, é necessário reescrever todo o conteúdo do campo.

### 4. Exclusão (Delete):
- **Objetivo:** Garantir que as demandas possam ser excluídas corretamente.
- **Resultado Esperado:** A demanda será excluída com sucesso, e o estado será atualizado para refletir a remoção da demanda, com a lista de demandas sendo reduzida adequadamente.
- **Resultado Obtido:** 
        [Erro] Bolo não removido da lista de demandas
        Descrição:
            Ao excluir um bolo da lista de demandas, a mensagem "Bolo removido com sucesso" é exibida, porém o item continua visível na lista e ainda pode ser encontrado na busca.

        Comportamento observado:
            - A mensagem de remoção é exibida corretamente;
            - O bolo não desaparece da lista de demandas após a exclusão;
            - O item ainda pode ser localizado por meio da barra de busca.

### 5. Filtragem (Filter):
- **Objetivo:** Garantir que as demandas possam ser filtradas corretamente com base em um critério específico.
- **Resultado Esperado:** O sistema retornará apenas as demandas que atendem ao critério de filtragem (por exemplo, filtrando pela loja "Site"), e o estado será atualizado com a lista filtrada de demandas.
- **Resultado Obtido:** A funcionalidade do filtro foi testado com sucesso. Quando o filtro foi aplicado para selecionar a loja "Site", o teste confirmou que o sistema retornou corretamente as demandas associadas à loja "Site", e a lista filtrada foi atualizada com sucesso.

## Resumo dos Resultados Obtidos:

- **Criação:** A criação de novas demandas foi realizada corretamente, mas a demanda não permite adicionar imagem do produto.
- **Leitura:** As demandas existentes foram carregadas corretamente, com alguns dados inválidos.
- **Atualização:** As demandas foram atualizadas corretamente, mas os dados não são recuperados ao editar, obrigando o preenchimento completo de todos os campos.
- **Exclusão:** A exclusão de uma demanda foi realizada com sucesso, mas a demanda não desaparece da lista após a exclusão e continua aparecendo na busca.
- **Filtragem:** A filtragem das demandas foi bem-sucedida, e a lista filtrada foi exibida corretamente no estado da aplicação.

## Conclusão:

Todos os testes para as operações **CRUD** e **Filtragem** funcionam em sua maioria, mas há falhas, como a demanda excluída não desaparecendo da lista e da busca, e a edição de demandas que não recupera os dados para edição parcial. Essas inconsistências precisam ser corrigidas para melhorar a experiência do usuário.