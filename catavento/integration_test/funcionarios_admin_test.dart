import 'package:catavento/bloc/auth/auth_bloc.dart' as auth_bloc;
import 'package:catavento/bloc/usuario/usuario_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:catavento/core/di/dependency_injection.dart';
import 'package:catavento/data/repositories/authentication_repository.dart';
import 'package:catavento/screens/dashboardFuncionarios/employee-management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';
import 'dart:math';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // Registra as dependências necessárias (SupabaseClient, AuthenticationRepository e AuthBloc) no GetIt para injeção de dependência no projeto
  GetIt.I.registerLazySingleton<SupabaseClient>(
      () => SupabaseClient(supabaseUrl, supabaseKey));
  GetIt.I.registerLazySingleton<AuthenticationRepository>(
      () => AuthenticationRepository(GetIt.I<SupabaseClient>()));
  GetIt.I.registerFactory<auth_bloc.AuthBloc>(
      () => auth_bloc.AuthBloc(GetIt.I<AuthenticationRepository>()));

  // Inicializa o gerenciamento da janela
  windowManager.ensureInitialized();

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  group('validação dos formularios de funcionário', () {
    testWidgets('Cadastro e edição de um funcionário',
        (WidgetTester tester) async {
      // Envolvendo o widget com MultiBlocProvider
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => DemandaBloc()..add(DemandaLoading())),
            BlocProvider(
                create: (context) => UsuarioBloc()..add(UsuarioLoading())),
            BlocProvider(
                create: (context) => getIt<auth_bloc.AuthBloc>()
                  ..add(auth_bloc.CheckAuthEvent())),
            BlocProvider(create: (context) => TrabalhoBloc()
                // ..add(TrabalhoLoading(
                //   email: 'default@email.com',
                //   setor: 'defaultSetor',
                // ))
                ),
          ],
          child: MaterialApp(
            home: EmployeeManagement(),
          ),
        ),
      );

      // Maximizar a janela
      await windowManager.maximize();

      // Aguarda a renderização inicial
      await tester.pumpAndSettle();

      // Adição de um funcionario - Clica no botão de adicionar funcionário
      expect(find.byKey(Key('AdicionarFuncionarioButton')), findsOneWidget);
      await tester.tap(find.byKey(Key('AdicionarFuncionarioButton')));
      await tester.pumpAndSettle();

      // Preenche os campos do formulário
      await tester.enterText(
          find.byKey(Key('NomeFuncionarioInput')), gerarStringAleatoria(8));
      await tester.pumpAndSettle();

      // Encontra o checkBox pelo key, certifica de que esta visível
      final checkboxFinder = find.byKey(Key('FuncionarioCkeckBox'));
      await tester.ensureVisible(checkboxFinder);
      await tester.pumpAndSettle();
      expect(checkboxFinder, findsOneWidget);
      await tester.tap(checkboxFinder, warnIfMissed: false);
      await tester.pumpAndSettle();

      // Seleciona o DropDown
      final dropdownFinder = find.byKey(Key('setorDropdown'));
      expect(dropdownFinder, findsOneWidget);
      await tester.tap(dropdownFinder);
      await tester.pumpAndSettle();
      final itemFinder = find.text('Aplique').last;
      await tester.tap(itemFinder);
      await tester.pumpAndSettle();

      await tester.enterText(find.byKey(Key('EmailFuncionarioInput')),
          '${gerarStringAleatoria(8)}@gmail.com');
      await tester.enterText(
          find.byKey(Key('NomeUsuarioInput')), gerarStringAleatoria(8));
      await tester.enterText(
          find.byKey(Key('SenhaFuncionarioInput')), gerarStringAleatoria(8));

      await tester.pumpAndSettle();

      // Confirma se o botão "Concluir" foi encontrado e clica nele
      final buttonConcluirFinder = find.byKey(Key('ConcluirButton'));
      expect(buttonConcluirFinder, findsOneWidget);
      await tester.tap(buttonConcluirFinder);

      await Future.delayed(Duration(seconds: 5));
      await tester.pumpAndSettle();

      // Verifique se a mensagem de sucesso é exibida
      expect(find.text('Usuário criado com sucesso!'), findsOneWidget);

      await Future.delayed(Duration(seconds: 5));

      // Edição de um funcionario - Clica no botão de editar funcionário
      expect(find.byKey(Key('EditarFuncionarioButton')), findsWidgets);
      await tester.tap(find.byKey(Key('EditarFuncionarioButton')).last);
      await tester.pumpAndSettle();

      // Preenche os campos do formulário
      await tester.enterText(find.byKey(Key('EditarNomeFuncionarioInput')),
          gerarStringAleatoria(8));
      await tester.pumpAndSettle();

      // Encontra o checkBox pelo key, certifica de que esta visível
      final checkboxFinderEditar = find.byKey(Key('EditarFuncionarioCkeckBox'));
      await tester.ensureVisible(checkboxFinderEditar);
      await tester.pumpAndSettle();
      expect(checkboxFinderEditar, findsOneWidget);
      await tester.tap(checkboxFinderEditar, warnIfMissed: false);
      await tester.pumpAndSettle();

      // Seleciona o DropDown
      final dropdownFinderEditar = find.byKey(Key('EditarsetorDropdown'));
      expect(dropdownFinderEditar, findsOneWidget);
      await tester.tap(dropdownFinderEditar);
      await tester.pumpAndSettle();
      final itemFinderCobertura = find.text('Cobertura').last;
      await tester.tap(itemFinderCobertura);
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byKey(Key('EditarNomeUsuarioInput')), gerarStringAleatoria(8));

      await tester.pumpAndSettle();

      // Confirma se o botão "Concluir" foi encontrado e clica nele
      final buttonConcluirFinderEditar =
          find.byKey(Key('EditarConcluirButton'));
      expect(buttonConcluirFinderEditar, findsOneWidget);
      await tester.tap(buttonConcluirFinderEditar);

      await Future.delayed(Duration(seconds: 5));
      await tester.pumpAndSettle();

      // Verifique se a mensagem de sucesso é exibida
      expect(find.text('Usuário atualizado com sucesso!'), findsOneWidget);
    });
  });
}

String gerarStringAleatoria(int tamanho) {
  const caracteres = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final random = Random();
  return List.generate(
      tamanho, (index) => caracteres[random.nextInt(caracteres.length)]).join();
}
