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
      height: MediaQuery.of(context).size.height * 0.04,
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
        borderRadius:
            BorderRadius.circular(MediaQuery.of(context).size.height * 0.008),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: initialValue,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Colors.white,
            size: MediaQuery.of(context).size.width * 0.02,
          ),
          elevation: 16,
          dropdownColor: AppColors.gradientDarkBlue,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FredokaOne',
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
          items: [
            DropdownMenuItem(
              value: 'funcionarios',
              child: Text(
                'Desempenho dos Funcionários',
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.height * 0.02,
                  fontFamily: "Fredoka",
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            DropdownMenuItem(
              value: 'loja',
              child: Text('Desempenho da Loja',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height * 0.02,
                    fontFamily: "Fredoka",
                    fontWeight: FontWeight.bold,
                  )),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          menuMaxHeight: MediaQuery.of(context).size.height * 0.2,
        ),
      ),
    );
  }
}

class CustomDropdownDesempenho extends StatelessWidget {
  final String initialValue;
  final ValueChanged<String> onChanged;

  CustomDropdownDesempenho({
    required this.initialValue,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.05),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: ['hoje', 'semanal', 'mensal'].map((value) {
            bool isSelected = value == initialValue;
            return Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: ElevatedButton(
                  onPressed: () => onChanged(value),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isSelected
                        ? AppColors.gradientDarkBlue
                        : AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.008),
                    ),
                    padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.008,
                    ),
                  ),
                  child: Text(
                    value == 'hoje'
                        ? 'Hoje'
                        : value == 'semanal'
                            ? 'Semanal'
                            : 'Mensal',
                    style: TextStyle(
                      color: isSelected
                          ? AppColors.white
                          : AppColors.gradientDarkBlue,
                      fontFamily: 'FredokaOne',
                      fontWeight: FontWeight.normal,
                      fontSize: MediaQuery.of(context).size.height * 0.02,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}
