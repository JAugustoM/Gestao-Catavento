import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "../../shared/widgets/menuBar.dart";
import 'package:catavento/screens/DadosFuncionario/components/Dadosfuncionario.dart';

class Dadosfuncionario extends StatelessWidget {
  const Dadosfuncionario({super.key});

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
      body:Container(
        width: MediaQuery.of(context).size.width,
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            WidgetDadosFuncionario(nome: "nome", nomeusuario: "nomeusuario", email: "email", setor: "setor")
          ],
        ),
      ),
    );
  }
}
