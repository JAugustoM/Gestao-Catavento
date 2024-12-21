import 'package:catavento/bloc/usuario_bloc.dart';
import 'package:catavento/screens/dashboardFuncionarios/components/infoFuncionarios.dart';
import 'package:catavento/shared/widgets/showDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../shared/widgets/input.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';

class FuncionarioCard extends StatefulWidget {
  final String nomeFuncionario;
  final String status;
  final String setor;
  final String email;

  const FuncionarioCard({
    super.key,
    required this.nomeFuncionario,
    required this.setor,
    required this.status,
    required this.email,
  });

  @override
  State<FuncionarioCard> createState() {
    return FuncionarioCardState();
  }
}

class FuncionarioCardState extends State<FuncionarioCard> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _setorController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usuarioController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final user = context.read<UsuarioBloc>().getUser(widget.email)!;
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(user['usuario']),
        subtitle: Text('Setor: ${user['setor']}\nStatus: ${user['status']}'),
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
                      title: user['usuario'], //Inserir o nome do funcionario
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Infofuncionarios(
                                nome: user['nome'],
                                email: user['email'],
                                status: "Ativo",
                                setor: user['setor'],
                                demanda:
                                    "Hello Kitty") //Trocar para as informações do banco de dados
                          ]),
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
                            Inputs(
                              text: "Nome:",
                              controller: _nomeController,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Inputs(
                              text: "Setor:",
                              controller: _setorController,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Inputs(
                              text: "Email:",
                              controller: _emailController,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Inputs(
                              text: "Nome de usuário:",
                              controller: _usuarioController,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02),
                            Inputs(
                              text: "Senha:",
                              controller: _senhaController,
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.08),
                            Positioned.fill(
                                child: Center(
                                    child: ElevatedButton(
                                        onPressed: () {
                                          context
                                              .read<UsuarioBloc>()
                                              .add(UsuarioUpdate(
                                                _nomeController.text,
                                                _setorController.text,
                                                _emailController.text,
                                                _usuarioController.text,
                                                user['id'],
                                              ));
                                          Navigator.pop(context);
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.green,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(22))),
                                        child: Text(
                                          "Cadastrar",
                                          style: TextStyle(color: Colors.white),
                                        ))))
                          ]),
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
                          context.read<UsuarioBloc>().add(UsuarioDelete(
                                user['id'],
                                user['email'],
                              ));
                          Navigator.of(context).pop();
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
