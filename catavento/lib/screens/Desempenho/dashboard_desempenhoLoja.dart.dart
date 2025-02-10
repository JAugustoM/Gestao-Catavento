import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:catavento/screens/Desempenho/components/diario.dart';
import 'package:catavento/screens/Desempenho/components/mensal.dart';
import 'package:catavento/screens/Desempenho/components/semanal.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/shared/widgets/header.dart';
import 'package:catavento/shared/widgets/menu.dart';
import 'package:flutter/material.dart';

import 'package:catavento/screens/Desempenho/dashboard_desempenhoAdmin.dart';
import 'package:catavento/shared/widgets/dropdown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardDesempenhoLoja extends StatefulWidget {
  const DashboardDesempenhoLoja({Key? key}) : super(key: key);

  @override
  State<DashboardDesempenhoLoja> createState() =>
      _DashboardDesempenhoLojaState();
}

class _DashboardDesempenhoLojaState extends State<DashboardDesempenhoLoja> {
  String _selectedOption = 'Diário';

  @override
  void initState() {
    super.initState();
    context.read<RelatorioBloc>().add(RelatorioLoad());
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<RelatorioBloc, RelatorioState>(
      listener: (context, state) {
        if (state is! RelatorioCompleteState) {
          context.read<RelatorioBloc>().add(RelatorioLoad());
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.white,
        drawer: Navbar(),
        appBar: CustomHeader(title: "Desempenho", historyButton: false),
        body: Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Center(
              child: CustomDropdown(
                initialValue: 'loja',
                onChanged: (value) {
                  if (value == 'funcionarios') {
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
            SizedBox(height: MediaQuery.of(context).size.height * 0.04),
            Expanded(
              child: Center(
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      padding: const EdgeInsets.all(16.0),
                      margin: const EdgeInsets.only(top: 32),
                      decoration: BoxDecoration(
                        color: AppColors.lightGray,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const SizedBox(height: 40),
                          Expanded(child: Builder(
                            builder: (context) {
                              if (_selectedOption == 'Diário') {
                                return Diario();
                              } else if (_selectedOption == 'Semanal') {
                                return Semanal();
                              } else {
                                return Mensal();
                              }
                            },
                          )),
                        ],
                      ),
                    ),
                    Positioned(
                      top: -10,
                      left: MediaQuery.of(context).size.width * 0.3,
                      right: MediaQuery.of(context).size.width * 0.3,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: AppColors.lightGray,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children:
                              ['Diário', 'Semanal', 'Mensal'].map((option) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    _selectedOption = option;
                                  });
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: _selectedOption == option
                                      ? AppColors.pink
                                      : AppColors.mediumPink,
                                  foregroundColor: _selectedOption == option
                                      ? AppColors.white
                                      : AppColors.white,
                                ),
                                child: Text(
                                  option,
                                  style: TextStyle(
                                      fontFamily: 'FredokaOne',
                                      fontSize:
                                          MediaQuery.of(context).size.height *
                                              0.018),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
