import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class Dadosfuncionarios extends StatelessWidget{
  final String nome;
  final String nomeusuario;
  final String email;
  final String setor;

  const Dadosfuncionarios({
    super.key,
    required this.nome,
    required this.nomeusuario,
    required this.email,
    required this.setor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Dados(texto: "Nome: ", info: nome),
        Dados(texto: "Usuario: ", info: nomeusuario),
        Dados(texto: "Email: ", info: email),
        Dados(texto: "Setor: ", info: setor),

      ],
    );
  }
}

class Dados extends StatelessWidget {
  final String texto;
  final String info;

  Dados({
    required this.texto,
    required this.info
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(
          texto,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.blue,
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          info,
          style: TextStyle(
            fontSize: 20,
            color: AppColors.blue,
          )
        )
      ],
    );
  }
}