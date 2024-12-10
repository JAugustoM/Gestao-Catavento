import 'package:flutter/material.dart';
import 'package:catavento/bloc/demanda_bloc.dart';

import 'package:catavento/screens/components/confirmDialog.dart';
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
