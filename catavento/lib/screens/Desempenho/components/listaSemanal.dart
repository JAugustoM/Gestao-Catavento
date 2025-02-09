import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/bloc/produto/produto_bloc.dart';
import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:catavento/core/services/format_time.dart';
import 'package:catavento/screens/Desempenho/components/bolosDesempenhoCard.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Listasemanal extends StatefulWidget {
  final String emailFuncionario;

  const Listasemanal({super.key, required this.emailFuncionario});
  @override
  State<Listasemanal> createState() {
    return ListasemanalState();
  }
}

class ListasemanalState extends State<Listasemanal> {
  late String email;

  @override
  void initState() {
    super.initState();
    email = widget.emailFuncionario;
  }

  final List<Map<String, String>> bolos = [
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '--:--',
      'fim': '--:--',
      'duracao': '--:--',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '--:--',
      'fim': '--:--',
      'duracao': '--:--',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '--:--',
      'fim': '--:--',
      'duracao': '--:--',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '--:--',
      'fim': '--:--',
      'duracao': '--:--',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '--:--',
      'fim': '--:--',
      'duracao': '--:--',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '--:--',
      'fim': '--:--',
      'duracao': '--:--',
      'image': '../catavento/assets/images/cake.png'
    },
  ];

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
                                MediaQuery.of(context).size.height * 0.016)),
                        child: Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.01),
                          child: SizedBox(
                            height: MediaQuery.of(context).size.height * 0.1,
                            child: BlocBuilder<RelatorioBloc, RelatorioState>(
                              builder: (context, state) {
                                final bolos = state.funcionariosSemanal[email];
                                late final int total;
                                int media = 0;
                                if (bolos != null && bolos.isNotEmpty) {
                                  total = bolos.length;
                                  for (var bolo in bolos) {
                                    final duracao =
                                        bolo['duracao'] as Duration?;
                                    media +=
                                        duracao != null ? duracao.inSeconds : 0;
                                  }
                                  media = (media / total).round();
                                } else {
                                  total = 0;
                                }
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Tempo médio por bolo: ",
                                          style: TextStyle(
                                            fontFamily: "FredokaOne",
                                            color: AppColors.gradientDarkBlue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '$media segundos',
                                          style: TextStyle(
                                            fontFamily: "FredokaOne",
                                            color: AppColors.gradientDarkBlue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Bolos feitos: ",
                                          style: TextStyle(
                                            fontFamily: "FredokaOne",
                                            color: AppColors.gradientDarkBlue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          '$total',
                                          style: TextStyle(
                                            fontFamily: "FredokaOne",
                                            color: AppColors.gradientDarkBlue,
                                            fontSize: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.018,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                );
                              },
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
                    bolos.isEmpty ? _buildBlockWarning() : _buildListBolos()
                  ],
                ))),
      ],
    );
  }

  Widget _buildListBolos() {
    return BlocBuilder<RelatorioBloc, RelatorioState>(
      builder: (context, state) {
        final bolos = state.funcionariosSemanal[email];

        return bolos != null
            ? ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: bolos.length,
                itemBuilder: (context, index) {
                  final bolo = bolos[index];
                  final demanda = context
                      .read<DemandaBloc>()
                      .getDemanda(bolo['demanda_id']);
                  final imagem = context
                      .read<ProdutoBloc>()
                      .getImageUrl(demanda!['produto_id']);
                  return Bolosdesempenhocard(
                    nomeDemanda: demanda['nome_demanda'] ?? 'Nada',
                    inicio: bolo['data_inicio'] != null
                        ? formatTime(bolo['data_inicio'])
                        : 'N/A',
                    fim: bolo['data_finalizacao'] != null
                        ? formatTime(bolo['data_finalizacao'])
                        : 'N/A',
                    duracao: bolo['duracao'] != null
                        ? '${(bolo['duracao'] as Duration).inSeconds} segundos'
                        : 'N/A',
                    image: imagem,
                  );
                })
            : _buildBlockWarning();
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
            borderRadius: BorderRadius.circular(size.height * 0.025)),
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
              "semanal.",
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
