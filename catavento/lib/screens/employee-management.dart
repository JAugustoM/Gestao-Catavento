import 'dart:ffi';
import 'package:catavento/bloc/usuario_bloc.dart';
import 'package:catavento/screens/components/confirmDialog.dart';
import 'package:catavento/screens/components/graficInfo.dart';
import 'package:catavento/screens/components/input.dart';
import 'package:catavento/screens/dashboard_admin.dart';
import 'package:flutter/material.dart';
import 'components/background.dart';
import 'components/header.dart';
import 'components/blocks.dart';
import 'components/showDialog.dart';

class EmployeeManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BackgroundPage(
        gradientColors: [Color(0xFF75CDF3), Color(0xFFB2E8FF)],
        children: [
          Header(title: "Funcionários"),
          SizedBox(height: MediaQuery.of(context).size.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Blocks(
                    color: Colors.white,
                    height: 97,
                    width: 321,
                    borderRadius: 26,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.group,
                            size: 30,
                            color: Color(0xFF015C98),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.height * 0.04),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [],
                          )
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),

                  /*Blocks(
                    color: Colors.white,
                    height: 97,
                    width: 321,
                    borderRadius: 26,
                    children: [
                    
                    ],
                  ),*/

                  SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.07,
                    width: MediaQuery.of(context).size.width * 0.25,
                    child: ElevatedButton(
                      onPressed: () {
                        //Logica do botão
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return Showdialog(
                              width: 463,
                              height: 402,
                              title: 'Novo funcionário',
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Inputs(
                                      text: "Nome:",
                                      hint: "Nome do funcionário",
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Inputs(
                                      text: "Setor:",
                                      hint: "Setor do funcionário",
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Inputs(
                                      text: "Email:",
                                      hint: "Email do funcionário",
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Inputs(
                                      text: "Nome de usuário:",
                                      hint: "Nome de usuário do funcionário",
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02),
                                    Inputs(
                                      text: "Senha:",
                                      hint: "Senha para o funcionário",
                                    ),
                                    SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.08),
                                    Positioned.fill(
                                        child: Center(
                                            child: ElevatedButton(
                                                onPressed: () {
                                                  //Lógica do botão
                                                  Navigator.pop(context);
                                                },
                                                style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.green,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        22))),
                                                child: Text(
                                                  "Cadastrar",
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ))))
                                  ]),
                            );
                          },
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF015C98),
                        padding: EdgeInsets.all(16),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(26)),
                      ),
                      child: Text(
                        "Cadastrar funcionário",
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(width: MediaQuery.of(context).size.height * 0.07),

              /*Blocks(
                color: Colors.white,
                height: 559,
                width: 346,
                borderRadius: 26,
                children[]
                ),

              SizedBox(width: MediaQuery.of(context).size.height * 0.07),

              Blocks(
                color: Colors.white,
                height: 559,
                width: 380,
                borderRadius: 26,
                children[]
                )*/
            ],
          ),
        ],
      ),
    );
  }
}
