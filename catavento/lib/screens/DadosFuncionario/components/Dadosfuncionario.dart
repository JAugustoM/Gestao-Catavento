import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class WidgetDadosFuncionario extends StatelessWidget {
  final String nome;
  final String nomeusuario;
  final String email;
  final String setor;

  const WidgetDadosFuncionario({
    super.key,
    required this.nome,
    required this.nomeusuario,
    required this.email,
    required this.setor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color(0xFFEBEBEB),
          borderRadius: BorderRadius.circular(12)
      ),
      height: 244,
      width: 530,
      child: Column(
        children: [
          Padding(padding: EdgeInsets.all(20), child: Column(
            children: [
              Container(

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.person_outline, color: Color(0xFF015C98)),
                    Text("Meus Dados", style: TextStyle(
                        color: Color(0xFF015C98),
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),)
                  ],
                ),
              ),
              SizedBox(height: 20,),
              Container(
                  height: 140,
                  width: 500,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12)
                  ),
                  child: Padding(padding: EdgeInsets.all(20), child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text("Nome: "),
                          Text("nome do usuario"),
                        ],
                      )
                    ],
                  ),)
              )
            ],
          ),)
        ],
      ),
    );
  }
}
