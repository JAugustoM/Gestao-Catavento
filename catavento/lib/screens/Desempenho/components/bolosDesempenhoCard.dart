import 'dart:io';

import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class Bolosdesempenhocard extends StatefulWidget {
  final String nomeDemanda;
  final String inicio;
  final String fim;
  final String duracao;
  final String image;

  const Bolosdesempenhocard({
    super.key,
    required this.nomeDemanda,
    required this.inicio,
    required this.fim,
    required this.duracao,
    required this.image,
  });

  @override
  State<Bolosdesempenhocard> createState() {
    return BolosdesempenhocardState();
  }
}

class BolosdesempenhocardState extends State<Bolosdesempenhocard> {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Card(
      color: AppColors.lightGray,
      child: Padding(
        padding: EdgeInsets.all(screenWidth * 0.01),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: screenHeight * 0.1,
              width: screenWidth * 0.08, // Ajustei a largura
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: Image.file(
                  File(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: screenWidth * 0.04,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.nomeDemanda,
                    style: TextStyle(
                      fontSize: screenHeight * 0.018,
                      fontFamily: "FredokaOne",
                      color: AppColors.gradientDarkBlue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Info(texto: 'Inicio: ', info: widget.inicio),
                      SizedBox(width: screenWidth * 0.02),
                      Info(texto: 'Fim: ', info: widget.fim),
                    ],
                  ),
                  SizedBox(height: screenHeight * 0.005),
                  Info(texto: 'Duração: ', info: widget.duracao),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String texto;
  final String info;

  Info({required this.texto, required this.info});

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          texto,
          style: TextStyle(
              fontSize: screenHeight * 0.018,
              fontFamily: "FredokaOne",
              color: AppColors.gradientDarkBlue,
              fontWeight: FontWeight.bold),
        ),
        Text(info,
            style: TextStyle(
              fontSize: screenHeight * 0.018,
              fontFamily: "Fredoka",
              fontWeight: FontWeight.bold,
              color: AppColors.gradientDarkBlue,
            ))
      ],
    );
  }
}
