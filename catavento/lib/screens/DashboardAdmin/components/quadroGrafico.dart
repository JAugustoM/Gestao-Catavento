import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// BACKEND
import 'package:catavento/bloc/demanda/demanda_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// components
import 'package:catavento/screens/DashboardAdmin/components/graph.dart';

class QuadroGrafico extends StatefulWidget {
  const QuadroGrafico({super.key});

  @override
  State<QuadroGrafico> createState() {
    return QuadroGraficoState();
  }
}

class QuadroGraficoState extends State<QuadroGrafico> {
  final List<Color> colors = [Colors.green, Colors.red];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size; // Tamanho da tela
    return BlocBuilder<DemandaBloc, DemandaState>(
      buildWhen: (previous, current) => current is! DemandaFilterState,
      builder: (context, response) {
        final metaData = response.metaData;

        return Container(
          width: size.width * 0.9, // Largura igual ao ListDemanda
          height: size.height * 0.65, // Altura igual ao ListDemanda
          child: Column(
            children: [
              // Primeiro Card - Gráfico
              Container(
                width: size.width * 0.9,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      // Texto à esquerda
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: colors[0],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Completas: ${metaData['completo']}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 10,
                                decoration: BoxDecoration(
                                  color: colors[1],
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(width: 8),
                              Text(
                                "Restantes: ${metaData['restantes']}",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                              ),
                            ],
                          ),
                          SizedBox(height: 10),
                          Text(
                            "Total: ${metaData['total']}",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                      // Gráfico à direita
                      SizedBox(
                        width: 80,
                        height: 80,
                        child: PizzaChart(
                          completas: metaData['completo'] ?? 0,
                          restantes: metaData['restantes'] ?? 0,
                          colors: [Colors.green, Colors.red],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 15),

              // Segundo Card - Status de Fabricacao
              Container(
                width: size.width * 0.9,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.cake_rounded,
                        size: 60,
                        color: Colors.pink,
                      ),
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${metaData['fabricacao']}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Em fabricação",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 15),

              // Terceiro Card - Status de Espera
              Container(
                width: size.width * 0.9,
                height: size.height * 0.2,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Icon(
                        Icons.layers,
                        size: 60,
                        color: Color(0xFF015C98),
                      ),
                    ),
                    SizedBox(width: 30),
                    Padding(
                      padding: EdgeInsets.all(0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "${metaData['espera']}",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            "Em espera",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
