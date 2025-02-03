# Plano de Teste - Projeto Catavento: Festa dos Sonhos

## 1. Introdução
Este Plano de Testes tem como objetivo definir a abordagem e os critérios para a validação do Projeto Catavento - Festa dos Sonhos. Ele estabelece a estratégia para identificar falhas, garantir a conformidade com os requisitos e assegurar que o sistema funcione corretamente antes da sua disponibilização aos usuários finais. Através deste documento, temos uma métrica dos processos de teste necessários para garantir a qualidade e a estabilidade da plataforma.

## 2. Objetivo do Plano de Teste
O Plano de Testes tem três focos principais:
- **Garantia da Qualidade**: Identificar falhas e inconsistências no sistema, assegurando que todas as funcionalidades atendam aos requisitos estabelecidos.
- **Validação da Conformidade**: Verificar se o sistema segue os padrões técnicos, de requisitos e de usabilidade definidos para o projeto.
- **Estabilidade e Desempenho**: Assegurar que a plataforma opere corretamente sob diferentes condições de uso, garantindo sua estabilidade antes da liberação para os usuários finais.

## 3. Tipos de Testes
Para garantir a cobertura total do sistema, serão realizados os seguintes tipos de testes:

### 3.1 Testes Manuais
Os testes manuais serão conduzidos por um dos integrantes para validar a interface e a experiência do usuário. Esses testes incluirão a navegação pelo sistema, validação de formulários, execução de cenários de uso reais e verificação da responsividade da plataforma.

### 3.2 Testes Unitários
Os testes unitários visam validar o funcionamento correto de cada componente individualmente. Desenvolvidos por um dos integrantes do projeto, estes testes garantem que funções, classes e módulos operem conforme o esperado antes de serem integrados ao sistema.

### 3.3 Testes de Integração
Os testes de integração serão realizados para verificar a comunicação entre diferentes módulos do sistema. O objetivo é garantir que os componentes interajam corretamente, evitando falhas na troca de informações entre partes distintas da aplicação.

