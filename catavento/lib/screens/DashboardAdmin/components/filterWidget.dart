import 'package:flutter/material.dart';
import 'package:catavento/shared/theme/colors.dart';

class FilterWidget extends StatefulWidget {
  final ValueChanged<String?> onFilterChanged;

  const FilterWidget({super.key, required this.onFilterChanged});

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
        maxHeight: size.height * 0.65,
      ),
      child: Card(
        color: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.height * 0.012),
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
                children: [
                  Icon(Icons.filter_alt, color: Colors.white, size: size.width * 0.014,),
                  SizedBox(width: 8),
                  Text(
                    'Filtros',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: size.height * 0.016,
                      fontFamily: "FredokaOne",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.lightGray,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(size.height * 0.012),
                ),
              ),
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  DropdownButton<String>(
                    value: 'Filtro por loja',
                    icon: Icon(Icons.arrow_drop_down, size: size.width * 0.014,),
                    underline: const SizedBox(),
                    items: ['Filtro por loja']
                        .map((value) => DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyle(fontSize: size.height * 0.016, fontFamily: "FredokaOne"),),
                            ))
                        .toList(),
                    onChanged: (value) {},
                  ),
                  Column(
                    children: [
                      RadioListTile<String?>(
                        value: null,
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                          widget.onFilterChanged(
                              value); // Atualiza o filtro no widget pai
                        },
                        title: Text("Todos", style: TextStyle(fontSize: size.height * 0.016, fontFamily: "FredokaOne"),),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Elo7',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                          widget.onFilterChanged(
                              value); // Atualiza o filtro no widget pai
                        },
                        title: Text('Elo7', style: TextStyle(fontSize: size.height * 0.016, fontFamily: "FredokaOne"),),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Magalu',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                          widget.onFilterChanged(
                              value); // Passa o valor para o widget pai
                        },
                        title: Text('Magalu', style: TextStyle(fontSize: size.height * 0.016, fontFamily: "FredokaOne"),),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Mercado Livre',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                          widget.onFilterChanged(
                              value); // Passa o valor para o widget pai
                        },
                        title: Text('Mercado Livre', style: TextStyle(fontSize: size.height * 0.016, fontFamily: "FredokaOne"),),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Site',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                          widget.onFilterChanged(
                              value); // Passa o valor para o widget pai
                        },
                        title: Text('Site', style: TextStyle(fontSize: size.height * 0.016, fontFamily: "FredokaOne"),),
                        activeColor: AppColors.gradientDarkBlue,
                      ),
                      RadioListTile<String>(
                        value: 'Shopee',
                        groupValue: selectedOption,
                        onChanged: (value) {
                          setState(() {
                            selectedOption = value;
                          });
                          widget.onFilterChanged(
                              value); // Passa o valor para o widget pai
                        },
                        title: Text('Shopee', style: TextStyle(fontSize: size.height * 0.016, fontFamily: "FredokaOne"),),
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
