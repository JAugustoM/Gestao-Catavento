import 'package:catavento/bloc/auth/auth_bloc.dart' as auth_bloc;
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/bloc/produto/produto_bloc.dart';
import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/bloc/usuario/usuario_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:catavento/screens/DadosFuncionario/dadosFuncionario.dart';
import 'package:catavento/screens/Desempenho/dashboard_desempenhoAdmin.dart';
import 'package:catavento/screens/Produtos/dashboard_produtos.dart';
import 'core/di/dependency_injection.dart';
import 'screens/DashboardAdmin/dashboard_admin.dart';
import 'package:catavento/screens/Login/login.dart';
import 'package:catavento/screens/dashboardFuncionarios/employee-management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/Funcionario/dashboardfuncionario.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:catavento/shared/theme/colors.dart';

void main() {
  setupDependencies();
  configureDependencies();

  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DemandaBloc()..add(DemandaLoading())),
        BlocProvider(create: (context) => UsuarioBloc()..add(UsuarioLoading())),
        BlocProvider(
            create: (context) => TrabalhoBloc()
              ..add(TrabalhoLoading(
                email: '',
                setor: '',
              ))),
        BlocProvider(create: (context) => ProdutoBloc()..add(ProdutoLoading())),
        BlocProvider(
            create: (context) =>
                getIt<auth_bloc.AuthBloc>()..add(auth_bloc.CheckAuthEvent())),
        BlocProvider(
            create: (context) => TrabalhoBloc()
              ..add(TrabalhoLoading(
                email: '',
                setor: '',
              ))),
        BlocProvider(create: (context) => RelatorioBloc()),
      ],
      child: MaterialApp(
        title: "Gestão Catavento",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Fredoka',
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          Locale('en', 'US'), // Suporte para inglês
          Locale('pt', 'BR'), // Suporte para português
        ],
        home: const LoadView(),
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
}

class LoadView extends StatelessWidget {
  const LoadView({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Supabase.initialize(
        url: supabaseUrl,
        anonKey: supabaseKey,
        authOptions: const FlutterAuthClientOptions(
          authFlowType: AuthFlowType.implicit,
        ),
      ),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return BlocConsumer<auth_bloc.AuthBloc, auth_bloc.AuthState>(
            listener: (context, state) {
              if (state is auth_bloc.AuthError) {
                Navigator.pushReplacementNamed(context, loginRoute);
              }
              if (state is auth_bloc.AuthAuthenticated) {
                final dados = context.read<auth_bloc.AuthBloc>().userData;
                if (dados['tipo'] == 'padrao') {
                  context.read<TrabalhoBloc>().add(TrabalhoLoading(
                        email: dados['email']!,
                        setor: dados['setor']!.toLowerCase(),
                      ));
                  Navigator.pushReplacementNamed(
                      context, atividadesFuncionarioRoute);
                } else {
                  context.read<RelatorioBloc>().add(RelatorioLoad());
                  context.read<DemandaBloc>().add(DemandaLoading());
                  context.read<TrabalhoBloc>().add(TrabalhoAdmin());
                  Navigator.pushReplacementNamed(context, homeRoute);
                }
              }
            },
            builder: (context, state) {
              if (state is auth_bloc.AuthLoading) {
                return Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        AppColors.gradientDarkBlue,
                        AppColors.gradientLightBlue
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                  ),
                  child: const Center(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        CircularProgressIndicator(
                          strokeWidth: 6,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.white),
                        ),
                      ],
                    ),
                  ),
                );
              }

              return const Login();
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
