import 'package:catavento/bloc/auth2/auth_bloc.dart';
import 'package:catavento/screens/DadosFuncionario/components/widgetDesempenho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "../../shared/widgets/menuBar.dart";
import 'package:catavento/screens/DadosFuncionario/components/widgetDadosFuncionario.dart';

class Dadosfuncionario extends StatelessWidget {
  const Dadosfuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => {
              Scaffold.of(context).openDrawer(),
            },
            icon: Icon(Icons.tune, color: Colors.black),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        child: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            var userData;
            if (state is AuthSignInState) {
              userData = state.userData;
            }
            return Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                WidgetDadosFuncionario(
                    nome: userData['nome'] ?? "Nome",
                    nickname: userData['usuario'] ?? "Usuario",
                    email: userData['email'] ?? "Email",
                    setor: userData['setor'] ?? "Setor"),
                SizedBox(
                  height: 20,
                ),
                Widgetdesempenho(
                  data: "16/12/2004",
                  goal: 12,
                  isCompleted: 1,
                  isMissing: 11,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
