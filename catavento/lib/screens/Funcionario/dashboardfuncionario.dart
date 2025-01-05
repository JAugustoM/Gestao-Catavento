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
        children: [CardDemanda()],
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
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: Offset(3, 3),
                      blurRadius: 12,
                      spreadRadius: 0,
                    ),
                  ]),
              height: 150,
            ),
            SizedBox(height: 10),
            Container(
              height: 250,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12), color: Colors.white),
              child: Padding(
                padding:
                    EdgeInsets.only(left: 10, right: 10, bottom: 0, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          color: Color(0xFF015C98),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Informações",
                          style: TextStyle(
                              color: Color(0xFF015C98),
                              fontWeight: FontWeight.bold,
                              fontSize: 20),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Text(
                          "Código: ",
                          style: TextStyle(
                              color: Color(0xFF015C98),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "{codigo da demanda}",
                          style:
                              TextStyle(color: Color(0xFF015C98), fontSize: 14),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                        Text(
                          "Descrição: ",
                          style: TextStyle(
                              color: Color(0xFF015C98),
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Expanded(
                          child: Text(
                            overflow: TextOverflow.ellipsis,
                            maxLines: 10,
                            "Se você preferir evitar um merge extra e desejar reaplicar suas alterações sobre as alterações remotas (em vez de mesclar), você pode usar o git pull --rebase. Esse comando vai rebasear (reaplicar) suas alterações locais em cima das alterações remotas, o que pode ser útil para manter um histórico mais limpo:",
                            style: TextStyle(
                                color: Color(0xFF015C98), fontSize: 14),
                          ),
                        ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
