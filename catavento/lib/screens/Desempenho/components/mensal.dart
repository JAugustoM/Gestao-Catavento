import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:catavento/screens/Desempenho/components/desempenhoGeral.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catavento/screens/Desempenho/components/blocksIcon.dart';
import 'package:catavento/screens/Desempenho/components/graficoM.dart';
import 'package:catavento/screens/Desempenho/components/info.dart';
import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class Mensal extends StatefulWidget {
  @override
  State<Mensal> createState() {
    return MensalState();
  }
}

class MensalState extends State<Mensal> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final mensal = context.read<RelatorioBloc>().mensal();
    final menos = mensal.keys.last;
    final mais = mensal.keys.first;

    final bolosMensal = context.read<RelatorioBloc>().bolosMensal();
    final boloMenos = bolosMensal.keys.last;
    final boloMais = bolosMensal.keys.first;

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
            child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(flex: 2, child: DesempenhoGeralWidget(periodo: 2)),
            SizedBox(
              width: size.width * 0.02,
            ),
            Flexible(flex: 3, child: _desempenhoLoja(context, menos, mais)),
            SizedBox(
              width: size.width * 0.02,
            ),
            Flexible(flex: 2, child: _vendidos(context, boloMais, boloMenos)),
          ],
        ));
      },
    );
  }

  /*Widget _desempenhoGeral(context) {
    final size = MediaQuery.of(context).size;

    return BlocksIcon(
        width: size.width * 0.29,
        height: size.height * 0.38,
        borderRadius: 0.02,
        icon: Icons.payments_outlined,
        title: "Desempenho geral",
        color: Colors.white,
        child: Padding(
            padding: EdgeInsets.only(top: size.height * 0.050),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: size.width * 0.2,
                  height: size.height * 0.14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(size.height * 0.025),
                      color: Colors.green),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Melhor desempenho",
                        style: TextStyle(
                            fontFamily: "FredokaOne",
                            fontSize: size.height * 0.021,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      Info(
                          text: "Data: ",
                          info:
                              "10/01/2025"), //Mudar os infos para as informações reais (backend)
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      Info(text: "Quantidade de vendas: ", info: "10"),
                    ],
                  ),
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Container(
                  width: size.width * 0.2,
                  height: size.height * 0.14,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(size.height * 0.025),
                    color: Colors.red,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Pior desempenho",
                        style: TextStyle(
                            fontFamily: "FredokaOne",
                            fontSize: size.height * 0.021,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      Info(
                          text: "Data: ",
                          info:
                              "10/02/2025"), //Mudar os infos para as informações reais (backend)
                      SizedBox(
                        height: size.height * 0.002,
                      ),
                      Info(text: "Quantidade de vendas: ", info: "0"),
                    ],
                  ),
                ),
              ],
            )));
  }*/

  Widget _desempenhoLoja(context, String menos, String mais) {
    final size = MediaQuery.of(context).size;

    return BlocksIcon(
        width: size.width * 0.36,
        height: size.height * 0.59,
        icon: Icons.cake_outlined,
        title: "Desempenho por loja",
        borderRadius: 0.02,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: size.width * 0.02),
                  child: Text(
                    "Produtos vendidos",
                    style: TextStyle(
                        fontSize: size.height * 0.02,
                        fontFamily: "FredokaOne",
                        color: AppColors.gradientDarkBlue,
                        fontWeight: FontWeight.bold),
                  ),
                )),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              width: size.width * 0.33,
              height: size.height * 0.25,
              child: Expanded(
                flex: 3,
                child: BarGraficM(),
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Container(
              width: size.width * 0.23,
              height: size.height * 0.12,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(size.height * 0.025),
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientDarkBlue,
                    AppColors.gradientLightBlue,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Info(text: "Melhor Desempenho ", info: mais),
                  SizedBox(
                    height: size.height * 0.002,
                  ),
                  Info(text: "Pior Desempenho: ", info: menos),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _vendidos(context, String nomeBoloMais, String nomeBoloMenos) {
    final size = MediaQuery.of(context).size;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        BlocksIcon(
            width: size.width * 0.29,
            height: size.height * 0.28,
            icon: Icons.cake_outlined,
            title: "Bolo Mais Vendido",
            borderRadius: 0.02,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.025),
              child: Container(
                  width: size.width * 0.19,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(size.height * 0.02),
                      border: Border.all(color: AppColors.blue, width: 10)),
                  child: Center(
                    child: Text(
                      nomeBoloMais,
                      style: TextStyle(
                          fontFamily: "FredokaOne",
                          fontSize: size.height * 0.018,
                          color: AppColors.gradientDarkBlue),
                    ),
                  )),
            )),
        SizedBox(
          height: size.width * 0.02,
        ),
        BlocksIcon(
            width: size.width * 0.29,
            height: size.height * 0.28,
            icon: Icons.cake_outlined,
            title: "Bolo Menos Vendido",
            borderRadius: 0.02,
            color: Colors.white,
            child: Padding(
              padding: EdgeInsets.only(top: size.height * 0.025),
              child: Container(
                  width: size.width * 0.19,
                  height: size.height * 0.15,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(size.height * 0.02),
                      border: Border.all(color: AppColors.blue, width: 10)),
                  child: Center(
                    child: Text(
                      nomeBoloMenos,
                      style: TextStyle(
                          fontFamily: "FredokaOne",
                          fontSize: size.height * 0.020,
                          color: AppColors.gradientDarkBlue),
                    ),
                  )),
            )),
      ],
    );
  }
}
