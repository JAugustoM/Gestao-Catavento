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
              size: screenWidth * 0.018,
              color: AppColors.gradientDarkBlue,
            ),
            hint: Text(
              'Filtro por setor',
              style: TextStyle(
                  color: AppColors.gradientDarkBlue,
                  fontSize: screenHeight * 0.016,
                  fontFamily: "Fredoka",
                  fontWeight: FontWeight.bold),
            ),
            underline: SizedBox(),
            style: TextStyle(
                color: AppColors.gradientDarkBlue,
                fontSize: screenHeight * 0.016,
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold),
            value: selectedOption,
            items: <String>['Cobertura', 'Aplique', 'Montagem', 'Todos']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(
                      color: AppColors.gradientDarkBlue,
                      fontSize: screenHeight * 0.016,
                      fontFamily: "Fredoka",
                      fontWeight: FontWeight.bold),
                ),
              );
            }).toList(),
            onChanged: (newValue) {
              widget.controller.text = newValue!;
              setState(() {
                selectedOption = newValue;
              });
            }));
  }
}
