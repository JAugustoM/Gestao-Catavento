import "dart:io";

import "package:catavento/bloc/auth/auth_bloc.dart";
import "package:catavento/bloc/produto/produto_bloc.dart";
import "package:catavento/bloc/trabalho/trabalho_bloc.dart";
import "package:catavento/shared/widgets/bloc_snackbar.dart";
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "../../shared/widgets/menuBar.dart";
import "./components/cardDemandaFuncionario.dart";

final List<Map<String, String>> tasks = [
  {
    "nome": "Tarefa 1",
    "descricao": "Descrição da tarefa 1",
    "codigo": "Código: T1",
    "foto": "https://via.placeholder.com/150"
  },
  {
    "nome": "Tarefa 2",
    "descricao": "Descrição da tarefa 2",
    "codigo": "Código: T2",
    "foto": "https://via.placeholder.com/150"
  },
  {
    "nome": "Tarefa 3",
    "descricao": "Descrição da tarefa 3",
    "codigo": "Código: T3",
    "foto": "https://via.placeholder.com/150"
  },
  {
    "nome": "Tarefa 4",
    "descricao": "Descrição da tarefa 4",
    "codigo": "Código: T4",
    "foto": "https://via.placeholder.com/150"
  },
];

class DashBoardFuncionario extends StatefulWidget {
  const DashBoardFuncionario({super.key});

  @override
  _DashBoardFuncionarioState createState() => _DashBoardFuncionarioState();
}

class _DashBoardFuncionarioState extends State<DashBoardFuncionario> {
  List<Map<String, String>> currentTasks = List.from(tasks);

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
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
            child: BlocConsumer<TrabalhoBloc, TrabalhoState>(
              listener: (context, state) {
                if (state is TrabalhoEmptyState) {
                  final email = context.read<AuthBloc>().email;
                  final setor = context.read<AuthBloc>().setor!.toLowerCase();
                  context.read<TrabalhoBloc>().add(TrabalhoLoading(
                        email: email!,
                        setor: setor,
                      ));
                } else if (state is TrabalhoErrorState) {
                  showBlocSnackbar(context, state.message);
                } else if (state is TrabalhoFinishState) {
                  final email = context.read<AuthBloc>().email;
                  final setor = context.read<AuthBloc>().setor!.toLowerCase();
                  context.read<TrabalhoBloc>().add(TrabalhoInit(
                        email: email!,
                        setor: setor,
                      ));
                }
              },
              builder: (context, state) {
                final demandas = state.demandas;
                List<String?> imagens = [];
                for (var demanda in demandas) {
                  final imagem = context
                      .read<ProdutoBloc>()
                      .getImageUrl(demanda['produto_id']);
                  imagens.add(imagem);
                }
                return Center(
                  child: demandas.isNotEmpty
                      ? Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: screenWidth / 5, vertical: 50),
                          child: Align(
                            alignment: Alignment.center,
                            child: Stack(
                              alignment: Alignment.center,
                              children: demandas
                                  .take(5) // Limita a 5 cards no máximo
                                  .toList()
                                  .asMap()
                                  .entries
                                  .map((entry) {
                                    int index = entry.key;
                                    Map<String, dynamic> task = entry.value;

                                    return AnimatedPositioned(
                                      duration: Duration(milliseconds: 500),
                                      top: index * 20.0,
                                      left: index * 20.0,
                                      child: AnimatedOpacity(
                                        duration: Duration(milliseconds: 300),
                                        opacity: 1,
                                        child: Transform.scale(
                                          scale: 1 - (index * 0.05),
                                          child: CardDemanda(
                                            title: task["nome_demanda"] ??
                                                "Sem nome",
                                            width: screenWidth * 0.27,
                                            height: screenHeight * 0.8,
                                            description: task["descricao"] ??
                                                "Sem descrição",
                                            codigo: task["produto_id"] ??
                                                "Sem código",
                                            backgroundColor: Color.lerp(
                                                  const Color.fromARGB(
                                                      255, 235, 235, 235),
                                                  const Color.fromARGB(
                                                      255, 168, 168, 168),
                                                  index / 5,
                                                ) ??
                                                const Color.fromARGB(
                                                    255, 235, 235, 235),
                                            shadowColor: Colors.black
                                                .withOpacity(0.2 + index * 0.1),
                                            onFinish: () {
                                              setState(() {
                                                demandas.removeAt(index);
                                              });
                                            },
                                            imagem: imagens[index],
                                          ),
                                        ),
                                      ),
                                    );
                                  })
                                  .toList()
                                  .reversed
                                  .toList(),
                            ),
                          ),
                        )
                      : Text(
                          "Todas as tarefas foram concluídas!",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
