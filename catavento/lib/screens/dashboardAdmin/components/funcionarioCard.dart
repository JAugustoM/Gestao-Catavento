import 'package:catavento/screens/components/infoFuncionarios.dart';
import 'package:catavento/screens/components/showDialog.dart';
import 'package:flutter/material.dart';
import 'input.dart';
import 'confirmDialog.dart';

class FuncionarioCard extends StatefulWidget{
  final String nomeFuncionario;
  final String status;
  final String setor;

  const FuncionarioCard({
    super.key,
    required this.nomeFuncionario,
    required this.setor,
    required this.status,
  });

  @override
  State<FuncionarioCard> createState() {
    return FuncionarioCardState();
  }
}

class FuncionarioCardState extends State<FuncionarioCard>{
  
  @override
  Widget build(BuildContext context) {

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(widget.nomeFuncionario),
        subtitle: Text(
            'Setor: ${widget.setor}\nStatus: ${widget.status}'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                //Lógica ao clicar
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Showdialog(
                      width: 463,
                      height: 402,
                      title: 'nomeFuncionario', //Inserir o nome do funcionario
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Infofuncionarios(nome: "Fulano", email: "email", status: "Ativo", setor: "Montagem", demanda: "Hello Kitty")  //Trocar para as informações do banco de dados
                        ]
                      ),
                    );
                  },
                );
                
              },
            ),
            // botão de Editar.
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                //  editar a demanda
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return Showdialog(
                      width: 463,
                      height: 402,
                      title: 'Editar',
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,

                        children: [
                          Inputs(text: "Nome:",),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Inputs(text: "Setor:",),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Inputs(text: "Email:",),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Inputs(text: "Nome de usuário:",),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.02),
                          Inputs(text: "Senha:",),
                          SizedBox(height: MediaQuery.of(context).size.height * 0.08),

                          Positioned.fill(
                            child: Center(
                              child: ElevatedButton(onPressed: (){
                                //Lógica do botão
                                Navigator.pop(context);
                              }, 
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.green,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(22)
                                )
                              ),
                              child: Text(
                                "Cadastrar",
                                style: TextStyle(color: Colors.white),
                                )

                              )
                            )
                          )
                        ]
                      ),
                    );
                  },
                );
                
              },
            ),
            // apagar
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmDialog(
                        title: 'Confirmar Exclusão',
                        contente:
                            'Tem certeza de que deseja apagar esta demanda?',
                        onConfirm: () {
                          Navigator.of(context).pop(); // Fecha o diálogo
                          //Lógica do botão
                        },
                      );
                    },
                  );
                }),
          ],
        ),
      ),
    );
  }
}