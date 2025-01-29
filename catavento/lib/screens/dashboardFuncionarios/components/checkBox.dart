import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class CheckBox extends StatefulWidget {
  final TextEditingController controller;
  final String tipo;

  const CheckBox({super.key, required this.controller, required this.tipo});

  @override
  State<CheckBox> createState() {
    return CheckBoxState();
  }
}

class CheckBoxState extends State<CheckBox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Theme(
      data: Theme.of(context).copyWith(
        checkboxTheme: CheckboxThemeData(
          side: BorderSide(color: AppColors.mediumPink), // Cor da borda
          checkColor: MaterialStateProperty.all(
              Colors.white), // Cor do tique (marcado), branco
          fillColor: MaterialStateProperty.resolveWith<Color>((states) {
            if (states.contains(MaterialState.selected)) {
              return AppColors.pink; // Cor rosa quando marcada
            }
            return Colors.transparent; // Transparente quando desmarcada
          }),
        ),
      ),
      child: Transform.scale(
        scale: screenHeight * 0.0012,
        child: Checkbox(
          value: isChecked,
          onChanged: (bool? value) {
            if (widget.controller.text == '' ||
                widget.controller.text == widget.tipo) {
              if (value!) {
                widget.controller.text = widget.tipo;
              } else {
                widget.controller.text = '';
              }
              setState(() {
                isChecked = value;
              });
            }
          },
        ),
      ),
    );
  }
}
