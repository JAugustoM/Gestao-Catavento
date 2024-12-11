import 'package:flutter/material.dart';
import 'package:catavento/bloc/demanda_bloc.dart';

import 'package:catavento/screens/dashboardAdmin/components/confirmDialog.dart';

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
                _showInfoDialog(
                    context, nomeDemanda, codigo, descricao, status);
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
      String descricao, String status) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Informações da Demanda"),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Nome: $nome",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Código: $codigo",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Status: $status",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 10),
                Text("Descrição: $descricao",
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text("Fechar"),
            ),
          ],
        );
      },
    );
  }

  // Função que exibe o diálogo de edição
  void _showEditDialog(
      BuildContext context,
      TextEditingController nomeController,
      TextEditingController codigoController,
      TextEditingController descricaoController,
      DemandaBloc bloc) // BACKEND
  {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Editar Demanda"),
          content: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: "Nome da Demanda"),
                ),
                TextField(
                  controller: codigoController,
                  decoration: InputDecoration(labelText: "Código da Demanda"),
                ),
                TextField(
                  controller: descricaoController,
                  decoration:
                      InputDecoration(labelText: "Descrição da Demanda"),
                  maxLines: null, // Permite múltiplas linhas
                  minLines: 4,
                ),
              ],
            ),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                // Atualizar a demanda no Supabase
                bloc.add(DemandaUpdate(
                  id,
                  order,
                  nomeController.text,
                  codigoController.text,
                  descricaoController.text,
                )); // BACKEND
                //_updateDemanda(nomeController.text, codigoController.text,descricaoController.text);
                Navigator.pop(context); // Fechar o diálogo
              },
              child: Text("Salvar"),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Fechar o diálogo sem salvar
              },
              child: Text("Cancelar"),
            ),
          ],
        );
      },
    );
  }
}
