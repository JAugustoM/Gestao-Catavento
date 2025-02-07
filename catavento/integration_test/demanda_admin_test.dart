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

  print('Supabase inicializado com sucesso');

  group('validação do cadastro de demanda', () {
    testWidgets('deve cadastrar uma demanda com sucesso',
        (WidgetTester tester) async {
      await Supabase.instance.client.auth.signInWithPassword(
        email: 'equipe.runa.fehu@gmail.com',
        password: '12345678',
      );

      expect(Supabase.instance.client.auth.currentSession, isNotNull);
      expect(Supabase.instance.client.auth.currentUser, isNotNull);

      // Envolvendo o widget apenas com o DemandaBloc
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => DemandaBloc()..add(DemandaLoading()),
          child: MaterialApp(
            home: DashBoardAdmin(),
          ),
        ),
      );

      // Aguarda a renderização inicial
      await tester.pumpAndSettle();

      // Comando para maximizar a janela
      await windowManager.maximize();

      // Clica no botão de adicionar demanda
      expect(find.byKey(Key('adicionarDemandaButton')), findsOneWidget);
      await tester.tap(find.byKey(Key('adicionarDemandaButton')));
      await tester.pumpAndSettle();

      // Preenche os campos do formulário
      await tester.enterText(
          find.byKey(Key('codigoDemandaInput')), 'codigo 123');
      await tester.enterText(
          find.byKey(Key('nomeDemandaInput')), 'demanda teste automatizado');
      await tester.enterText(find.byKey(Key('dataPedidoInput')), '130124');
      await tester.enterText(find.byKey(Key('prazoInput')), '140124');
      await tester.pump(const Duration(milliseconds: 500));
      await tester.enterText(find.byKey(Key('descricaoDemandaInput')),
          'descrição teste automatizado');

      await tester.pumpAndSettle();

      final buttonConcluirFinder = find.byKey(Key('concluirButton'));

      await tester.pumpAndSettle();

      // Confirma se o botão foi encontrado
      expect(buttonConcluirFinder, findsOneWidget);

      await tester.pumpAndSettle();

      await tester.tap(find.byKey(Key('concluirButton')));

      await Future.delayed(Duration(seconds: 5));

      await tester.pumpAndSettle();

      // Verifique se a mensagem de sucesso é exibida
      expect(find.text('Bolo adicionado com sucesso'), findsOneWidget);
    });
  });
}
