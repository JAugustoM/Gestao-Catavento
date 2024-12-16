import 'package:flutter/material.dart';


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
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(nomeFuncionario),
        subtitle: Text(
          'Em andamento: $nomeDemanda'
        ),
      ),
    );
  }
}