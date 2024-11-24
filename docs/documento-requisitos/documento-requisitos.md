# Requisitos do projeto - Grupo 4 (Fehu)


## **Projeto**

Sistema de Gerenciamento de produção para empresa de bolo fake.

## **Problema**

A empresa necessita de um sistema que cadastre as demandas de bolo fake que precisam ser feitas no dia.

## **Contexto**

O projeto será desenvolvido para a empresa “Catavento Festa dos Sonhos”, especializada em bolos fake.

A empresa produz de 180 a 200 bolos por dia, das 8h às 18h. O processo de produção de bolos fake envolve, principalmente, três departamentos: cobertura; aplique; e montagem.

A dificuldade relatada se refere ao gerenciamento de cada etapa da produção entre os departamentos.

## **Descrição dos requisitos**

### Requisitos funcionais

Requisitos funcionais descrevem as funcionalidades e as ações que um sistema ou produto deve ser capaz de executar. Eles detalham as tarefas específicas que este produto deve realizar para atender às necessidades do usuário.

Seguem, na tabela a seguir, os requisitos funcionais do projeto:

| **RF01** | O sistema deverá considerar dois tipos de perfil de usuário: o funcionário de um departamento e o administrador do sistema. |  |
| --- | --- | --- |
| **RF02** | Somente o administrador deverá ser capaz de cadastrar a conta de um usuário no sistema. |  |
| **RF03** | A conta de usuário deverá apresentar: nome; e-mail; senha; e departamento. |  |
| **RF04** | O usuário deverá ser capaz de entrar e sair de sua conta no sistema. |  |
| **RF05** | O sistema deverá ser capaz de produzir uma lista única de pedidos de bolos fake. |  |
| **RF06** | Cada item da lista deverá possuir: código de identificação único do produto; imagem do produto; data do pedido; prazo para entrega; descrição do produto, com especificação de cores; e as atividades relacionadas a cada departamento. |  |
| **RF07** | Somente o administrador deverá ser capaz de visualizar todos os itens da lista. |  |
| **RF08** | O administrador deverá ser capaz de adicionar pedidos à lista a partir de uma planilha eletrônica. |  |
| **RF09** | O administrador deverá ser capaz de editar pedidos da lista. |  |
| **RF10** | O administrador deverá ser capaz de excluir pedidos da lista. |  |
| **RF11** | O sistema deverá ordenar os pedidos na lista conforme prioridade. |  |
| **RF12** | O sistema deverá exibir ao usuário apenas um item da lista por vez. |  |
| **RF13** | Considerando-se um mesmo item com atividades referentes a cada departamento, todos os usuários deverão ser capazes de visualizar a situação de cada atividade de cada departamento (não iniciada, em andamento, concluída). |  |
| **RF15** | O usuário deverá cumprir a atividade de um item relacionada ao seu departamento para que o próximo item e sua atividade correspondente seja exibido a ele. |  |
| **RF16** | Caso a demanda referente a um departamento seja iniciada por determinado usuário, **apenas** os outros usuários do mesmo departamento deverão ser capazes de visualizar o próximo item e suas atividades correspondentes. |  |
| **RF17** | Cada usuário de um departamento deverá ser capaz de iniciar **apenas** uma atividade (correspondente ao seu departamento) de um item por vez, e cumpri-la por meio de um botão. |  |
| **RF18** | O administrador deverá ser capaz de visualizar a situação de cada atividade (não iniciada, em andamento, concluída) associada a cada item da lista. |  |
| **RF19** | O administrador deverá conseguir desfazer uma atividade cumprida por engano pelo menu de demandas e atividades respectivas. |  |
| **RF20** | O usuário deverá ser capaz de visualizar o próprio desempenho, por meio de número de atividades concluídas e número de atividades a serem concluídas para o atingimento da meta diária de produção estabelecida. |  |
| **RF21** | O administrador deverá conseguir gerar/visualizar um relatório de produtividade referente a dias, semanas, e mês passado; por usuário e por departamento. |  |
| **RF22** | O administrador deverá ser capaz de visualizar todos os usuários do sistema, e detalhes(nome, email, departamento) sobre o seu perfil. |  |


### Requisitos não-funcionais

Requisitos não funcionais descrevem características e qualidades do sistema ou produto. Eles estão relacionados a aspectos como desempenho, confiabilidade, segurança, usabilidade e compatibilidade.

Seguem, na tabela a seguir, os requisitos não-funcionais do projeto:

|  |  |  |
| --- | --- | --- |
|  | **DESEMPENHO** |  |
| **RNF01** | O tempo máximo de resposta para operações como login, cadastro de pedidos e conclusão de atividades deve ser inferior a X tempo (segundos/minutos). |  |
|  | **CONFIABILIDADE** |  |
| **RNF02** | O armazenamento de dados deve garantir integridade de disponibilidade de 99,9% do tempo durante o horário de operação (8h às 18h). |  |
|  | **SEGURANÇA** |  |
| **RNF03** | A segurança do sistema deverá garantir acesso controlado baseado nos perfis de usuário, diferenciando permissões de funcionários e administradores. |  |
| **RNF04** | O sistema deverá implementar um mecanismo de verificação para confirmar que as atividades foram realmente realizadas, utilizando evidências como fotos (por exemplo) anexadas ao registro de conclusão. |  |
|  | **USABILIDADE** |  |
| **RNF05** | A interface deve ser intuitiva e fácil de usar, permitindo que usuários de diferentes níveis técnicos operem o sistema sem dificuldade. |  |
| **RNF06** | A aplicação deverá adotar boas práticas de acessibilidade para que seja inclusiva a todos os usuários. |  |
|  | **COMPATIBILIDADE** |  |
| **RNF07** | O sistema deve ser compatível com dispositivos tablet, garantindo uma interface otimizada para telas médias |  |
| **RNF07** | O sistema deverá ser escalável para suportar o aumento na quantidade de usuários e demandas de produção, sem comprometimento no desempenho |  |

## **Resultados Esperados**

Espera-se que a equipe entregue a aplicação funcional em relação a filas de demandas, CRUD de usuarios (funcionários), CRUD de pedidos e ADM, importação da planilha e que no máximo, só não entregue o sistema de gerar relatórios de dias passados, ou semana, ou mês.
