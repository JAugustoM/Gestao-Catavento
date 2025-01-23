import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
  {
    "nome": "Tarefa 5",
    "descricao": "Descrição da tarefa 5",
    "codigo": "Código: T5",
    "foto": "https://via.placeholder.com/150"
  },
  {
    "nome": "Tarefa 6",
    "descricao": "Descrição da tarefa 6",
    "codigo": "Código: T6",
    "foto": "https://via.placeholder.com/150"
  },
  {
    "nome": "Tarefa 7",
    "descricao": "Descrição da tarefa 7",
    "codigo": "Código: T7",
    "foto": "https://via.placeholder.com/150"
  },
  {
    "nome": "Tarefa 8",
    "descricao": "Descrição da tarefa 8",
    "codigo": "Código: T8",
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

  void _removeTask(int index) {
    setState(() {
      currentTasks.removeAt(index);
    });
  }

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
            child: Center(
              child: currentTasks.isNotEmpty
                  ? Container(
                margin: EdgeInsets.symmetric(
                    horizontal: screenWidth / 5, vertical: 50),
                child: Align(
                  alignment: Alignment.center,
                  child: Stack(
                    alignment: Alignment.center,
                    children: currentTasks
                        .take(5) // Limita a 5 cards no máximo
                        .toList()
                        .asMap()
                        .entries
                        .map((entry) {
                      int index = entry.key;
                      Map<String, String> task = entry.value;

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
                              title: task["nome"]!,
                              //width: screenWidth * 0.27,
                              //height: screenHeight * 0.8,
                              description: task["descricao"]!,
                              codigo: task["codigo"]!,
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
                              onFinish: () => _removeTask(index),
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
                style:
                TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}