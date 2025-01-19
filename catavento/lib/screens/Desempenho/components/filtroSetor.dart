import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class Filtrosetor extends StatefulWidget {
  final TextEditingController controller;

  const Filtrosetor({super.key, required this.controller});
  @override
  State<Filtrosetor> createState() {
    return FiltrosetorState();
  }
}

class FiltrosetorState extends State<Filtrosetor> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Container(
        height: screenHeight * 0.04,
        width: screenWidth * 0.13,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: AppColors.lightGray,
          borderRadius: BorderRadius.circular(10)),
        child: DropdownButton(
          isExpanded: true,
          icon: Icon(
            Icons.arrow_drop_down,
            size: screenWidth * 0.014,
            color: AppColors.blue,
          ),
          hint: Text(
            'Filtro por setor',
            style: TextStyle(color: AppColors.blue.withOpacity(0.5), fontSize: screenHeight * 0.012, fontFamily: "FredokaOne"),
          ),
          underline: SizedBox(),
          style: TextStyle(color: AppColors.blue, fontSize: screenHeight * 0.013, fontFamily: "FredokaOne"),
          value: selectedOption,
          items: <String>['Cobertura', 'Aplique', 'Montagem', 'Todos']
              .map((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(
                value,
                style: TextStyle(color: AppColors.blue, fontFamily: "FredokaOne",fontSize: screenHeight * 0.013),
              ),
            ); 
          }).toList(),
          onChanged: (newValue) {
            widget.controller.text = newValue!;
            setState(() {
              selectedOption = newValue;
            });
          }
        )
      );
  }
}