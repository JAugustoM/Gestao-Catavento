import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class AtivAndamentoCard extends StatelessWidget {
  final String nomeFuncionario;
  final String nomeDemanda;

  const AtivAndamentoCard({
    super.key,
    required this.nomeFuncionario,
    required this.nomeDemanda,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
          title: Text(
            nomeFuncionario,
            style: TextStyle(
                color: AppColors.gradientLightBlue,
                fontFamily: "FredokaOne",
                fontSize: MediaQuery.of(context).size.height * 0.02),
          ),
          subtitle: RichText(
            text: TextSpan(
              style: TextStyle(
                color: AppColors.gradientLightBlue,
                fontFamily: "Fredoka",
                fontSize: MediaQuery.of(context).size.height * 0.018,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: 'Em andamento: ',
                  style: TextStyle(
                    fontFamily: "FredokaOne",
                  ),
                ),
                TextSpan(
                  text: nomeDemanda,
                  style: TextStyle(
                    fontFamily: "Fredoka",
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          )),
    );
  }
}
