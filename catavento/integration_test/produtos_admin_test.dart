import 'dart:math';

import 'package:catavento/bloc/produto/produto_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:catavento/screens/Produtos/dashboard_produtos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    // Inicialize o gerenciamento da janela
    windowManager.ensureInitialized();

    await Supabase.initialize(
      url: supabaseUrl,
      anonKey: supabaseKey,
    );
  });

  group('validação dos formularios de produto', () {
    testWidgets('Cadastro e edição de um produto', (WidgetTester tester) async {
      // Envolvendo o widget com BlocProvider
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => ProdutoBloc()..add(ProdutoLoading()),
          child: MaterialApp(
            home: DashboardProdutos(),
          ),
        ),
      );

      // Maximizar a janela
      await windowManager.maximize();

      // Aguarda a renderização inicial
      await tester.pumpAndSettle();

      // Adição de um produto
      expect(find.byKey(Key('adicionarProdutoButton')), findsOneWidget);
      await tester.tap(find.byKey(Key('adicionarProdutoButton')));
      await tester.pumpAndSettle();

      // Preenche os campos do formulário
      await tester.enterText(
          find.byKey(Key('InputCodigoProduto')), gerarStringAleatoria(6));
      await tester.enterText(
          find.byKey(Key('InputNomeProduto')), gerarStringAleatoria(6));
      await tester.enterText(find.byKey(Key('InputDescricaoProduto')),
          'descrição teste automatizado');

      await tester.pumpAndSettle();

      // Confirma se o botão "Concluir" foi encontrado e clica nele
      final buttonConcluirFinder = find.text('Concluir');
      expect(buttonConcluirFinder, findsOneWidget);
      await tester.tap(buttonConcluirFinder);

      await Future.delayed(Duration(seconds: 5));
      await tester.pumpAndSettle();
      // Verifique se a mensagem de sucesso é exibida
      expect(find.text('Produto adicionado com sucesso'), findsOneWidget);
    });
  });
}

String gerarStringAleatoria(int tamanho) {
  const caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final random = Random();
  return List.generate(
      tamanho, (index) => caracteres[random.nextInt(caracteres.length)]).join();
}
