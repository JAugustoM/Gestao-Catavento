import 'dart:ffi';
import 'package:catavento/bloc/usuario_bloc.dart';
import 'package:catavento/screens/components/ativAndamentoCard.dart';
import 'package:catavento/screens/components/confirmDialog.dart';
import 'package:catavento/screens/components/graficInfo.dart';
import 'package:catavento/screens/components/input.dart';
import 'package:catavento/screens/dashboard_admin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/background.dart';
import 'components/header.dart';
import 'components/blocks.dart';
import 'components/showDialog.dart';
import 'package:catavento/screens/components/menu.dart';
import 'components/funcionarioCard.dart';

class EmployeeManagement extends StatelessWidget {
  final List<Map<String, String>> funcionarios = [
    {'nome': 'nomeFuncionario', 'setor': 'nomeCargo', 'status': 'Ativo'},
    {'nome': 'nomeFuncionario', 'setor': 'nomeCargo', 'status': 'Ativo'},
    {'nome': 'nomeFuncionario', 'setor': 'nomeCargo', 'status': 'Ativo'},
    {'nome': 'nomeFuncionario', 'setor': 'nomeCargo', 'status': 'Ativo'},
    {'nome': 'nomeFuncionario', 'setor': 'nomeCargo', 'status': 'Ativo'},
    {'nome': 'nomeFuncionario', 'setor': 'nomeCargo', 'status': 'Ativo'}
  ];

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
                child: SizedBox(
                  height: 470,
                  width: 302,
                  child: ListView.builder(     //Aqui vai o cards dos funcionarios cadastrados
                    itemCount: funcionarios.length,
                    itemBuilder: (context, index) {
                      final funcionario = funcionarios[index];
                      return FuncionarioCard(
                        nomeFuncionario: funcionario['nome']!,
                        setor: funcionario['setor']!,
                        status: funcionario['status']!,
                      );
                    },
                  ) 
                )
              ),

              SizedBox(width: MediaQuery.of(context).size.height * 0.07),

              Blocks(
                color: Colors.white,
                height: 559,
                width: 380,
                borderRadius: 26,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Center(
                        child: Text(
                          "Setor de Montagem",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    SizedBox(
                      height: 200,
                      width: 330,
                      child: ListView.builder(     //Aqui vai o card das atividades em andamento (Corte)
                        itemCount: ativAndamento.length,
                        itemBuilder: (context, index) {
                          final atividade = ativAndamento[index];
                          return AtivAndamentoCard(
                            nomeFuncionario: atividade['nome']!,
                            nomeDemanda: atividade['demanda']!,
                          );
                        },
                      )
                    ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    Center(
                        child: Text(
                          "Setor de Corte",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                        ),
                      ),

                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),

                    SizedBox(
                      height: 200,
                      width: 330,
                      child: ListView.builder(     //Aqui vai os cards das atividades em andamento (Montagem)
                        itemCount: ativAndamento.length,
                        itemBuilder: (context, index) {
                          final atividade = ativAndamento[index];
                          return AtivAndamentoCard(
                            nomeFuncionario: atividade['nome']!,
                            nomeDemanda: atividade['demanda']!,
                          );
                        },
                      )
                    ),

                  ],
                )
                )
            ],
          ),
        ],
      ),
    );
  }
}
