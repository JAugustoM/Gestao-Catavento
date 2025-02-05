import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraficM extends StatefulWidget {
  const BarGraficM({super.key});

  @override
  State<StatefulWidget> createState() {
    return BarGraficMState();
  }
}

class BarGraficMState extends State<BarGraficM> {
  late List<LojasData> _chartData;

  @override
  void initState() {
    _chartData = getLojasData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SfCartesianChart(
        backgroundColor: Colors.white,
        series: <CartesianSeries>[
          BarSeries<LojasData, String>(
            dataSource: _chartData,
            xValueMapper: (LojasData vendas, _) => vendas.loja,
            yValueMapper: (LojasData vendas, _) => vendas.venda,
            dataLabelSettings: DataLabelSettings(isVisible: true),
          )
        ],
        primaryXAxis: CategoryAxis(
          majorTickLines: MajorTickLines(color: Colors.white),
          axisLine: AxisLine(color: Colors.white),
          majorGridLines: MajorGridLines(color: Colors.white),
        ),
        primaryYAxis: NumericAxis(
            axisLine: AxisLine(color: Colors.white),
            majorGridLines: MajorGridLines(color: Colors.white),
            edgeLabelPlacement: EdgeLabelPlacement.shift,
            title: AxisTitle(text: 'Vendas')),
      ),
    ));
  }

  List<LojasData> getLojasData() {
    final mensal = context.read<RelatorioBloc>().mensal();
    print(mensal);
    final List<LojasData> chartData = [
      LojasData('Elo7', mensal['ELO 7'] ?? 0),
      LojasData('M. Livre', mensal['MERCADO LIVRE'] ?? 0),
      LojasData('Magalu', mensal['MAGALU'] ?? 0),
      LojasData('Shopee', mensal['SHOPEE'] ?? 0),
      LojasData('Site', mensal['SITE'] ?? 0)
    ];
    return chartData;
  }
}

class LojasData {
  LojasData(this.loja, this.venda);
  final String loja;
  final int venda;
}
