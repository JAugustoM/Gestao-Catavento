import 'package:flutter/material.dart';
import 'package:catavento/bloc/demanda_bloc.dart';
import 'package:catavento/shared/widgets/dialog.dart';
import 'package:catavento/screens/dashboardAdmin/components/infoCard.dart';
import 'package:catavento/shared/widgets/inputs.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';

class DemandCard extends StatelessWidget {
  final String nomeDemanda;
  final String status;
  final String codigo;
  final String descricao;
  final int id;
  final String imagemUrl;
  final int order;
  final DemandaBloc bloc; // BACKEND

  const DemandCard({
    super.key,
    required this.nomeDemanda,
    required this.codigo,
    required this.status,
    required this.descricao,
    required this.id,
    required this.order,
    required this.imagemUrl,
    required this.bloc, // BACKEND
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _nomeController =
        TextEditingController(text: nomeDemanda);
    final TextEditingController _codigoController =
        TextEditingController(text: codigo);
    final TextEditingController _descricaoController =
        TextEditingController(text: descricao);

    return Card(
      margin: EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        title: Text(nomeDemanda),
        subtitle: Text(
            'Código: ${codigo.isNotEmpty ? codigo : 'Sem código'}\nStatus: $status'),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            imagemUrl.isNotEmpty
                ? Image.network(imagemUrl, width: 50, height: 50)
                : Icon(Icons.image, size: 50),
            IconButton(
              icon: Icon(Icons.info),
              onPressed: () {
                _showInfoDialog(context, nomeDemanda, codigo, descricao, status,
                    "https://via.placeholder.com/150");
              },
            ),
            // botão de Editar.
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                //  editar a demanda
                _showEditDialog(
                    context,
                    _nomeController,
                    _codigoController,
                    _descricaoController,
                    bloc); // BACKEND (não retirar o bloc, o resto OK)
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
                          bloc.add(DemandaDelete(id, order)); // BACKEND
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

  // Função para mostrar as informações da demanda em um diálogo
  void _showInfoDialog(BuildContext context, String nome, String codigo,
      String descricao, String status, String imageUrl) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return ReusableDialog(
          title: "Informações da Demanda",
          body: InfoCard(
            nome: nome,
            codigo: codigo,
            descricao: descricao,
            status: status,
            imageUrl: imageUrl,
          ),
          confirmBeforeClose: false,
        );
      },
    );
  }

  void _showEditDialog(
      BuildContext context,
      TextEditingController nomeController,
      TextEditingController codigoController,
      TextEditingController descricaoController,
      DemandaBloc bloc) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: "Editar Demanda",
          confirmBeforeClose: true, // Ativa a confirmação para fechar a janela
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InputTextField(
                  labelText: "Nome da Demanda",
                  hintText: "Digite o nome da demanda",
                  controller: nomeController,
                ),
                const SizedBox(height: 10),
                InputTextField(
                  labelText: "Código da Demanda",
                  hintText: "Digite o código da demanda",
                  controller: codigoController,
                ),
                const SizedBox(height: 10),
                InputTextField(
                  labelText: "Descrição",
                  hintText: "Digite a descrição",
                  controller: descricaoController,
                  maxLines: 3,
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        // Conexão com o Backend
                        bloc.add(DemandaUpdate(
                          id,
                          order,
                          nomeController.text,
                          codigoController.text,
                          descricaoController.text,
                        ));
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF50B432),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: const Text("Salvar"),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD54A3D),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(22),
                        ),
                      ),
                      child: const Text("Cancelar"),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
