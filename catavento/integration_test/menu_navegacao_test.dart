import 'package:catavento/bloc/auth/auth_bloc.dart' as auth_bloc;
import 'package:catavento/bloc/usuario/usuario_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/bloc/produto/produto_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:catavento/core/di/dependency_injection.dart';
import 'package:catavento/data/repositories/authentication_repository.dart';
import 'package:catavento/screens/DashboardAdmin/dashboard_admin.dart';
import 'package:catavento/screens/Funcionario/dashboardfuncionario.dart';
import 'package:catavento/screens/Login/login.dart';
import 'package:catavento/screens/dashboardFuncionarios/employee-management.dart';
import 'package:catavento/screens/DadosFuncionario/dadosFuncionario.dart';
import 'package:catavento/screens/Desempenho/dashboard_desempenhoAdmin.dart';
import 'package:catavento/screens/Produtos/dashboard_produtos.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:integration_test/integration_test.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:window_manager/window_manager.dart';

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

  group('validação do menu de navegação', () {
    testWidgets('interação no menu de navegação', (WidgetTester tester) async {
      // Envolvendo o widget com MultiBlocProvider
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) => DemandaBloc()..add(DemandaLoading())),
            BlocProvider(
                create: (context) => UsuarioBloc()..add(UsuarioLoading())),
            BlocProvider(
                create: (context) => TrabalhoBloc()
                  ..add(TrabalhoLoading(
                    email: '',
                    setor: '',
                  ))),
            BlocProvider(
                create: (context) => ProdutoBloc()..add(ProdutoLoading())),
            BlocProvider(
                create: (context) => getIt<auth_bloc.AuthBloc>()
                  ..add(auth_bloc.CheckAuthEvent())),
            BlocProvider(
                create: (context) => TrabalhoBloc()
                  ..add(TrabalhoLoading(
                    email: '',
                    setor: '',
                  ))),
          ],
          child: MaterialApp(
            home: DashBoardAdmin(),
            routes: {
              loginRoute: (context) => const Login(),
              homeRoute: (context) => const DashBoardAdmin(),
              crudFuncionariosRoute: (context) => EmployeeManagement(),
              produtosRoute: (context) => DashboardProdutos(),
              atividadesFuncionarioRoute: (context) => DashBoardFuncionario(),
              dadosFuncionario: (context) => Dadosfuncionario(),
              desempenhoAdminRoute: (context) => DashboardDesempenhoAdmin(),
            },
          ),
        ),
      );

      // Maximizar a janela
      await windowManager.maximize();

      // Aguarda a renderização inicial
      await tester.pumpAndSettle();

      //Funcionarios
      expect(find.byIcon(Icons.menu), findsOneWidget);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('funcionariosMenuItem')), findsOneWidget);
      await tester.tap(find.byKey(Key('funcionariosMenuItem')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('EmployeeManagement')), findsOneWidget);
      await tester.pumpAndSettle();

      //Demandas
      expect(find.byIcon(Icons.menu), findsOneWidget);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('demandasMenuItem')), findsOneWidget);
      await tester.tap(find.byKey(Key('demandasMenuItem')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('DashBoardAdmin')), findsOneWidget);
      await tester.pumpAndSettle();

      //Produtos
      expect(find.byIcon(Icons.menu), findsOneWidget);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('produtosMenuItem')), findsOneWidget);
      await tester.tap(find.byKey(Key('produtosMenuItem')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('DashboardProdutos')), findsOneWidget);
      await tester.pumpAndSettle();

      //Desempenho
      expect(find.byIcon(Icons.menu), findsOneWidget);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('desempenhoMenuItem')), findsOneWidget);
      await tester.tap(find.byKey(Key('desempenhoMenuItem')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('DashboardDesempenhoAdmin')), findsOneWidget);
      await tester.pumpAndSettle();

      //Logout
      expect(find.byIcon(Icons.menu), findsOneWidget);
      await tester.tap(find.byIcon(Icons.menu));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('logoutMenuItem')), findsOneWidget);
      await tester.tap(find.byKey(Key('logoutMenuItem')));
      await tester.pumpAndSettle();

      expect(find.byKey(Key('Login')), findsOneWidget);
      await tester.pumpAndSettle();
    });
  });
}
