import 'package:catavento/bloc/auth/auth_bloc.dart';
import 'package:catavento/bloc/produto/produto_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/shared/widgets/bloc_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import "../../shared/widgets/menuBar.dart";
import "./components/cardDemandaFuncionario.dart";

class DashBoardFuncionario extends StatefulWidget {
  const DashBoardFuncionario({super.key});

  @override
  _DashBoardFuncionarioState createState() => _DashBoardFuncionarioState();
}

class _DashBoardFuncionarioState extends State<DashBoardFuncionario> {
  List<Map<String, dynamic>> demandas = [];
  CardDemanda? card;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    final List<CardDemanda?> cards = [
      null,
      CardDemanda(
        key: Key('2'),
        title: "Carregando",
        width: screenWidth * 0.27,
        height: screenHeight * 0.8,
        description: "Carregando",
        codigo: "Carregando",
        imagem: null,
        status: -1,
        backgroundColor: Color.lerp(
              const Color.fromARGB(255, 235, 235, 235),
              const Color.fromARGB(255, 168, 168, 168),
              0,
            ) ??
            const Color.fromARGB(255, 235, 235, 235),
        shadowColor: Colors.black.withValues(alpha: 0),
        onCronometroFinalizado: () {
          setState(() {});
        },
      ),
      CardDemanda(
        key: Key('3'),
        title: "Carregando",
        width: screenWidth * 0.27,
        height: screenHeight * 0.8,
        description: "Carregando",
        codigo: "Carregando",
        imagem: null,
        status: -1,
        backgroundColor: Color.lerp(
              const Color.fromARGB(255, 235, 235, 235),
              const Color.fromARGB(255, 168, 168, 168),
              0,
            ) ??
            const Color.fromARGB(255, 235, 235, 235),
        shadowColor: Colors.black.withValues(alpha: 0),
        onCronometroFinalizado: () {
          setState(() {});
        },
      ),
      CardDemanda(
        key: Key('4'),
        title: "Carregando",
        width: screenWidth * 0.27,
        height: screenHeight * 0.8,
        description: "Carregando",
        codigo: "Carregando",
        imagem: null,
        status: -1,
        backgroundColor: Color.lerp(
              const Color.fromARGB(255, 235, 235, 235),
              const Color.fromARGB(255, 168, 168, 168),
              0,
            ) ??
            const Color.fromARGB(255, 235, 235, 235),
        shadowColor: Colors.black.withValues(alpha: 0),
        onCronometroFinalizado: () {
          setState(() {});
        },
      ),
      CardDemanda(
        key: Key('5'),
        title: "Carregando",
        width: screenWidth * 0.27,
        height: screenHeight * 0.8,
        description: "Carregando",
        codigo: "Carregando",
        imagem: null,
        status: -1,
        backgroundColor: Color.lerp(
              const Color.fromARGB(255, 235, 235, 235),
              const Color.fromARGB(255, 168, 168, 168),
              0,
            ) ??
            const Color.fromARGB(255, 235, 235, 235),
        shadowColor: Colors.black.withValues(alpha: 0),
        onCronometroFinalizado: () {
          setState(() {});
        },
      ),
    ];

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
                if (state is TrabalhoErrorState) {
                  showBlocSnackbar(context, state.message);
                } else if (state is TrabalhoFinishState) {
                  final email = context.read<AuthBloc>().email;
                  final setor = context.read<AuthBloc>().setor;
                  context.read<TrabalhoBloc>().add(TrabalhoGet(
                        email: email!,
                        setor: setor!.toLowerCase(),
                      ));
                }
              },
              builder: (context, state) {
                int? faltam;
                if (state is TrabalhoGetState ||
                    state is TrabalhoLoadingState) {
                  if (state.demandas.isNotEmpty) {
                    demandas = state.demandas;
                  }
                  if (state.metaData.isNotEmpty) {
                    final metaData = state.metaData;
                    faltam = metaData['faltam'];
                  }
                }

                final setor = context.read<AuthBloc>().setor!.toLowerCase();
                List<String?> imagens = [];
                for (var demanda in demandas) {
                  final imagem = context
                      .read<ProdutoBloc>()
                      .getImageUrl(demanda['produto_id']);
                  imagens.add(imagem);
                }
                if (demandas.isNotEmpty) {
                  final demanda = demandas.first;
                  cards[0] = CardDemanda(
                    key: Key('${demanda['id']}'),
                    title: demanda["nome_demanda"]!,
                    width: screenWidth * 0.27,
                    height: screenHeight * 0.8,
                    description: demanda["descricao"]!,
                    codigo: demanda["produto_id"] ?? "Sem código",
                    imagem: imagens.first,
                    status: demanda["status_$setor"] ?? 0,
                    backgroundColor: Color.lerp(
                          const Color.fromARGB(255, 235, 235, 235),
                          const Color.fromARGB(255, 168, 168, 168),
                          0,
                        ) ??
                        const Color.fromARGB(255, 235, 235, 235),
                    shadowColor: Colors.black.withValues(alpha: 0.3),
                    onCronometroFinalizado: () {
                      setState(() {
                        cards[0] = null;
                      });
                    },
                  );
                }

                return Center(
                    child: cards[0] != null
                        ? Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: screenWidth / 5, vertical: 50),
                            child: Align(
                              alignment: Alignment.center,
                              child: Stack(
                                alignment: Alignment.center,
                                children: cards
                                    .take(faltam ?? 5)
                                    .toList()
                                    .asMap()
                                    .entries
                                    .map((entry) {
                                      int index = entry.key;

                                      return AnimatedPositioned(
                                        duration: Duration(milliseconds: 500),
                                        top: index * 20.0,
                                        left: index * 20.0,
                                        child: AnimatedOpacity(
                                          duration: Duration(milliseconds: 300),
                                          opacity: 1,
                                          child: Transform.scale(
                                            scale: 1 - (index * 0.05),
                                            child: cards[index],
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
                          ));
              },
            ),
          ),
        ],
      ),
    );
  }
}
