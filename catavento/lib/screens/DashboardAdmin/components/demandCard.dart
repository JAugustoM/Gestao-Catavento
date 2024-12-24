import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:catavento/bloc/demanda_bloc.dart';
import 'package:catavento/shared/widgets/dialog.dart';
import 'package:catavento/shared/widgets/inputs.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';

class DemandCard extends StatelessWidget {
  final String nomeDemanda;
  final String status;
  final String codigo;
  final String descricao;
  final bool isPriority; // Novo argumento para controlar o ícone de prioridade
  final String
      plataforma; // Novo argumento para controlar a plataforma da demanda
  final String imagemUrl;
  final int id;
  final int order;
  final DemandaBloc bloc; // BACKEND

  const DemandCard({
    super.key,
    required this.nomeDemanda,
    required this.status,
    required this.codigo,
    required this.descricao,
    required this.plataforma,
    required this.id,
    required this.order,
    required this.imagemUrl,
    required this.bloc, // BACKEND
    this.isPriority = false, // Padrão para false caso não seja informado
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController nomeController =
        TextEditingController(text: nomeDemanda);
    final TextEditingController codigoController =
        TextEditingController(text: codigo);
    final TextEditingController descricaoController =
        TextEditingController(text: descricao);
    return Card(
      color: Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      elevation: 4,
      child: SizedBox(
        height: 150, // Define a altura fixa do card
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            crossAxisAlignment:
                CrossAxisAlignment.center, // Centraliza verticalmente
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  color: AppColors.lightGray,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: const Icon(Icons.image, size: 30, color: Colors.grey),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '$nomeDemanda ($codigo)',
                            style: const TextStyle(
                              fontSize: 14,
                              fontFamily: "FredokaOne",
                              color: AppColors.gradientDarkBlue,
                            ),
                          ),
                        ),
                        if (isPriority)
                          const Icon(
                            Icons.warning,
                            color: Colors.red,
                            size: 20,
                          ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Plataforma: ",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.gradientDarkBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$plataforma",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.gradientDarkBlue,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Descrição: ",
                          style: TextStyle(
                              fontSize: 14,
                              color: AppColors.gradientDarkBlue,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "$descricao",
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.gradientDarkBlue,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: Icon(Icons.info, color: AppColors.gradientDarkBlue),
                    onPressed: () {
                      _showInfoDialog(context, nomeDemanda, codigo, descricao,
                          status, "https://via.placeholder.com/150");
                    },
                  ),
                  // botão de Editar.
                  IconButton(
                    icon: Icon(Icons.edit, color: AppColors.gradientDarkBlue),
                    onPressed: () {
                      //  editar a demanda
                      _showEditDialog(
                          context,
                          nomeController,
                          codigoController,
                          descricaoController,
                          bloc); // BACKEND (não retirar o bloc, o resto OK)
                    },
                  ),
                  // apagar
                  IconButton(
                      icon:
                          Icon(Icons.delete, color: AppColors.gradientDarkBlue),
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
            ],
          ),
        ),
      ),
    );
  }

  // Função para mostrar as informações da demanda em um diálogo
  void _showInfoDialog(BuildContext context, String nome, String codigo,
    String descricao, String status, String imageUrl) {
  showDialog(
    context: context,
    builder: (context) {
      return ReusableDialog(
        title: nome,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagem e informações gerais
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    'assets/images/photo.jpg',
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Informações Gerais",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text("Código: 12345"),
                      Text("Data do pedido: 12/10/2024"),
                      Text("Prazo: 20/10/2024"),
                      Text("Descrição: Bolo personalizado com tema Moana"),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 16),
            // Acompanhamento
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Acompanhamento da produção",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                  const SizedBox(height: 8),
                  // Etapas dinâmicas
                  Column(
                    children: [
                      _buildEtapa("Etapa 1", "completed"),
                      _buildEtapa("Etapa 2", "completed"),
                      _buildEtapa("Etapa 3", "in_progress"),
                      _buildEtapa("Etapa 4", "pending"),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    },
  );
}


  Widget _buildEtapa(String nome, String status) {
    Color etapaColor;
    Icon etapaIcon;

    switch (status) {
      case 'completed':
        etapaColor = Colors.green;
        etapaIcon = const Icon(Icons.check, color: Colors.white);
        break;
      case 'in_progress':
        etapaColor = Colors.yellow;
        etapaIcon = const Icon(Icons.timelapse, color: Colors.white);
        break;
      case 'pending':
        etapaColor = Colors.red;
        etapaIcon = const Icon(Icons.close, color: Colors.white);
        break;
      default:
        etapaColor = Colors.grey;
        etapaIcon = const Icon(Icons.info, color: Colors.white);
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        color: etapaColor,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            nome,
            style: const TextStyle(color: Colors.white),
          ),
          etapaIcon,
        ],
      ),
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
