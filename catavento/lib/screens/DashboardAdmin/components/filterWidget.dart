import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class FilterWidget extends StatefulWidget {
  const FilterWidget({super.key});

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String? selectedOption;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: size.height * 0.65, // Altura máxima do card
      ),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // Arredonda todas as bordas
        ),
        elevation: 0,
        margin: const EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    AppColors.gradientDarkBlue,
                    AppColors.gradientLightBlue,
                  ],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(12.0),
                ),
              ),
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(Icons.filter_alt, color: Colors.white),
                  SizedBox(width: 8),
                  Text(
                    'Filtros',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: AppColors.lightGray, // Cor do fundo
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(12.0), // Arredonda o fundo
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: 'Filtro por loja',
                    icon: const Icon(Icons.arrow_drop_down),
                    underline: const SizedBox(),
                    items: ['Filtro por loja']
                        .map((value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            ))
                        .toList(),
                    onChanged: (value) {
                      // lógica do dropdown aqui
                    },
                  ),
                  Column(
                    children: [
                      RadioListTile<String>(
                        value: 'Elo7',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        title: const Text('Elo7'),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Magalu',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        title: const Text('Magalu'),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Mercado Livre',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        title: const Text('Mercado Livre'),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Site',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        title: const Text('Site'),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Shopee',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                        },
                        title: const Text('Shopee'),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
