import "package:catavento/bloc/auth2/auth_bloc.dart";
import "package:catavento/bloc/trabalho/trabalho_bloc.dart";
import 'package:flutter/material.dart';
import "package:flutter_bloc/flutter_bloc.dart";
import "../../shared/widgets/menuBar.dart";
import "./components/cardDemandaFuncionario.dart";

class DashBoardFuncionario extends StatelessWidget {
  const DashBoardFuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            onPressed: () => {
              Scaffold.of(context).openDrawer(),
            },
            icon: Icon(Icons.tune, color: Colors.black),
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ),
      ),
      body: BlocConsumer<TrabalhoBloc, TrabalhoState>(
        listener: (context, state) {
          if (state is TrabalhoEmptyState) {
            final email = context.read<AuthBloc>().email;
            final setor = context.read<AuthBloc>().setor;
            context.read<TrabalhoBloc>().add(TrabalhoLoading(
                  email: email!,
                  setor: setor!,
                ));
          }
        },
        builder: (context, state) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CardDemanda(
                title: "Demanda 1",
                codigo: "2313421",
                description:
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur imperdiet quam vel dolor convallis, vel scelerisque magna vehicula. Vivamus pharetra dui at tortor vehicula, eget maximus metus mollis. Proin sed nulla ac lectus convallis gravida sit amet nec purus. Etiam sit amet vulputate libero. Nulla facilisi. Donec dapibus dui id mi tempor, vel iaculis justo consequat. Suspendisse potenti. Sed dapibus sapien vel massa suscipit, eget volutpat orci fermentum. Nulla facilisi. Ut at egestas en",
              )
            ],
          );
        },
      ),
    );
  }
}
