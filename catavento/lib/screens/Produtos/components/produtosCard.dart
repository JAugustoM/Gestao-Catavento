import 'dart:io';

import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class ProdutosCard extends StatefulWidget {
  final String nomeProduto;
  final String image;

  const ProdutosCard ({
    super.key,
    required this.nomeProduto,
    required this.image
  });

  @override
  State<ProdutosCard> createState() {
    return ProdutosCardState();
  }
}

class ProdutosCardState extends State<ProdutosCard> {

  @override
  Widget build(BuildContext context){
    return Card(
      margin: EdgeInsets.only(bottom: 17, top: 17),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
        side: BorderSide(color: AppColors.lightGray)
      ),
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
            flex: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
              child: Image.file(
              File(widget.image),
              fit: BoxFit.cover,
            ),
            )
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.01,
            color: AppColors.lightPink,
          ),
          Expanded(
            flex: 1,
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
                Center(
                  child: Text(
                    widget.nomeProduto,
                    style: TextStyle(
                      fontSize: 15,
                      color: AppColors.blue,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height * 0.03,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildButtonEditar(context),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.01,),
                    _buildButtonInfo(context)
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildButtonEditar(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width:  MediaQuery.of(context).size.width * 0.066,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
        child: Text(
          "Editar",
          style: TextStyle(fontSize: 13, color: Colors.white),
        ),
      ),
    );
  }

  Widget _buildButtonInfo(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.04,
      width:  MediaQuery.of(context).size.width * 0.066,
      child: ElevatedButton(
        onPressed: () {

        },
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30)
          )
        ),
        child: Text(
          "Info",
          style: TextStyle(fontSize: 14, color: Colors.white),
        ),
      ),
    );
  }
}