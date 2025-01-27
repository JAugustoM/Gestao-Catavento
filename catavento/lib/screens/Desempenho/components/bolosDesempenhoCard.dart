import 'dart:io';

import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';


class Bolosdesempenhocard extends StatefulWidget{
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
      child: Row(
        children: [
          SizedBox(width: screenWidth * 0.03,),
          Container(
            height: screenHeight * 0.08,
            width: screenWidth * 0.05,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(50)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.file(
                File (widget.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(width: screenWidth * 0.08,),
          Column(
            children: [
              Center(
                child: Text(
                  widget.nomeDemanda,
                  style: TextStyle(
                    fontSize: screenHeight * 0.016,
                    fontFamily: "FredokaOne",
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
              SizedBox(height: screenHeight * 0.02,),
              Row(
                children: [
                  Info(texto: 'Inicio: ', info: widget.inicio),
                  SizedBox(width: screenWidth * 0.02,),
                  Info(texto: 'Fim: ', info: widget.fim)
                ],
              ),
              Info(texto: 'Duração: ', info: widget.duracao),
            ],
          )
        ],
      ),
    );
  }
}

class Info extends StatelessWidget {
  final String texto;
  final String info;

  Info({
    required this.texto,
    required this.info
  });

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
            fontSize: screenHeight * 0.014,
            fontFamily: "FredokaOne",
            color: AppColors.blue,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontSize: screenHeight * 0.014,
            fontFamily: "FredokaOne",
            color: AppColors.blue,
          )
        )
      ],
    );
  }
}