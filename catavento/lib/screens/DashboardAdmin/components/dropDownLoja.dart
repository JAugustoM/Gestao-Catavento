import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class Dropdownbutton extends StatefulWidget {
  final TextEditingController controller;

  const Dropdownbutton({
    super.key,
    required this.controller,
  });
  @override
  State<Dropdownbutton> createState() {
    return DropdownbuttonState();
  }
}

class DropdownbuttonState extends State<Dropdownbutton> {
  String? selectedOption;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 0.03,
        width: MediaQuery.of(context).size.width * 0.09,
        padding: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.pink),
            borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.height * 0.02)),
        child: DropdownButton(
            isExpanded: true,
            icon: Icon(
              Icons.arrow_drop_down,
              size: MediaQuery.of(context).size.width * 0.016,
              color: AppColors.blue,
            ),
            underline: SizedBox(),
            style: TextStyle(
                color: AppColors.blue,
                fontFamily: "Fredoka",
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.height * 0.016),
            value: selectedOption,
            items: <String>['Elo7', 'Magalu', 'Mercado Livre', 'Site', 'Shopee']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: TextStyle(color: AppColors.blue),
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
