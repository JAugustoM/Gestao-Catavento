import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../../shared/widgets/menuBar.dart";
import "./components/cardDemandaFuncionario.dart";
import 'package:catavento/screens/DadosFuncionario/components/widgetDadosFuncionario.dart';

class DashBoardFuncionario extends StatelessWidget {
  const DashBoardFuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [CardDemanda(title: "Demanda 1", codigo: "2313421", description: "des",) ],
      ),
    );
  }
}
