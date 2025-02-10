# Documentação do Teste: Filtragem e Busca

## Objetivo
Este teste verifica se o `UsuarioBloc` emite um estado do tipo `UsuarioFilterState` corretamente quando um evento de filtragem (`UsuarioFilter`) é disparado.

## Configuração do Teste
- **Nome do Teste:** `emite um FilterState quando for filtrado`
- **Construtor:** `build: () => usuarioBloc`
  - Define a instância do `UsuarioBloc` que será testada.
- **Preparação (`setUp`)**:
  - Define o estado inicial do bloco, atribuindo `usuarioBloc.currentData` com uma lista contendo dois objetos (`usuario` e `usuario2`).

## Execução do Teste
- **Ação (`act`)**:
  - Adiciona o evento `UsuarioFilter('setor', 'Setor A')` ao `UsuarioBloc`, que deve filtrar os usuários pelo setor especificado.

## Expectativa
- O `UsuarioBloc` deve emitir um estado `UsuarioFilterState` com:
  - A lista completa de usuários antes da filtragem (`[usuario, usuario2]`)
  - A lista de usuários filtrados contendo apenas `usuario` (`[usuario]`)
  - Um mapa com informações adicionais, indicando um total de `2` usuários antes da filtragem (`{"total": 2}`).

## Conclusão
O teste valida corretamente o comportamento esperado do `UsuarioBloc` ao processar eventos de filtragem, garantindo que o estado emitido esteja de acordo com os dados esperados.

