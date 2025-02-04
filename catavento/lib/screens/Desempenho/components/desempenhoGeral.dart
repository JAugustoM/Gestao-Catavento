import 'package:catavento/screens/Desempenho/components/blocksIcon.dart';
import 'package:catavento/screens/Desempenho/components/info.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catavento/bloc/demanda/demanda_bloc.dart';

class DesempenhoGeralWidget extends StatefulWidget {
  @override
  _DesempenhoGeralWidgetState createState() => _DesempenhoGeralWidgetState();
}

class _DesempenhoGeralWidgetState extends State<DesempenhoGeralWidget> {
  @override
  void initState() {
    super.initState();
    context.read<DemandaBloc>().add(DemandaFetch(periodo: ''));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocListener<DemandaBloc, DemandaState>(
      listener: (context, state) {
        if (state is DemandaErrorState) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Erro ao carregar dados")),
          );
        }
      },
      child: BlocBuilder<DemandaBloc, DemandaState>(
        builder: (context, state) {
          if (state is DemandaLoadingState) {
            return Center(child: CircularProgressIndicator());
          }
          if (state is DemandaLoadedState) {
            return _buildDesempenhoGeral(context, size, state.producao);
          }
          // Dispara o evento apenas se o estado não for Loading ou Loaded
          context.read<DemandaBloc>().add(DemandaFetch(periodo: ''));
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }

  Widget _buildDesempenhoGeral(
      BuildContext context, Size size, Map<String, dynamic> producao) {
    if (producao == null) {
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
                  info: producao['completo'].toString()),
              SizedBox(height: size.height * 0.002),
              Info(
                  text: "Quantidade Produzida: ",
                  info: producao['total'].toString()),
              SizedBox(height: size.height * 0.002),
              Info(text: "Pendente: ", info: producao['fabricacao'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
