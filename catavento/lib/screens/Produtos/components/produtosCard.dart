import 'dart:io';

import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/shared/widgets/confirmDialog.dart';
import 'package:flutter/material.dart';
import 'package:catavento/shared/widgets/dialog.dart';
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/shared/widgets/inputs.dart';

class ProdutosCard extends StatefulWidget {
  final String nomeProduto;
  final String descricaoProduto;
  final String codigoProduto;
  final String image;
  final DemandaBloc bloc; // ---- COLOCAR O BLOC DOS PRODUTOS AQUI DEPOIS

  const ProdutosCard(
      {super.key,
      required this.nomeProduto,
      required this.bloc,
      required this.descricaoProduto,
      required this.codigoProduto,
      required this.image});

  @override
  State<ProdutosCard> createState() {
    return ProdutosCardState();
  }
}

class ProdutosCardState extends State<ProdutosCard> {
  // dados estáticos temporários
  final String nome = "Bolo Exemplo";
  final String codigo = "CODIGO123";
  final String descricao = "Descrição do produto (Bolo Exemplo) aqui.";
  final int id = 10; // -- pode apagar isso dps
  final int order = 11; // --- pode apagar isso dps
  final DemandaBloc bloc = DemandaBloc();

  late final TextEditingController nomeController;
  late final TextEditingController codigoController;
  late final TextEditingController descricaoController;

  double get screenHeight => MediaQuery.of(context).size.height;
  double get screenWidth => MediaQuery.of(context).size.width;

  @override
  void initState() {
    super.initState();
    nomeController = TextEditingController(text: widget.nomeProduto);
    codigoController = TextEditingController(text: widget.codigoProduto);
    descricaoController = TextEditingController(text: widget.descricaoProduto);
  }

