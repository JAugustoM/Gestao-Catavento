import 'package:catavento/bloc/usuario/usuario_bloc.dart';
import 'package:catavento/screens/dashboardFuncionarios/components/infoFuncionarios.dart';
import 'package:catavento/shared/widgets/inputs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'DropDownButton.dart';
import 'checkBox.dart';
import 'package:catavento/shared/widgets/dialog.dart';

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
  @override
  Widget build(BuildContext context) {
    final user = context.read<UsuarioBloc>().getUser(widget.email)!;
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          widget.nomeFuncionario,
          style: TextStyle(
              color: AppColors.blue,
              fontFamily: "FredokaOne",
              fontSize: MediaQuery.of(context).size.height * 0.018,
              fontWeight: FontWeight.bold),
        ),
        subtitle: Text(
          'Setor: ${widget.setor}\nStatus: ${widget.status}',
          style: TextStyle(
              color: AppColors.gradientDarkBlue,
              fontFamily: "FredokaOne",
              fontSize: MediaQuery.of(context).size.height * 0.016),
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.info),
              color: AppColors.blue,
              iconSize: MediaQuery.of(context).size.width * 0.014,
              onPressed: () {
                //Lógica ao clicar
                _showInfoEmployeeDialog(user, context);
              },
            ),
            // botão de Editar.
            IconButton(
              icon: Icon(Icons.edit),
              color: AppColors.blue,
              iconSize: MediaQuery.of(context).size.width * 0.014,
              onPressed: () {
                //  editar a demanda
                _showEditEmployeeDialog(context, user);
              },
            ),
            // apagar
            IconButton(
                icon: Icon(Icons.delete),
                color: AppColors.blue,
                iconSize: MediaQuery.of(context).size.width * 0.014,
                onPressed: () async {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return ConfirmDialog(
                        title: 'Confirmar Exclusão',
                        contente:
                            'Tem certeza de que deseja apagar este funcionário?',
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

  void _showEditEmployeeDialog(
      BuildContext context, Map<String, dynamic> user) {
    showDialog(
      context: context,
      builder: (context) {
        final TextEditingController nomeController = TextEditingController();
        final TextEditingController setorController = TextEditingController();
        final TextEditingController emailController = TextEditingController();
        final TextEditingController usuarioController = TextEditingController();
        final TextEditingController senhaController = TextEditingController();
        final TextEditingController tipoController = TextEditingController();

        nomeController.text = user['nome'];
        emailController.text = user['email'];
        usuarioController.text = user['usuario'];

        return ReusableDialog(
          title: "Editar Funcionário",
          confirmBeforeClose: false,
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.012),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text(
                              "Nome",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.016,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: user['nome'],
                            controller: nomeController,
                          ))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Tipo de Acesso',
                            style: TextStyle(
                                fontFamily: "FredokaOne",
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.016,
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              CheckBox(
                                tipo: 'gerente',
                                controller: tipoController,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                'Gerente',
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontFamily: "FredokaOne",
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.016),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              CheckBox(
                                tipo: 'padrao',
                                controller: tipoController,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.01,
                              ),
                              Text(
                                'Funcionário',
                                style: TextStyle(
                                    color: AppColors.blue,
                                    fontFamily: "FredokaOne",
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.016),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016),
                      Row(
                        children: [
                          Text(
                            "Setor*",
                            style: TextStyle(
                                fontSize:
                                    MediaQuery.of(context).size.height * 0.016,
                                fontFamily: "FredokaOne",
                                color: AppColors.blue,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.01,
                          ),
                          Dropdownbutton(
                            controller: setorController,
                          ),
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text(
                              "Email",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.016,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: user['email'],
                            controller: emailController,
                          ))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text(
                              "Nome de Usuário",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.016,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: user['usuario'],
                            controller: usuarioController,
                          ))
                        ],
                      ),
                      SizedBox(
                          height: MediaQuery.of(context).size.height * 0.016),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height * 0.02),
                            child: Text(
                              "Senha",
                              style: TextStyle(
                                  fontFamily: "FredokaOne",
                                  fontSize: MediaQuery.of(context).size.height *
                                      0.016,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.blue),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.height * 0.01,
                          ),
                          Expanded(
                              child: InputTextField(
                            labelText: '',
                            hintText: "",
                            controller: senhaController,
                          ))
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.024),
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      AppColors.gradientDarkBlue,
                      AppColors.gradientLightBlue
                    ], begin: Alignment.centerLeft, end: Alignment.centerRight),
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.022),
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<UsuarioBloc>().add(UsuarioUpdate(
                            nomeController.text,
                            setorController.text,
                            tipoController.text,
                            emailController.text.isEmpty
                                ? user['email']
                                : emailController.text,
                            usuarioController.text,
                            user['id'],
                            senhaController.text,
                          ));
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.transparent,
                      shadowColor: Colors.transparent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                            MediaQuery.of(context).size.height * 0.022),
                      ),
                    ),
                    child: Text(
                      "Concluir",
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "FredokaOne",
                          fontSize: MediaQuery.of(context).size.height * 0.02),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void _showInfoEmployeeDialog(
      Map<String, dynamic> user, BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: user['usuario'], // Mostra o nome de usuário no título
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(
                        MediaQuery.of(context).size.height * 0.012),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Infofuncionarios(
                        nome: user['nome'],
                        email: user['email'],
                        status: user['status'] ?? "Indisponível",
                        setor: user['setor'],
                        demanda: user['demanda'] ?? "Indisponível",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          confirmBeforeClose: false, // Fecha sem confirmação
        );
      },
    );
  }
}
