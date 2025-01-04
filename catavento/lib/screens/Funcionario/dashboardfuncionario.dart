import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "./components/menuBar.dart";
import 'package:catavento/screens/Funcionario/components/Dadosfuncionario.dart';


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
        children: [
          CardDemanda()
        ],
      ),
    );
  }
}

class CardDemanda extends StatelessWidget {
  const CardDemanda({super.key});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height / 1.2;

    return Container(
      width: 300,
      height: screenHeight,
      decoration: BoxDecoration(
          color: Color(0xFFEBEBEB), borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.only(top: 20, left: 7.5, right: 7.5, bottom: 0),
        child: Column(
          children: [
            Text(
              "nome da demanda",
              style: TextStyle(
                  color: Color(0xFF015C98),
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(height:10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05), // Opacidade bem baixa para sombra suave
                      offset: Offset(3, 3), // Deslocamento suave
                      blurRadius: 12, // Desfoque mais suave
                      spreadRadius: 0, // Nenhuma expansão da sombra
                    ),
                  ]
              ),
              height: 150,
            ),
            SizedBox(height: 10),
            Container(
              height:250 ,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.white
              ),
            )
          ],

        ),
      ),
    );
  }
}