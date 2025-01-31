import 'package:catavento/screens/Desempenho/components/bolosDesempenhoCard.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Listamensal extends StatefulWidget {
  @override
  State<Listamensal> createState() {
    return ListamensalState();
  }
}

class ListamensalState extends State<Listamensal> {
  final String media = "00:00";
  final String qtde = "0";
  final List<Map<String, String>> bolos = [
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '00:00',
      'fim': '00:00',
      'duracao': '00:00',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '00:00',
      'fim': '00:00',
      'duracao': '00:00',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '00:00',
      'fim': '00:00',
      'duracao': '00:00',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '00:00',
      'fim': '00:00',
      'duracao': '00:00',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '00:00',
      'fim': '00:00',
      'duracao': '00:00',
      'image': '../catavento/assets/images/cake.png'
    },
    {
      'nomeDemanda': '{nomeDemanda}',
      'inicio': '00:00',
      'fim': '00:00',
      'duracao': '00:00',
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
                            color: AppColors.gradientDarkBlue,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.bold),
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
                            color: AppColors.gradientDarkBlue,
                            fontSize:
                                MediaQuery.of(context).size.height * 0.022,
                            fontWeight: FontWeight.bold),
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
    return ListView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: bolos.length,
        itemBuilder: (context, index) {
          final bolo = bolos[index];
          return Bolosdesempenhocard(
            nomeDemanda: bolo['nomeDemanda']!,
            inicio: bolo['inicio']!,
            fim: bolo['fim']!,
            duracao: bolo['duracao']!,
            image: bolo['image']!,
          );
        });
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
              "mensal.",
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
