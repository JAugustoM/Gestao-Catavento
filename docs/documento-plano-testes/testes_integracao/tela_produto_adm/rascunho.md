# Testes de Integração

Os testes de integração verificam a comunicação entre diferentes módulos ou componentes de um sistema para garantir que funcionem corretamente em conjunto.

## Objetivo
- Validar a interação entre módulos.
- Detectar falhas na integração de componentes.
- Garantir que os dados fluam corretamente entre sistemas.

## Tipos de Testes de Integração
- **Big Bang**: Todos os módulos são integrados e testados de uma vez.
- **Incremental**: Os módulos são testados progressivamente, podendo ser:
  - **Top-Down**: Testa do módulo principal para os secundários.
  - **Bottom-Up**: Testa dos módulos secundários para o principal.
- **Sandwich (Híbrido)**: Combina abordagens Top-Down e Bottom-Up.

## Etapas do Teste de Integração
1. Definir os módulos a serem testados.
2. Criar cenários de teste para interações.
3. Executar os testes e registrar falhas.
4. Corrigir defeitos e retestar.

Os testes de integração são essenciais para garantir a robustez e o funcionamento correto de sistemas complexos.