import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';

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

            hintText: "Insira o nome do produto para iniciar uma busca",
            hintStyle: TextStyle(
                fontFamily: 'FredokaOne',
                fontSize: height * 0.014,
                color: AppColors.blue.withOpacity(0.5) //Opacidade do texto
                ),
            filled: true,
            fillColor: AppColors.lightGray,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: AppColors.lightGray, width: 2),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGray, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.lightGray, width: 2),
              borderRadius: BorderRadius.circular(10),
            )
          ),
      ),
    );
  }
}
