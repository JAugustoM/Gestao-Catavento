import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "./components/menuBar.dart";
import 'package:catavento/screens/Funcionario/components/Dadosfuncionario.dart';
import 'package:catavento/shared/widgets/blocks.dart';



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
      body: Center(
        child: 
          Blocks(
            title: "Meus dados",
            titleColor: AppColors.blue,
            color: AppColors.lightGray,
            child: Container(
              color: AppColors.white,
              child: Dadosfuncionarios(
                nome: 'fulano',
                nomeusuario: 'nomeusuario',
                email: 'email',
                setor: 'setor',
              ),
          ),
        ),
      ),
    );
  }
}

