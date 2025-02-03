import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:catavento/screens/Desempenho/components/blocksIcon.dart';
import 'package:catavento/screens/Desempenho/components/info.dart';

class DesempenhoGeralWidget extends StatefulWidget {
  @override
  _DesempenhoGeralWidgetState createState() => _DesempenhoGeralWidgetState();
}

class _DesempenhoGeralWidgetState extends State<DesempenhoGeralWidget> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => context.read<DemandaBloc>().add(DemandaFetch()));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return BlocBuilder<DemandaBloc, DemandaState>(
      builder: (context, state) {
        if (state is DemandaLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is DemandaLoadedState) {
          return _buildDesempenhoGeral(context, size, state.producao);
        } else if (state is DemandaErrorState) {
          return Center(child: Text("Erro ao carregar dados"));
        }
        return Center(child: Text("Nenhuma informação disponível"));
      },
    );
  }

  Widget _buildDesempenhoGeral(
      BuildContext context, Size size, Map<String, int> producao) {
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
              Info(
                  text: "Total de Pedidos: ",
                  info: producao['total'].toString()),
              Info(
                  text: "Finalizados: ", info: producao['completo'].toString()),
              Info(
                  text: "Em fabricação: ",
                  info: producao['fabricacao'].toString()),
              Info(text: "Pendentes: ", info: producao['espera'].toString()),
              Info(text: "Restantes: ", info: producao['restantes'].toString()),
            ],
          ),
        ),
      ),
    );
  }
}