## 4. Requisitos do Sistema
- **Requisitos Funcionais**: [Link para requisitos funcionais](https://fga0138-mds-ajax.github.io/2024.2-Fehu/documento-requisitos/documento-requisitos/)
- **Requisitos Não-Funcionais**: [Link para requisitos não-funcionais](https://fga0138-mds-ajax.github.io/2024.2-Fehu/documento-requisitos/documento-requisitos/)

## 5. Cobertura dos Testes

### 5.1 O que será Testado:

#### TESTES MANUAIS: 

**TELA DEMANDA (ADMIN)**:
- Validar CRUD página de demanda (admin) - [(docs/documento-plano-testes/testes_manuais/tela_demanda_adm/crud.md)](docs/documento-plano-testes/testes_manuais/tela_demanda_adm/crud.md)
- Validar importação da planilha excel - [(docs/documento-plano-testes/testes_manuais/tela_demanda_adm/importacao_planilha.md)](docs/documento-plano-testes/testes_manuais/tela_demanda_adm/importacao_planilha.md)
- Validar Funcionalidades Gerais Página

**TELA FUNCIONÁRIO (ADMIN)**:
- Validar Funcionalidades Gerais Página
- Validar CRUD página de Funcionário (admin) - [(docs/documento-plano-testes/testes_manuais/tela_funcionarios_adm/crud.md)](docs/documento-plano-testes/testes_manuais/tela_funcionarios_adm/crud.md)

**TELA PRODUTO (ADMIN)**:
- Validar Funcionalidades Gerais Página
- Validar CRUD página de Funcionário (admin) - [(docs/documento-plano-testes/testes_manuais/tela_produto_adm/crud.md)](docs/documento-plano-testes/testes_manuais/tela_produto_adm/crud.md)

**TELA DESEMPENHO FUNCIONÁRIO (ADMIN)**:
- Validar Funcionalidades Gerais Página

**TELA DESEMPENHO LOJA (ADMIN)**:
- Validar Funcionalidades Gerais Página

**TELA DEMANDAS (FUNCIONÁRIO)**:
- Validar Funcionalidades Gerais Página

**TELA DESEMPENHO (FUNCIONÁRIO)**:
- Validar Funcionalidades Gerais Página

**MENU DE NAVEGAÇÃO**:
- Validar Menu de Navegação - [(docs/documento-plano-testes/testes_manuais/menu_de_naveg/funcionalidades_gerais.md)](docs/documento-plano-testes/testes_manuais/menu_de_naveg/funcionalidades_gerais.md)

**TELA DE LOGIN E LOGOUT**:
- Validar tela Login e Logout - [(docs/documento-plano-testes/testes_manuais/tela_de_login/funcionalidades_gerais.md)](docs/documento-plano-testes/testes_manuais/tela_de_login/funcionalidades_gerais.md)

#### TESTES UNITÁRIOS: 

**TELA DEMANDA (ADMIN)**:
- Validar CRUD página de demanda (admin) - [(docs/documento-plano-testes/testes_unitarios/tela_demanda_adm/crud.md)](docs/documento-plano-testes/testes_unitarios/tela_demanda_adm/crud.md)
- Validar importação da planilha excel - [(docs/documento-plano-testes/testes_unitarios/tela_demanda_adm/planilha.md)](docs/documento-plano-testes/testes_unitarios/tela_demanda_adm/planilha.md)

**TELA FUNCIONÁRIO (ADMIN)**:
- Validar CRUD página de Funcionário (admin) - [(docs/documento-plano-testes/testes_unitarios/tela_funcionarios_adm/crud.md)](docs/documento-plano-testes/testes_unitarios/tela_funcionarios_adm/crud.md)

**TELA PRODUTO (ADMIN)**:
- Validar CRUD página de Funcionário (admin) - [(docs/documento-plano-testes/testes_unitarios/tela_produto_adm/crud.md)](docs/documento-plano-testes/testes_unitarios/tela_produto_adm/crud.md)

**TELA DESEMPENHO FUNCIONÁRIO (ADMIN)**:
- Validar Filtragem
- Validar Campo de Busca

**TELA DESEMPENHO LOJA (ADMIN)**:
- Validar Filtragem
- Validar Campo de Busca

**TELA DEMANDAS (FUNCIONÁRIO)**:
- Validar Funcionalidade backend funcionário

**TELA DESEMPENHO (FUNCIONÁRIO)**:
- Validar Funcionalidade backend funcionário

#### TESTES DE INTEGRAÇÃO: 

**TELA DEMANDA (ADMIN)**:
- Validar integração de formulário - [link-documentação](link-documentação)

**TELA FUNCIONÁRIO (ADMIN)**:
- Validar integração de formulário

**TELA PRODUTO (ADMIN)**:
- Validar integração de formulário

**TELA DEMANDAS (FUNCIONÁRIO)**:
- -

**TELA DESEMPENHO (FUNCIONÁRIO)**:
- -

**MENU DE NAVEGAÇÃO**:
- Validar Menu de Navegação

**TELA DE LOGIN E LOGOUT**:
- Validar tela Login e Logout

> **OBS**: Testes que não estão com link da documentação ainda estão em andamento para testagem.

### 5.2 O que não será Testado:

Em planejamento, está em andamento para o máximo de funcionalidades serem testadas. Até o momento boa parte foi finalizada, e algumas funcionalidades são testadas por testes específicos, ou seja, funcionalidades testadas mas não por todos os testes.

## 6 Metodologia de Teste

### 6.1 Planejamento dos Testes:

Os testes foram planejados e organizados na separação de 3 integrantes, cada um com um teste (unitário, integração e manual). Foram separadas branches para cada integrante trabalhar dentro dos seus testes, sendo de maneira livre a organização dentro de sua branch.  
As documentações dos testes foram divididas dentro da pasta docs, branch docs. Cada teste separado por seu nome e subpastas de cada página (e suas funcionalidades) que foram testadas.

## TESTES MANUAIS

| **FUNCIONALIDADE**                                               | **DESCRIÇÃO DO TESTE**                                                                 | **LOCALIZAÇÃO DO TESTE** |
|------------------------------------------------------------------|----------------------------------------------------------------------------------------|--------------------------|
| **Validar CRUD página de demanda (admin)**                       | Verificar se as operações de criar, ler, atualizar e excluir (CRUD) estão funcionando corretamente na página de demanda para administradores. | -                        |
| **Validar funcionalidades gerais das páginas**                   | Testar a funcionalidade de botões, navegação e carregamento dos elementos das interfaces, garantindo uma experiência fluida e sem falhas para o usuário. | -                        |
| **Validar importação da planilha excel**                         | Testar a funcionalidade de importação de planilhas Excel e garantir que os dados sejam corretamente processados e integrados ao sistema. | -                        |
| **Validar CRUD página de Funcionário (admin)**                    | Garantir que as funcionalidades CRUD para a página de gerenciamento de funcionários estão operando corretamente para administradores. | -                        |
| **Validar CRUD página de Produtos (admin)**                       | Testar as operações de CRUD na página de produtos para administradores, assegurando que o sistema lide com essas ações corretamente. | -                        |
| **Validar Filtragem - Tela de desempenho do funcionário (admin)** | Verificar se a funcionalidade de filtragem da tela de desempenho do funcionário está funcionando corretamente, com base nos critérios definidos. | -                        |
| **Validar Campo de Busca - Tela de desempenho do funcionário (admin)** | Validar a funcionalidade de busca na tela de desempenho do funcionário, garantindo que as pesquisas retornem os resultados esperados. | -                        |
| **Validar Filtragem - Tela de desempenho da loja (admin)**       | Garantir que a filtragem na tela de desempenho da loja esteja funcionando como esperado, permitindo ao administrador visualizar os dados de forma eficiente. | -                        |
| **Validar Campo de Busca - Tela de desempenho da loja (admin)**  | Testar o campo de busca na tela de desempenho da loja para verificar se a funcionalidade está retornando os resultados adequados. | -                        |
| **Validar Tela de Login e Logout**                                | Garantir que a tela de login funcione corretamente, permitindo ao usuário acessar o sistema de forma segura e eficiente. | -                        |
| **Validar Navegação pelo Menu Lateral**                           | Testar a navegação entre as opções do menu lateral para garantir que os usuários possam acessar diferentes seções do sistema sem dificuldades. | -                        |

## TESTES UNITÁRIOS

| **FUNCIONALIDADE**                                               | **DESCRIÇÃO DO TESTE**                                                                 | **LOCALIZAÇÃO DO TESTE** |
|------------------------------------------------------------------|----------------------------------------------------------------------------------------|--------------------------|
| **Validar CRUD página de demanda (admin)**                       | Verificar se as operações de criar, ler, atualizar e excluir (CRUD) estão funcionando corretamente na página de demanda para administradores. | catavento/test/test/unit_test/bloc_demanda_test.dart |
| **Validar importação da planilha excel**                         | Testar a funcionalidade de importação de planilhas Excel e garantir que os dados sejam corretamente processados e integrados ao sistema. | catavento/test/test/unit_test/table_import_test.dart |
| **Validar CRUD página de Funcionário (admin)**                    | Garantir que as funcionalidades CRUD para a página de gerenciamento de funcionários estão operando corretamente para administradores. | catavento/test/unit_test/bloc_usuario_test.dart |
| **Validar CRUD página de Produtos (admin)**                       | Testar as operações de CRUD na página de produtos para administradores, assegurando que o sistema lide com essas ações corretamente. | catavento/test/unit_test/bloc_produto_test.dart |
| **Validar Filtragem - Tela de desempenho do funcionário (admin)** | Verificar se a funcionalidade de filtragem da tela de desempenho do funcionário está funcionando corretamente, com base nos critérios definidos. | -                        |
| **Validar Campo de Busca - Tela de desempenho do funcionário (admin)** | Validar a funcionalidade de busca na tela de desempenho do funcionário, garantindo que as pesquisas retornem os resultados esperados. | -                        |
| **Validar Filtragem - Tela de desempenho da loja (admin)**       | Garantir que a filtragem na tela de desempenho da loja esteja funcionando como esperado, permitindo ao administrador visualizar os dados de forma eficiente. | -                        |
| **Validar Campo de Busca - Tela de desempenho da loja (admin)**  | Testar o campo de busca na tela de desempenho da loja para verificar se a funcionalidade está retornando os resultados adequados. | -                        |

## TESTES DE INTEGRAÇÃO

| **FUNCIONALIDADE**                                                   | **DESCRIÇÃO DO TESTE**                                                                | **LOCALIZAÇÃO DO TESTE** |
|---------------------------------------------------------------------|---------------------------------------------------------------------------------------|--------------------------|
| **Validar integração de formulário de cadastro e edição de demanda** | Garantir que os dados são salvos e recuperados corretamente.                          | catavento/integration_test/demanda_admin_test.dart                       |
| **Validar integração de formulário de cadastro e edição de funcionário** | Verificar se as operações CRUD funcionam sem erros.                                    | -                        |
| **Validar integração de formulário de cadastro e edição de produto** | Testar a persistência dos dados no banco.                                              | -                        |
| **Validar importação de planilha do Excel para cadastro de demanda** | Assegurar que os dados da planilha são importados corretamente.                       | -                        |
| **Validar tela de login e logout**                                   | Garantir que a autenticação ocorre sem falhas.                                         | -                        |
| **Validar menu de navegação**                                        | Testar a navegação entre telas.                                                       | -                        |


# 7 Ambiente de Teste

## 1. Ambiente de Desenvolvimento
**IDE**: VS Code;  
**Sistema Operacional**: Windows, Linux.  
**Dependências do Projeto**: flutter_bloc (^9.0.0), http (^1.2.2), supabase_flutter (^2.8.1), injectable (^2.1.2), get_it (^8.0.3), equatable (^2.0.5), fl_chart (^0.70.2), file_picker (^8.1.4), flutter_test (sdk: flutter), mockito (^5.1.0), bloc_test (^10.0.0), test (^1.25.8).

## 2. Ambiente de Execução dos Testes
**Framework de Testes**: Flutter;  
**Ambiente de Banco de Dados**: Supabase;  

## 3. Ambiente de Teste Físico (se aplicável)
**Dispositivos para Testes**: Dispositivos Desktop, e Tablet;  
**Emuladores/Sistemas Operacionais Virtuais**: Windows 11;

# 8 Critérios de Aceitação

## Testes Manuais:
- A aplicação deve permitir realizar todas as operações de CRUD sem erros.
- A navegação entre páginas deve ser fluida e sem falhas.
- As importações de dados via planilha Excel devem ser processadas corretamente.
- Os campos de busca e filtros devem retornar os resultados esperados.

## Testes Unitários:
- Cada função ou método deve ser testado de forma isolada e retornar o resultado esperado.
- Não deve haver erros ou falhas durante a execução dos testes.
- O comportamento de cada componente deve ser verificado conforme as especificações.
- O código deve lidar corretamente com entradas e saídas definidas para cada caso de teste.

## Testes de Integração:
- A comunicação entre os módulos e componentes deve ocorrer sem falhas.
- A persistência de dados entre diferentes partes do sistema deve ser mantida de forma consistente.
- O fluxo de dados entre os módulos deve ser testado e validado.
- Todos os dados integrados entre sistemas devem ser consistentes e corretos.

# 8 Riscos e Mitigações

## Risco 1: Atraso nos Testes de Integração e Unitários
**Mitigação**:
- Planejar e alocar tempo adequado para os testes de integração e unitários para a execução do projeto.
- Automatizar testes sempre que possível para acelerar a execução e garantir a cobertura necessária.

## Risco 2: Dificuldades com a Integração e Configuração do Supabase
**Mitigação**:
- Realizar testes incrementais de integração para detectar problemas rapidamente.
- Manter uma comunicação constante com a equipe de backend para resolver questões relacionadas ao Supabase.

# 9 Tabela de Versionamento

| Nome                  | Cargo                        | Data       |
|-----------------------|------------------------------|------------|
| Maria Eduarda Quaresma | Product and Squad Test Leader | 02/02/25   |