import 'package:catavento/bloc/produto/produto_bloc.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Searchproducts extends StatefulWidget {
  const Searchproducts({super.key});

  @override
  State<Searchproducts> createState() {
    return SearchproductsState();
  }
}

class SearchproductsState extends State<Searchproducts> {
  final TextEditingController _nomeProduto = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    return SizedBox(
      width: width * 0.5,
      height: height * 0.04,
      child: TextField(
        controller: _nomeProduto,
        cursorHeight: height * 0.014,
        style: TextStyle(fontFamily: "FredokaOne", fontSize: height * 0.014),
        decoration: InputDecoration(
            prefixIcon: Icon(
              Icons.search,
              size: width * 0.018,
              color: Color(0xFF015C98),
            ),
            //Icon de pesquisa
            contentPadding: EdgeInsets.symmetric(vertical: 4.0),
            hintText: "Insira o nome do produto para iniciar uma busca",
            hintStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: 'Fredoka',
                fontSize: height * 0.017,
                color: Colors.black.withOpacity(0.5) //Opacidade do texto
                ),
            filled: true,
            fillColor: AppColors.lightGray,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(height * 0.016),
              borderSide: BorderSide(color: AppColors.lightGray, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGray, width: 2),
              borderRadius: BorderRadius.circular(height * 0.016),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGray, width: 2),
              borderRadius: BorderRadius.circular(height * 0.016),
            )),
        onEditingComplete: () {
          context.read<ProdutoBloc>().add(ProdutoFilter(
                'nome_produto',
                _nomeProduto.text,
              ));
        },
      ),
    );
  }
}
