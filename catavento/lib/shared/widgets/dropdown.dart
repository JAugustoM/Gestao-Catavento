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
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.008),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: initialValue,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: MediaQuery.of(context).size.width * 0.014,),
          elevation: 16,
          dropdownColor: AppColors.gradientDarkBlue,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FredokaOne',
            fontSize: MediaQuery.of(context).size.height * 0.014,
          ),
          items: [
            DropdownMenuItem(
              value: 'funcionarios',
              child: Text('Desempenho dos Funcionários', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.014, fontFamily: "FredokaOne"),),
            ),
            DropdownMenuItem(
              value: 'loja',
              child: Text('Desempenho da Loja', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.014, fontFamily: "FredokaOne")),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          menuMaxHeight: MediaQuery.of(context).size.height * 0.15,
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
        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.008),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          value: initialValue,
          icon: Icon(Icons.arrow_drop_down, color: Colors.white, size: MediaQuery.of(context).size.width * 0.014,),
          elevation: 16,
          dropdownColor: AppColors.gradientDarkBlue,
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'FredokaOne',
            fontSize: MediaQuery.of(context).size.height * 0.02,
          ),
          items: [
            DropdownMenuItem(
              value: 'hoje',
              child: Text('Desempenho de Hoje', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.018, fontFamily: "FredokaOne"),),
            ),
            DropdownMenuItem(
              value: 'semanal',
              child: Text('Desempenho Semanal', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.018, fontFamily: "FredokaOne")),
            ),
            DropdownMenuItem(
              value: 'mensal',
              child: Text('Desempenho Mensal', style: TextStyle(fontSize: MediaQuery.of(context).size.height * 0.018, fontFamily: "FredokaOne")),
            ),
          ],
          onChanged: (value) {
            if (value != null) {
              onChanged(value);
            }
          },
          menuMaxHeight: MediaQuery.of(context).size.height * 0.25,
        ),
      ),
    );
  }
}

