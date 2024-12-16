import 'package:flutter/material.dart';

class ButtonChoosePriority extends StatefulWidget {
  const ButtonChoosePriority({super.key});

  @override
  State<ButtonChoosePriority> createState() {
    return ButtonChoosePriorityState();
  }
}

class ButtonChoosePriorityState extends State<ButtonChoosePriority> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 146,
      height: 25,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 2),
        borderRadius: BorderRadius.circular(9),
        color: Colors.white,
      ),
      child: DropdownButton<String>(
        isExpanded: true,
        hint: Text(
          "Escolha uma opção",
          style: TextStyle(fontSize: 15, color: Colors.black.withOpacity(0.5)),
        ),
        underline: SizedBox(),
        value: selectedOption,
        onChanged: (String? newValue) {
          setState(() {
            selectedOption = newValue;
          });
        },
        items: ["Alta", "Média", "Baixa"].map((String option) {
          return DropdownMenuItem<String>(
            value: option,
            child: Text(option),
          );
        }).toList(),
      ),
    );
  }
}
