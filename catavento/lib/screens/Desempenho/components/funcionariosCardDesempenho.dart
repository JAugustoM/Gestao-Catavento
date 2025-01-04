import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/shared/widgets/dialog.dart';
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
  //Dados temporarios
  final String nome = '{nomeFuncionario}';
  final String setor = '{setor}';
  final String mediaDesempenho = '00:00';

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
              _showInfoDialog(context, nome, setor, mediaDesempenho);
            },
          )
        ],
      ),
    );
  }

  void _showInfoDialog(BuildContext context, String nome, String setor,
      String mediaDesempenho) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          backgroundColor: AppColors.lightGray,
          title: nome,
          body: SingleChildScrollView(
            // Adicionando SingleChildScrollView para evitar overflow
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.circular(16), // Bordas arredondadas
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Código
                      Row(
                        children: [
                          Icon(Icons.person, color: AppColors.blue,),
                          Text(
                            'Dados',
                            style: TextStyle(
                              color: AppColors.blue,
                              fontSize: 16
                            ),
                          )
                        ],
                      ),
                      Center(
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.17,
                          width: MediaQuery.of(context).size.width * 0.1,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(70),
                            color: AppColors.lightGray
                          ),
                          child: Icon(Icons.person, color: AppColors.blue, size: 70,),
                        )
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                      Center(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Text(
                                  'Nome: ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  nome,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blue
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                            Row(
                              children: [
                                Text(
                                  'Setor: ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold
                                  ),
                                ),
                                Text(
                                  setor,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blue
                                  ),
                                )
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height * 0.01,),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    
                                  },
                                  child: Text(
                                  'Desempenho: ',
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blue,
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.underline,
                                  ),
                                ),
                                ),

                                InkWell(
                                  onTap: () {
                                    
                                  },
                                  child: Text(
                                  mediaDesempenho,
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: AppColors.blue,
                                    decoration: TextDecoration.underline
                                  ),
                                ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}