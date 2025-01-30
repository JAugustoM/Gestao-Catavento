import 'package:catavento/screens/Desempenho/components/bolosDesempenhoCard.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Listasemanal extends StatefulWidget {

   @override
  State<Listasemanal> createState() {
    return ListasemanalState();
  }
}

class ListasemanalState extends State<Listasemanal> {
  final String media = "--:--";
  final String qtde = "100";
  final List<Map<String, String>> bolos = [
    {'nomeDemanda': '{nomeDemanda}', 'inicio': '--:--', 'fim' : '--:--', 'duracao' : '--:--', 'image' : '../catavento/assets/images/cake.png'},
    {'nomeDemanda': '{nomeDemanda}', 'inicio': '--:--', 'fim' : '--:--', 'duracao' : '--:--', 'image' : '../catavento/assets/images/cake.png'},
    {'nomeDemanda': '{nomeDemanda}', 'inicio': '--:--', 'fim' : '--:--', 'duracao' : '--:--', 'image' : '../catavento/assets/images/cake.png'},
    {'nomeDemanda': '{nomeDemanda}', 'inicio': '--:--', 'fim' : '--:--', 'duracao' : '--:--', 'image' : '../catavento/assets/images/cake.png'},
    {'nomeDemanda': '{nomeDemanda}', 'inicio': '--:--', 'fim' : '--:--', 'duracao' : '--:--', 'image' : '../catavento/assets/images/cake.png'},
    {'nomeDemanda': '{nomeDemanda}', 'inicio': '--:--', 'fim' : '--:--', 'duracao' : '--:--', 'image' : '../catavento/assets/images/cake.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: AppColors.gradientDarkBlue),
            borderRadius:
                BorderRadius.circular(16), // Bordas arredondadas
          ),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.5,
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Center(
                  child: Text(
                    'Desempenho médio',
                    style: TextStyle(
                      fontFamily: "FredokaOne",
                      color: AppColors.gradientDarkBlue,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                Card(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(color: AppColors.gradientDarkBlue, width: MediaQuery.of(context).size.width * 0.01),
                    borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.016)
                  ),
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
                              fontSize: MediaQuery.of(context).size.height * 0.016,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            media,
                            style: TextStyle(
                              fontFamily: "FredokaOne",
                              color: AppColors.gradientDarkBlue,
                              fontSize: MediaQuery.of(context).size.height * 0.016
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Bolos feitos: ",
                            style: TextStyle(
                              fontFamily: "FredokaOne",
                              color: AppColors.gradientDarkBlue,
                              fontSize: MediaQuery.of(context).size.height * 0.016,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            qtde,
                            style: TextStyle(
                              fontFamily: "FredokaOne",
                              color: AppColors.gradientDarkBlue,
                              fontSize: MediaQuery.of(context).size.height * 0.016
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  )
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Center(
                  child: Text(
                    'Desempenhos por bolo',
                    style: TextStyle(
                      fontFamily: "FredokaOne",
                      color: AppColors.gradientDarkBlue,
                      fontSize: MediaQuery.of(context).size.height * 0.018,
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                _buildListBolos()
              ],
            )
          )
        ),
      ],
    );
  }

  Widget _buildListBolos(){
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
      }
    );
  }
}