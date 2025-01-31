import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class BarGraficM extends StatefulWidget{
  const BarGraficM({super.key});

  @override
  State<StatefulWidget> createState() {
    return BarGraficMState();
  }
}

class BarGraficMState extends State<BarGraficM> {
  late List<LojasData> _chartData;

  @override
  void initState(){
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
        BarSeries<LojasData, String>(dataSource: _chartData, xValueMapper: (LojasData vendas,_)=>vendas.loja , yValueMapper: (LojasData vendas,_)=>vendas.venda, dataLabelSettings: DataLabelSettings(isVisible: true),)
      ],
      primaryXAxis: CategoryAxis(
        majorTickLines: MajorTickLines(color: Colors.white),
        axisLine: AxisLine(color: Colors.white),
        majorGridLines: MajorGridLines(color: Colors.white),
      ),
      primaryYAxis: NumericAxis(
        axisLine: AxisLine(
          color: Colors.white
        ),
        majorGridLines: MajorGridLines(
          color: Colors.white
        ),
        edgeLabelPlacement: EdgeLabelPlacement.shift,
        title: AxisTitle(text: 'Vendas')
      ),
      ),
    )
      
    );
  }

  List<LojasData> getLojasData(){
    final List<LojasData> chartData = [
      LojasData('Elo7', 5136),       //Mudar os numeros para as quantidades de vendas(backend)
      LojasData('M. Livre', 4782),
      LojasData('Magalu', 3548),
      LojasData('Shopee', 2366),
      LojasData('Site', 3578)
    ];
    return chartData;
  }
}

class LojasData{
  LojasData(this.loja, this.venda);
  final String loja;
  final int venda;
}