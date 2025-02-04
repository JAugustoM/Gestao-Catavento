import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:catavento/screens/DashboardAdmin/dashboard_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  // Inicialize o gerenciamento da janela
  windowManager.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  group('validação dos formularios de demanda', () {
    testWidgets('Cadastro e edição de uma demanda',
        (WidgetTester tester) async {
      // Envolvendo o widget com BlocProvider
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => DemandaBloc()..add(DemandaLoading()),
          child: MaterialApp(
            home: DashBoardAdmin(),
          ),
        ),
      );

      // Maximizar a janela
      await windowManager.maximize();

      // Aguarda a renderização inicial
      await tester.pumpAndSettle();

      // Adição de uma demanda - Clica no botão de adicionar demanda
      expect(find.byKey(Key('adicionarDemandaButton')), findsOneWidget);
      await tester.tap(find.byKey(Key('adicionarDemandaButton')));
      await tester.pumpAndSettle();

      // Preenche os campos do formulário
      await tester.enterText(
          find.byKey(Key('codigoDemandaInput')), 'codigo 123');
      await tester.enterText(
          find.byKey(Key('nomeDemandaInput')), 'demanda teste ');
      await tester.enterText(find.byKey(Key('dataPedidoInput')), '130124');
      await tester.enterText(find.byKey(Key('prazoInput')), '140124');
      await tester.pump(const Duration(milliseconds: 500));
      await tester.enterText(find.byKey(Key('descricaoDemandaInput')),
          'descrição teste automatizado');

      await tester.pumpAndSettle();

      // Confirma se o botão "Concluir" foi encontrado e clica nele
      final buttonConcluirFinder = find.byKey(Key('concluirButton'));
      expect(buttonConcluirFinder, findsOneWidget);
      await tester.tap(buttonConcluirFinder);

      await Future.delayed(Duration(seconds: 5));
      await tester.pumpAndSettle();

      // Verifique se a mensagem de sucesso é exibida
      expect(find.text('Bolo adicionado com sucesso'), findsOneWidget);

      // // Edição de uma demanda - Clica no ícone de editar demanda
      final editarIcon = find.byKey(Key('editarDemandaButton')).first;
      expect(editarIcon, findsOneWidget);
      await tester.tap(editarIcon);
      await tester.pumpAndSettle();

      // Preenche os campos do formulário com novos valores
      await tester.enterText(
          find.byKey(Key('codigoDemandaInput')), 'codigo 456');
      await tester.enterText(
          find.byKey(Key('nomeDemandaInput')), 'demanda teste atualizada');
      await tester.enterText(find.byKey(Key('dataPedidoInput')), '150124');
      await tester.enterText(find.byKey(Key('prazoInput')), '160124');
      await tester.enterText(find.byKey(Key('descricaoDemandaInput')),
          'descrição teste atualizada');

      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 5));

      // Confirma se o botão "Concluir" foi encontrado e clica nele

      final buttonConcluirEdicao = find.byKey(Key('concluirButtonEdicao'));
      expect(buttonConcluirEdicao, findsOneWidget);
      await tester.tap(buttonConcluirEdicao);

      await Future.delayed(Duration(seconds: 5));
      await tester.pumpAndSettle();

      // Verifique se a mensagem de sucesso é exibida
      expect(find.text('Bolo atualizado com sucesso!'), findsOneWidget);
    });
  });
}
