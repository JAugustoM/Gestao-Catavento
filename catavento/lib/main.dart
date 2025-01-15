import 'package:catavento/bloc/auth2/auth_bloc.dart';
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/bloc/produto/produto_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/bloc/usuario/usuario_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:catavento/screens/DadosFuncionario/dadosFuncionario.dart';
import 'package:catavento/screens/Desempenho/dashboard_desempenhoAdmin.dart';
import 'package:catavento/screens/Produtos/dashboard_produtos.dart';
// import 'package:catavento/core/di/dependency_injection.dart';
import 'screens/DashboardAdmin/dashboard_admin.dart';
import 'package:catavento/screens/Login/login.dart';
import 'package:catavento/screens/dashboardFuncionarios/employee-management.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'screens/Funcionario/dashboardfuncionario.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => DemandaBloc()..add(DemandaLoading())),
        BlocProvider(create: (context) => UsuarioBloc()..add(UsuarioLoading())),
        BlocProvider(create: (context) => AuthBloc()..add(AuthLoading())),
        BlocProvider(
            create: (context) => TrabalhoBloc()
              ..add(TrabalhoLoading(
                email: '',
                setor: '',
              ))),
        BlocProvider(create: (context) => ProdutoBloc()..add(ProdutoLoading()))
      ],
      child: MaterialApp(
        title: "Gestão Catavento",
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          fontFamily: 'Fredoka',
        ),
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
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            return const Login();
          default:
            return const CircularProgressIndicator();
        }
      },
    );
  }
}
