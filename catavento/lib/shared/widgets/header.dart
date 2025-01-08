import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool historyButton;

  const CustomHeader(
      {super.key, required this.title, required this.historyButton});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      flexibleSpace: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientDarkBlue,
                  AppColors.gradientLightBlue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16.0),
                  child: InkWell(
                    onTap: () {
                      Scaffold.of(context).openDrawer();
                    },
                    child: const Icon(
                      Icons.menu,
                      size: 40.0,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 16.0),
                  child: Visibility(
                    visible: historyButton,
                    child: TextButton.icon(
                      label: const Text("Ver Histórico",
                          style: TextStyle(
                              fontSize: 16, fontFamily: 'FredokaOne')),
                      onPressed: () {
                        _showDatePicker(context);
                      },
                      style: TextButton.styleFrom(
                        foregroundColor: Colors.white,
                        backgroundColor: AppColors.mediumPink,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 15, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'FredokaOne',
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  // Função para mostrar o Date Picker
  void _showDatePicker(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Data inicial
      firstDate: DateTime(2020), // Primeira data possível
      lastDate: DateTime(2101), // Última data possível
    );

    if (selectedDate != null) {
      String selectedDateString = "Data selecionada: ${selectedDate.toLocal()}";

      // Aqui, você pode definir as ações dependendo da data escolhida
      if (_isToday(selectedDate)) {
        // Data é hoje, mudar para a página principal ou fazer outra ação
        Navigator.pushReplacementNamed(context, '/home');
      } else {
        // Executar ações para datas anteriores
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text('Data anterior selecionada: $selectedDateString'),
        ));
      }
    }
  }

  // Verifica se a data selecionada é hoje
  bool _isToday(DateTime date) {
    DateTime today = DateTime.now();
    return today.year == date.year &&
        today.month == date.month &&
        today.day == date.day;
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 20); // Ajusta a altura com o padding
}
