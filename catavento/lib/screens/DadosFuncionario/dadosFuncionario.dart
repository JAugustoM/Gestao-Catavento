import 'package:catavento/bloc/auth2/auth_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/screens/DadosFuncionario/components/widgetDesempenho.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import "../../shared/widgets/menuBar.dart";
import 'package:catavento/screens/DadosFuncionario/components/widgetDadosFuncionario.dart';

class Dadosfuncionario extends StatelessWidget {
  const Dadosfuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: 300,
            color: Colors.transparent,
            child: Navbar(),
          ),
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      Map<String, dynamic> userData = {};
                      if (state is AuthSignInState) {
                        userData = state.userData;
                      }
                      return WidgetDadosFuncionario(
                        nome: userData['nome'] ?? "Nome",
                        nickname: userData['usuario'] ?? "Usuario",
                        email: userData['email'] ?? "Email",
                        setor: userData['setor'] ?? "Setor",
                      );
                    },
                  ),
                  SizedBox(height: 20),
                  BlocBuilder<TrabalhoBloc, TrabalhoState>(
                    builder: (context, state) {
                      final metaData = state.metaData;
                      return Widgetdesempenho(
                        data: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                        goal: 12,
                        isCompleted: metaData['completo'] ?? 0,
                        isMissing: 11,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
