import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:catavento/screens/Desempenho/components/blocksIcon.dart';
import 'package:catavento/screens/Desempenho/components/info.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/shared/widgets/bloc_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DesempenhoGeralWidget extends StatefulWidget {
  final int periodo;

  const DesempenhoGeralWidget({super.key, required this.periodo});
  @override
  _DesempenhoGeralWidgetState createState() => _DesempenhoGeralWidgetState();
}

class _DesempenhoGeralWidgetState extends State<DesempenhoGeralWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocConsumer<RelatorioBloc, RelatorioState>(
      listener: (context, state) {
        if (state is RelatorioErrorState) {
          showBlocSnackbar(context, state.message);
        }
      },
      builder: (context, state) {
        if (state.loja.isEmpty) {
          return Center(child: CircularProgressIndicator());
        } else {
          return _buildDesempenhoGeral(
              context, size, state.dadosGerais[widget.periodo]);
        }
      },
    );
  }

  Widget _buildDesempenhoGeral(
      BuildContext context, Size size, Map<String, dynamic> producao) {
    if (producao.isEmpty) {
      return Center(child: Text("Dados indisponíveis"));
    }
    return BlocksIcon(
      width: size.width * 0.29,
      height: size.height * 0.28,
      borderRadius: 0.02,
      icon: Icons.payments_outlined,
      title: "Desempenho geral",
      color: Colors.white,
      child: Padding(
        padding: EdgeInsets.only(top: size.height * 0.050),
        child: Container(
          width: size.width * 0.2,
          height: size.height * 0.19,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(size.height * 0.025),
            gradient: LinearGradient(
              colors: [
                AppColors.gradientDarkBlue,
                AppColors.gradientLightBlue,
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: size.height * 0.002),
              Info(
                  text: "Total de Pedidos: ",
                  info: producao['total'].toString()),
              SizedBox(height: size.height * 0.002),
              Info(
                  text: "Quantidade Produzida: ",
                  info: producao['produzidos'].toString()),
              SizedBox(height: size.height * 0.002),
              Info(text: "Pendente: ", info: producao['pendentes'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
