# [VISÃO DO PRODUTO E PROJETO](https://unbbr.sharepoint.com/:w:/r/sites/MDS20242/_layouts/15/Doc2.aspx?action=edit&sourcedoc=%7B4ffe2197-4db2-4cbc-88df-397200886215%7D&wdOrigin=TEAMS-WEB.teamsSdk_ns.rwc&wdExp=TEAMS-TREATMENT&wdhostclicktime=1733011856568&web=1)

## 1 Visão Geral do Produto

### 1.1 Produto

A empresa Catavento, cliente da equipe Fehu, é especializada na manufatura e comercialização de produtos para festas, com destaque para os bolos "fakes". No momento, o processo produtivo desses bolos é gerenciado de maneira informal e manual, utilizando uma planilha de demandas. Esta planilha é impressa e distribuída entre os departamentos responsáveis. Após a conclusão das demandas, os funcionários registram as informações diretamente na planilha, o que pode gerar inconsistências e dificultar o acompanhamento do processo.

Além disso, a cliente mencionou situações em que os funcionários, conscientes de todas as demandas futuras, tendem a priorizar a entrega de tarefas mais simples em detrimento das que exigem maior esforço. 

Nesse contexto, surge a oportunidade de implementar uma solução tecnológica que centralize o controle das demandas. Essa abordagem permitirá que: 

- Gerentes de cada departamento tenham acesso em tempo real ao status de cada demanda, assegurando um melhor controle da produção. 
- Funcionários possam visualizar apenas a demanda atual, evitando a priorização de tarefas específicas em detrimento de outras, o que promoverá uma gestão mais equilibrada e eficiente das atividades. 

### 1.2 Declaração de Posição do Produto 

Após a identificação do problema e da oportunidade de solução mencionados anteriormente, apresentamos no Quadro 1, a seguir, a declaração de posição do produto. Esta declaração compila as informações essenciais sobre a visão da equipe em relação ao produto a ser desenvolvido, as necessidades que ele atende e sua posição no mercado atual. 

|                      |                                                     |
|       ----:          | :----                                               |
| Para:                | Empresa Catavento                                   |
| Necessidade:         | uma solução tecnológica para a gerência de demandas |
| O (nome do produto): | Catavento é um App mobile                           |
| Que:                 | centraliza as demandas de cada departamento, permitindo o lançamento e acompanhamento de demandas em tempo real pelos gerentes e a apresentação das demandas em forma estritamente sequencial aos funcionários |
| Ao contrário:        | tecnologias voltadas para o gerenciamento de projetos como o Trello ou o Slack poderiam substituir o método atual de gerenciamento |
| Nosso produto:       | porém, o Catavento será uma ferramenta especializada em atender nas necessidades da cliente, adaptada ao contexto produtivo da empresa. |

### 1.3 Objetivos do Produto

O aplicativo tem como principal objetivo otimizar o gerenciamento das demandas do processo produtivo dos bolos "fakes". Ele substituirá a abordagem atual, que utiliza uma planilha impressa, por uma solução tecnológica que facilitará o controle da produção. 

Adicionalmente, o aplicativo será capaz de gerar relatórios de desempenho para cada funcionário, o que permitirá um cálculo mais eficiente dos bônus por atingimento de metas específicas e contribuirá para uma gestão mais eficaz da equipe.

### 1.4 Tecnologias a Serem Utilizadas

Para o desenvolvimento do projeto, serão empregadas as seguintes tecnologias: 

- Linguagem Dart: Esta é a principal linguagem utilizada, tanto para a definição do frontend através do Flutter, quanto para a implementação da lógica de negócios e a comunicação com o Supabase. 
- Flutter: Um framework de desenvolvimento mobile multiplataforma, que será utilizado na construção do frontend da aplicação. 
- Supabase: Um serviço de backend que oferece diversas ferramentas, incluindo comunicação com um banco de dados PostgreSQL e autenticação de usuários com diferentes níveis de acesso, entre outros recursos. 

## 2 VISÃO GERAL DO PROJETO

### 2.1 Ciclo de vida do projeto de desenvolvimento de software 

![Ciclo de Vida do Projeto](./assets/ciclo-de-vida-do-projeto.jpg)

Primeiramente, o desenvolvimento em prazo limitado (1 semestre) exige a escolha de uma metodologia ágil que permita entregas rápidas e flexibilidade para ajustes ao longo do tempo, além de acomodar mudanças de forma aceitável. De acordo com Wonohardjo et al. (2019): 

> Scrum is often used to face complex problems in software development process and has been proven to increase productivity and reducing software development cost. Scrum deliver the software in iterations, that means the software is delivered in partial, so any changes or problems can be handled before all parts of software is ready to deliver. (Wonohardjo et al., 2019) 

Dessa forma, o produto deve ser entregue de maneira incremental, trabalhando e lançando versões ao longo do desenvolvimento para receber feedback e realizar ajustes necessários antes da versão final.  

A solução proposta é um aplicativo mobile desenvolvido com Flutter, sendo possível compilar o aplicativo para Android e iOS a partir de uma base de código única, agilizando o desenvolvimento. O backend será suportado por Dart e o banco de dados pelo Supabase. A escolha da linguagem Dart se alinha ao uso do Flutter, facilitando a criação de uma interface com compatibilidade para as funcionalidades do frontend. 

