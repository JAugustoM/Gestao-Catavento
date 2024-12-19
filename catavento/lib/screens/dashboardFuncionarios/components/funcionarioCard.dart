import 'package:catavento/screens/dashboardFuncionarios/components/infoFuncionarios.dart';
import 'package:flutter/material.dart';
import '../../../shared/widgets/input.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'DropDownButton.dart';
import 'checkBox.dart';

class FuncionarioCard extends StatefulWidget {
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

class FuncionarioCardState extends State<FuncionarioCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(
          widget.nomeFuncionario,
          style: TextStyle(
            color: AppColors.blue,
            fontWeight: FontWeight.bold
          ),),
        subtitle: Text('Setor: ${widget.setor}\nStatus: ${widget.status}',
        style: TextStyle(color: AppColors.blue),),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: Icon(Icons.info),
              color: AppColors.blue,
              onPressed: () {
                //Lógica ao clicar
                _showInfoEmployeeDialog('Maria', context);
              },
            ),
            // botão de Editar.
            IconButton(
              icon: Icon(Icons.edit),
              color: AppColors.blue,
              onPressed: () {
                //  editar a demanda
                _showEditEmployeeDialog(context);
              },
            ),
            // apagar
            IconButton(
                icon: Icon(Icons.delete),
                color: AppColors.blue,
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
  void _showEditEmployeeDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double dialogWidth = constraints.maxWidth * 0.9; // 90% da largura disponível
            if (dialogWidth > 500) {
              dialogWidth = 500; // Limite máximo de largura
            }

            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: dialogWidth),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Editar Funcionario',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue,
                              ),
                            ),
                          )),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Inputs(text: "Nome"),
                            const SizedBox(height: 16),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'Tipo de Acesso',
                                  style: TextStyle(
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Row(
                                  children: [
                                    CheckBox(),
                                    const Text(
                                      'Gerente',
                                      style: TextStyle(color: AppColors.blue),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    CheckBox(),
                                    const Text(
                                      'Funcionário',
                                      style: TextStyle(color: AppColors.blue),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 16),
                            Row(
                              children: [
                                Text(
                                  "Setor*",
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: AppColors.blue,
                                      fontWeight: FontWeight.bold),
                                ),
                                Dropdownbutton()
                              ],
                            ),
                            const SizedBox(height: 16),
                            Inputs(text: "Email"),
                            const SizedBox(height: 16),
                            Inputs(text: "Nome de Usuário"),
                            const SizedBox(height: 16),
                            Inputs(text: "Senha"),
                          ],
                        ),
                      ),
                      const SizedBox(height: 24),
                      ElevatedButton(
                        onPressed: () => Navigator.pop(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.blue,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(22),
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                        ),
                        child: const Text(
                          "Concluir",
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}

void _showInfoEmployeeDialog(String nomeFunc,BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        child: LayoutBuilder(
          builder: (context, constraints) {
            double dialogWidth = constraints.maxWidth * 0.9; // 90% da largura disponível
            if (dialogWidth > 500) {
              dialogWidth = 500; // Limite máximo de largura
            }

            return ConstrainedBox(
              constraints: BoxConstraints(maxWidth: dialogWidth),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: Align(
                            alignment: Alignment.center,
                            child: Text(
                              nomeFunc,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: AppColors.blue,
                              ),
                            ),
                          )),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: Icon(
                              Icons.close,
                              size: 25,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Infofuncionarios(
                              nome: "Fulano",
                              email: "email",
                              status: "Ativo",
                              setor: "Montagem",
                              demanda: "Hello Kitty"
                            ) //Trocar para as informações do banco de dados
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      );
    },
  );
}
}