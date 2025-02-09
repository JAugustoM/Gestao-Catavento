import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:catavento/bloc/trabalho/trabalho_bloc.dart';
import 'package:catavento/screens/Desempenho/components/bolosDesempenhoCard.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/typedefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listadiario extends StatefulWidget {
  final String email_funcionario;

  Listadiario({required this.email_funcionario});

  @override
  State<Listadiario> createState() {
    return ListadiarioState();
  }
}

class ListadiarioState extends State<Listadiario> {
  final String media = "08:00";
  final String qtde = "55";
  late String email;

  @override
  void initState() {
    super.initState();
    email = widget.email_funcionario;
  }

  // final List<Map<String, String>> bolos = [
  //   {
  //     'nomeDemanda': '{nomeDemanda}',
  //     'inicio': '12:00',
  //     'fim': '13:00',
  //     'duracao': '01:00',
  //     'image': '../catavento/assets/images/cake.png'
  //   },
  //   {
  //     'nomeDemanda': '{nomeDemanda}',
  //     'inicio': '12:00',
  //     'fim': '13:00',
  //     'duracao': '01:00',
  //     'image': '../catavento/assets/images/cake.png'
  //   },
  //   {
  //     'nomeDemanda': '{nomeDemanda}',
  //     'inicio': '12:00',
  //     'fim': '13:00',
  //     'duracao': '01:00',
  //     'image': '../catavento/assets/images/cake.png'
  //   },
  //   {
  //     'nomeDemanda': '{nomeDemanda}',
  //     'inicio': '12:00',
  //     'fim': '13:00',
  //     'duracao': '01:00',
  //     'image': '../catavento/assets/images/cake.png'
  //   },
  //   {
  //     'nomeDemanda': '{nomeDemanda}',
  //     'inicio': '12:00',
  //     'fim': '13:00',
  //     'duracao': '01:00',
  //     'image': '../catavento/assets/images/cake.png'
  //   },
  //   {
  //     'nomeDemanda': '{nomeDemanda}',
  //     'inicio': '12:00',
  //     'fim': '13:00',
  //     'duracao': '01:00',
  //     'image': '../catavento/assets/images/cake.png'
  //   },
  // ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.02,
        ),
        Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: AppColors.gradientDarkBlue),
              borderRadius: BorderRadius.circular(16), // Bordas arredondadas
            ),
            child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                width: MediaQuery.of(context).size.width * 0.5,
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Center(
                      child: Text(
                        'Desempenho médio',
                        style: TextStyle(
                          fontFamily: "FredokaOne",
                          fontWeight: FontWeight.bold,
                          color: AppColors.gradientDarkBlue,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(
                                color: AppColors.gradientDarkBlue,
                                width:
                                    MediaQuery.of(context).size.width * 0.01),
                            borderRadius: BorderRadius.circular(
                                MediaQuery.of(context).size.height * 0.018)),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.01),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Tempo médio por bolo: ",
                                      style: TextStyle(
                                        fontFamily: "FredokaOne",
                                        color: AppColors.gradientDarkBlue,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      media,
                                      style: TextStyle(
                                        fontFamily: "FredokaOne",
                                        color: AppColors.gradientDarkBlue,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Bolos feitos: ",
                                      style: TextStyle(
                                        fontFamily: "FredokaOne",
                                        color: AppColors.gradientDarkBlue,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      qtde,
                                      style: TextStyle(
                                        fontFamily: "FredokaOne",
                                        color: AppColors.gradientDarkBlue,
                                        fontSize:
                                            MediaQuery.of(context).size.height *
                                                0.018,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Center(
                      child: Text(
                        'Desempenhos por bolo',
                        style: TextStyle(
                          fontFamily: "FredokaOne",
                          fontWeight: FontWeight.bold,
                          color: AppColors.gradientDarkBlue,
                          fontSize: MediaQuery.of(context).size.height * 0.022,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    // bolos.isEmpty ? _buildBlockWarning() :
                    _buildListBolos()
                  ],
                ))),
      ],
    );
  }

  Widget _buildListBolos() {
    DatabaseResponse bolos = [];

    return BlocConsumer<RelatorioBloc, RelatorioState>(
      listener: (context, state) async {
        // DatabaseResponse bolos = [];

        // if (bolos.isEmpty) {
        //   context.read<TrabalhoBloc>().add(TrabalhoAdmin());
        //   bolos = await context.read<RelatorioBloc>().getTrabalhosFromUser(email);
        //   // bolos = state.trabalho.toList();
        // }
        // final DatabaseResponse bolos = await context.read<RelatorioBloc>().getTrabalhosFromUser(email);

        // bolos = await context.read<RelatorioBloc>().getTrabalhosFromUser(email);
        // print(bolos);
      },
      builder: (context, state) {
        // bolos = state.trabalho.toList();
        // bolos = context.read<TrabalhoBloc>().trabalhos;
        // bolos = context.read<ReoBloc>().getTrabalhosFromUser(email);

        final bolos = state.funcionarios[email];

        return ListView.builder(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: bolos!.length,
            itemBuilder: (context, index) {
              final bolo = bolos[index];
              return Bolosdesempenhocard(
                nomeDemanda: bolo['demandas(nome_demanda)'] ?? 'Nada',
                inicio: bolo['data_inicio'] ?? 'Nada',
                fim: bolo['data_finalizacao'] ?? 'Nada',
                duracao: bolo['duracao'] ?? 'Nada',
                image: bolo['image'],
                // nomeDemanda: 'Nada',
                // inicio: 'Nada',
                // fim: 'Nada',
                // duracao: 'Nada',
                // image: 'Nada',
              );
            });
      },
    );
  }

  Widget _buildBlockWarning() {
    final size = MediaQuery.of(context).size;

    return Container(
        width: size.width * 0.09,
        height: size.height * 0.15,
        decoration: BoxDecoration(
            color: AppColors.mediumPink,
            borderRadius: BorderRadius.circular(size.height * 0.018)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "A visualização de todos os bolos feitos",
              style: TextStyle(
                  fontSize: size.height * 0.018,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "FredokaOne"),
            ),
            Text(
              "não esta disponível no desempenho",
              style: TextStyle(
                  fontSize: size.height * 0.018,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "FredokaOne"),
            ),
            Text(
              "diário.",
              style: TextStyle(
                  fontSize: size.height * 0.018,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: "FredokaOne"),
            ),
          ],
        ));
  }
}
