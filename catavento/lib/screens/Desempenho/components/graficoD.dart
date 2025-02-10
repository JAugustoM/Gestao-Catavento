import 'package:catavento/bloc/relatorio/relatorio_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraficD extends StatefulWidget {
  const BarGraficD({super.key});

  @override
  State<StatefulWidget> createState() {
    return BarGraficDState();
  }
}

class BarGraficDState extends State<BarGraficD> {
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
            title: AxisTitle(
              text: 'Vendas',
            )),
      ),
    ));
  }

  List<LojasData> getLojasData() {
    final diario = context.read<RelatorioBloc>().diario();
    final List<LojasData> chartData = [
      LojasData('Elo7', diario['ELO 7'] ?? 0),
      LojasData('M. Livre', diario['MERCADO LIVRE'] ?? 0),
      LojasData('Magalu', diario['MAGALU'] ?? 0),
      LojasData('Shopee', diario['SHOPEE'] ?? 0),
      LojasData('Site', diario['SITE'] ?? 0)
    ];
    return chartData;
  }
}

class LojasData {
  LojasData(this.loja, this.venda);
  final String loja;
  final int venda;
}
