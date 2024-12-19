import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class Dropdownbutton extends StatefulWidget {
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
      height: MediaQuery.of(context).size.height * 0.04,
      width: MediaQuery.of(context).size.width * 0.1,
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.mediumPink),
        borderRadius: BorderRadius.circular(15)
      ),
      child: DropdownButton(
        isExpanded: true,
        icon: Icon(Icons.arrow_drop_down, color: AppColors.blue,),
        underline: SizedBox(),
        style: TextStyle(color: AppColors.blue, fontSize: 13),
        value: selectedOption,
        items: <String>['Corte', 'Montagem']
          .map((String value){
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value, style: TextStyle(color: AppColors.blue),),
            );
          }).toList(),
        onChanged: (newValue){
          setState(() {
            selectedOption = newValue;
          });
        }
      )
    );
  }
}