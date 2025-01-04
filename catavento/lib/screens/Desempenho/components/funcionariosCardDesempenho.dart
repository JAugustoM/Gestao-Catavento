import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class FuncionariosCardDesempenho extends StatefulWidget {
  final String nomeFuncionario;
  final String setor;

  FuncionariosCardDesempenho({
    required this.nomeFuncionario,
    required this.setor,
  });

  @override
  State<FuncionariosCardDesempenho> createState() {
    return FuncionariosCardDesempenhoState();
  }
}

class FuncionariosCardDesempenhoState extends State<FuncionariosCardDesempenho> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      color: AppColors.lightGray,
      child: Row(
        children: [
          SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
          Icon(
            Icons.person,
            color: AppColors.blue,
            size: 45,
          ),
          SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  widget.nomeFuncionario,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.blue
                  ),
                ),
                Text(
                  'Setor: ${widget.setor}',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.blue
                  ),
                )
              ],
            ),
          ),
          IconButton(
            icon: Icon(Icons.info, color: AppColors.blue,),
            onPressed: () {

            },
          )
        ],
      ),
    );
  }
}