  @override
  void dispose() {
    nomeController.dispose();
    codigoController.dispose();
    descricaoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(bottom: 17, top: 17),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: AppColors.lightGray)),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
                child: Image.file(
                  File(widget.image),
                  fit: BoxFit.cover,
                ),
              )),
          Container(
            height: screenHeight * 0.01,
            color: AppColors.lightPink,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Center(
                  child: Text(
                    widget.nomeProduto,
                    style: TextStyle(
                        fontSize: screenHeight * 0.015,
                        fontFamily: "FredokaOne",
                        color: AppColors.blue,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButtonInfo(context),
                    SizedBox(
                      width: screenWidth * 0.01,
                    ),
                    _buildButtonDeletar(context)
                  ],
                ),
                SizedBox(height: screenHeight * 0.01,),
                _buildButtonEditar(context)
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonEditar(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.03,
      width: screenWidth * 0.132,
      child: ElevatedButton(
        onPressed: () {
          _showEditDialog(
              context, nomeController, codigoController, descricaoController);
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gradientDarkBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          "Editar",
          style: TextStyle(fontSize: screenHeight * 0.013, fontFamily: "FredokaOne", color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildButtonDeletar(BuildContext context) {
    return SizedBox(
      height: screenHeight * 0.03,
      width: screenWidth * 0.066,
      child: ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return ConfirmDialog(
                title: 'Confirmar Exclusão',
                contente:
                    'Tem certeza de que deseja apagar este produto?',
                onConfirm: () {
                  Navigator.of(context).pop();
                  //Lógica do botão
                },
              );
            },
          );
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gradientDarkBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          "Deletar",
          style: TextStyle(fontSize: screenHeight * 0.013, fontFamily: "FredokaOne", color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildButtonInfo(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.03,
      width: MediaQuery.of(context).size.width * 0.066,
      child: ElevatedButton(
        onPressed: () {
          _showInfoDialog(context, nome, codigo, descricao,
              "https://via.placeholder.com/150");
        },
        style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.gradientDarkBlue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30))),
        child: Text(
          "Info",
          style: TextStyle(fontSize: screenHeight * 0.013, fontFamily: "FredokaOne", color: Colors.white),
        ),
      ),
    );
  }

  void _showEditDialog(
    BuildContext context,
    TextEditingController nomeController,
    TextEditingController codigoController,
    TextEditingController descricaoController,
  ) {
    showDialog(
      context: context,
      builder: (context) {
        return ReusableDialog(
          title: "Editar Produto",
          confirmBeforeClose: true,
          closeRoute: '/dashboardProdutos',
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.receipt_long_rounded,
                                  color: AppColors.gradientDarkBlue,
                                  size: MediaQuery.of(context).size.width * 0.02,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Informações Gerais",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.016,
                                    fontFamily: 'FredokaOne',
                                    color: AppColors.gradientDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                                  child: Text(
                                  "Código",
                                  style: TextStyle(
                                      color: AppColors.gradientDarkBlue,
                                      fontFamily: "FredokaOne",
                                      fontSize: MediaQuery.of(context).size.height * 0.016,
                                      fontWeight: FontWeight.bold),
                                ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: InputTextField(
                                    hintText: "Código da demanda",
                                    controller: codigoController,
                                    labelText: '',
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: screenHeight * 0.02),
                                  child: Text(
                                  "Nome",
                                  style: TextStyle(
                                      color: AppColors.gradientDarkBlue,
                                      fontFamily: "FredokaOne",
                                      fontSize: MediaQuery.of(context).size.height * 0.016,
                                      fontWeight: FontWeight.bold),
                                ),
                                ),
                                
                                const SizedBox(width: 10),
                                Expanded(
                                  child: InputTextField(
                                    hintText: "Nome do bolo",
                                    controller: nomeController,
                                    labelText: '',
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 20),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  "Adicionar Imagem",
                                  style: TextStyle(
                                      color: AppColors.gradientDarkBlue,
                                      fontFamily: "FredokaOne",
                                      fontSize: MediaQuery.of(context).size.height * 0.016,
                                      fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(width: 10),
                                Icon(Icons.camera_alt,
                                    size: MediaQuery.of(context).size.width * 0.030,
                                    color: AppColors.gradientDarkBlue),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              BorderRadius.circular(16), // Bordas arredondadas
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Icon(
                                  Icons.search,
                                  color: AppColors.gradientDarkBlue,
                                  size: MediaQuery.of(context).size.width * 0.020,
                                ),
                                const SizedBox(width: 8),
                                Text(
                                  "Informações Adicionais",
                                  style: TextStyle(
                                    fontSize: MediaQuery.of(context).size.height * 0.016,
                                    fontFamily: 'FredokaOne',
                                    color: AppColors.gradientDarkBlue,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: InputTextField(
                                    hintText: "Descrição",
                                    controller: descricaoController,
                                    labelText: 'Descrição',
                                    maxLines: 4,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
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

  // Função para mostrar as informações da demanda em um diálogo
  void _showInfoDialog(BuildContext context, String nome, String codigo,
      String descricao, String imageUrl) {
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
                // Imagem com altura e largura definidas
                Container(
                  width: double.infinity, // A imagem ocupará toda a largura disponível
                  height:
                      screenHeight * 0.3, // Altura fixada para evitar que a imagem ocupe um tamanho indefinido
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(16),
                    child: Image.asset(
                      'assets/images/photo.jpg',
                      fit: BoxFit.cover, // Garante que a imagem cubra a área
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Informações adicionais
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
                          Text(
                            "Código:",
                            style: TextStyle(
                              fontSize: screenHeight * 0.016,
                              fontFamily: 'FredokaOne',
                              fontWeight: FontWeight.bold,
                              color: AppColors.gradientDarkBlue,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Flexible(
                            child: Text(
                              codigo,
                              style:  TextStyle(
                                fontSize: screenHeight * 0.016,
                                fontFamily: 'FredokaOne',
                                color: AppColors.gradientDarkBlue,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),

                      // Descrição
                       Row(
                        children: [
                          Text(
                            "Descrição:",
                            style: TextStyle(
                              fontSize: screenHeight * 0.016,
                              fontFamily: 'FredokaOne',
                              fontWeight: FontWeight.bold,
                              color: AppColors.gradientDarkBlue,
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                          descricao,
                          style: TextStyle(
                            fontSize: screenHeight * 0.016,
                            fontFamily: "FredokaOne",
                            fontWeight: FontWeight.bold,
                            color: AppColors.gradientDarkBlue,
                          ),
                        ),
                        ],
                      ),
                      
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