A metodologia ScrumXP foi escolhida por combinar a estrutura do Scrum, que permite ciclos curtos e feedback frequente, com as práticas do Extreme Programming (XP), como o "Pair Programming" e a integração contínua. De acordo com Sahota (2011), conforme citado por dada (2022), as práticas Scrum precisam ser integradas ao XP para garantir um projeto bem-sucedido, embora existam práticas que se sobrepõem entre os dois métodos. Assim, com sprints definidas de 10 dias, é possível lançar incrementos rapidamente, receber feedback e ajustar o desenvolvimento conforme necessário. As práticas do XP, como a refatoração continua e a programação em pares ajudam no desenvolvimento e a manter o código organizado. A flexibilidade proporcionada pelo ScrumXP permite adaptar o projeto a novos requisitos ou alterações de prioridades, maximizando o valor entregue em um semestre para a cliente. 

O projeto será organizado por meio de histórias de usuário, que capturam as necessidades dos usuários e as traduzem em funcionalidades. Reuniões diárias (Daily Scrum) ajudam a manter o progresso alinhado e identificar dificuldades, e ao final de cada sprint serão realizadas Sprint Reviews para revisar o progresso e retrospectivas para identificar o que pode ser melhorado. 

As ferramentas escolhidas para o gerenciamento e desenvolvimento incluem o Figma, para organizar o backlog, acompanhar o progresso das tarefas, composição de diagramas e protótipos, e o GitHub, para controle de versão e integração contínua. O Microsoft Teams será utilizado para comunicação rápida entre a equipe, Visual Studio Code para programação em Dart e Flutter e programação em pares com extensões. 

Logo, conclui-se que a escolha do ScrumXP é apropriada devido à necessidade de ciclos curtos e feedback contínuo, essenciais para o projeto devido à curta duração e com requisitos mutáveis, além dos métodos e ferramentas suportarem um desenvolvimento incremental, ágil e prático. 

### 2.2 Organização do Projeto

Para desenvolver o código cada membro da equipe desempenhará um papel baseado nas suas competências individuais e na necessidade do projeto, como pode ser observado na tabela abaixo. Esta divisão, porém, não tem o objetivo de limitar a atuação dos membros da equipe a apenas os papeis estabelecidos abaixo, ao passo que as demandas do projeto mudam a organização interna da equipe se adapta a fim de suprir a necessidade. 

| Papel         | Atribuições    | Responsável   | Participantes |
| :-----------: | :------------: | :-----------: | :-----------: |
| Desenvolvedor | Codificar o produto, codificar testes unitários, realizar refatoração | Henrique | Daniel, Danielle, Gabriela, Henrique, José, Leticia, Maria Eduarda, Maria Samara, Mariana, Pedro |
| Dono do Produto | Atualizar o escopo do produto, organizar o escopo das sprints, validar as entregas | Henrique | Henrique |
| Analista de Qualidade | Garantir a qualidade do produto, garantir o cumprimento do conceito de pronto, realizar inspeções de código, executar testes, identificação de erros e defeitos, planejamento de testes | Maria Eduarda, Mariana | Maria Eduarda, Mariana | 
| Analista de Requisitos | Fazer o levantamento dos requisitos, analisar e documentar os requisitos, priorizar os requisitos de acordo com o objetivo do produto, gerenciar as mudanças de requisitos  | Henrique, Maria Eduarda, Pedro | Henrique, Maria Eduarda, Pedro |
| Designer de Protótipos | Criar modelos iniciais do produto, fazer a validação das do design, interações e funcionalidades  | Danielle, Leticia, Mariana, Maria | Danielle, Leticia, Mariana, Maria Samara |
| Cliente | Validar os requisitos e protótipos, fornecer feedbacks | Poliana | Poliana |

### 2.3 Planejamento das Fases e/ou Iterações do Projeto 

Primeiramente, depois de uma análise em conjunto do time, decidiu-se que o mais adequado seria dividir o trabalho em 5 sprints, sendo que, de 2 em 2, forma-se uma release. As sprints que contêm itens do backlog mais importantes foram atribuídas para o início e meio do projeto e, as que contêm itens do backlog menos críticos, foram deixadas para o final. A menor quantidade de atividades a serem feitas nas últimas sprints foi pensada para acomodar possíveis débitos técnicos restantes de alguma sprints. Dessa forma, a tabela 2 mostra em detalhes o planejamento das sprints: 

| Sprint   | Produto (Entrega) | Data Início | Data Fim | Entregável(eis) | Responsáveis | % conclusão |
| :------: | :---------------: | :---------: | :------: | :-------------: | :----------: | :---------: |
| Sprint 1 | Integração Básica e Sistema de gerência de demandas. | 25/11/2024 | 05/12/2024 | Integração com planilha do Microsoft 365; CRUD de demandas; Página do gerente/admin para gerenciar demandas | Frontend, Backend, Banco de dados, Testes | 20% |
| Sprint 2 | Sistema de gerência de usuários tipo funcionário e sistema de login. | 05/12/2024 | 15/12/2024 | CRUD de funcionários; Página de gerenciamento de funcionários; Sistema de autenticação; Página de login | Frontend, Backend, Banco de dados, Testes | 40% |
| Sprint 3 | Funcionalidades focadas no funcionário e na navegação no aplicativo. | 15/12/2024 | 25/12/2024 | Página de desempenho de funcionários; Página de demandas para funcionários; Menu de navegação lateral | Frontend, Backend, Banco de dados, Testes | 60% |
| Sprint 4 | Metas de funcionários e prioridades | 25/12/2024 | 05/01/2024 | Página de metas de funcionários; Quadro de prioridades | Frontend, Backend, Banco de dados, Testes | 80% |
| Sprint 5 | Relatórios e refinamentos | 05/01/2024 | 15/01/2024 | Geração de relatórios; Ajustes e refinamentos com base no feedback | Frontend, Backend, Banco de dados | Testes | 100% | 