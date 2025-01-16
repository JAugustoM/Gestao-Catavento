import 'package:catavento/screens/DadosFuncionario/components/widgetDesempenho.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../../shared/widgets/menuBar.dart";
import 'package:intl/intl.dart';
import 'package:catavento/screens/DadosFuncionario/components/widgetDadosFuncionario.dart';

class Dadosfuncionario extends StatelessWidget {
  const Dadosfuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
                  WidgetDadosFuncionario(
                    nome: "nome",
                    nickname: "nomeusuario",
                    email: "email",
                    setor: "setor",
                  ),
                  SizedBox(height: 20),
                  Widgetdesempenho(
                    data: DateFormat('dd/MM/yyyy').format(DateTime.now()),
                    goal: 12,
                    isCompleted: 1,
                    isMissing: 11,
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
