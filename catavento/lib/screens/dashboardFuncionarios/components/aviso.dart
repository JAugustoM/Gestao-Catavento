import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class Aviso extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      height: size.height * 0.09,
      width: size.width * 0.3,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(size.height * 0.02),
      ),
      child: Center(
        child: Text(
          "Nenhuma atividade em andamento.",
          style: TextStyle(
            fontFamily: "FredokaOne",
            color: AppColors.pink,
            fontSize: size.height * 0.018
          ),
        ),
      )
    );
  }
}