import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class CustomDropdown extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;

  CustomDropdown({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 12),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColors.gradientDarkBlue,
            AppColors.gradientLightBlue,
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(8),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: initialValue,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white),
          elevation: 16,
          dropdownColor: AppColors.gradientDarkBlue,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FredokaOne',
            fontSize: 14,
          ),
          items: [
            DropdownMenuItem(
              value: 'funcionarios',
              child: Text('Desempenho dos Funcionários'),
            ),
            DropdownMenuItem(
              value: 'loja',
              child: Text('Desempenho da Loja'),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          menuMaxHeight: 150,
        ),
      ),
    );
  }
}
