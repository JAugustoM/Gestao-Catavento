import 'package:catavento/screens/Desempenho/components/filtroSetor.dart';
import 'package:catavento/screens/Desempenho/components/funcionariosCardDesempenho.dart';
import 'package:catavento/screens/Desempenho/components/searchFuncionarios.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/shared/widgets/background.dart';
import 'package:catavento/shared/widgets/header.dart';
import 'package:catavento/shared/widgets/menu.dart';
import 'package:flutter/material.dart';

import 'package:catavento/screens/Desempenho/dashboard_desempenhoAdmin.dart';
import 'package:catavento/shared/widgets/dropdown.dart';

class DashboardDesempenhoLoja extends StatefulWidget {
  const DashboardDesempenhoLoja({Key? key}) : super(key: key);

  @override
  State<DashboardDesempenhoLoja> createState() =>
      _DashboardDesempenhoLojaState();
}

class _DashboardDesempenhoLojaState extends State<DashboardDesempenhoLoja> {
  String _selectedOption = 'Diário';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: CustomHeader(title: "Desempenho", historyButton: true),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).size.height * 0.04),
          Center(
            child: CustomDropdown(
              initialValue: 'funcionarios',
              onChanged: (value) {
                if (value == 'loja') {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DashboardDesempenhoAdmin(),
                    ),
                  );
                }
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: ['Diário', 'Semanal', 'Mensal'].map((option) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _selectedOption = option;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedOption == option
                          ? Colors.blue
                          : Colors.grey[300],
                      foregroundColor: _selectedOption == option
                          ? Colors.white
                          : Colors.black,
                    ),
                    child: Text(option),
                  ),
                );
              }).toList(),
            ),
          ),

          // Conteúdo que muda com base na opção selecionada
          Expanded(
            child: Center(
              child: Text(
                'Conteúdo: $_selectedOption',
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
