import 'package:catavento/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import './components/menuBar.dart';

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
              hoverColor: Colors.transparent,
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),

        ),
      ),
      body: Container(
        child: Center(
          child: Text("aqui"),
        ),
      ),
    );
  }
}
