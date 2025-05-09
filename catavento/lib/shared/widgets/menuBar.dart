import 'package:catavento/bloc/auth/auth_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:catavento/shared/theme/colors.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userData = context.read<AuthBloc>().userData;
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                stops: [0.5, 1.0],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.gradientLightBlue, // Cor #3598D4
                  AppColors.gradientDarkBlue, //
                ])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                          color: Color(0xFFE1DCE6),
                          borderRadius: BorderRadius.circular(100)),
                      child: Center(
                        child: Icon(
                          Icons.person_outline,
                          size: 30,
                          color: Color(00000000).withOpacity(0.45),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Column(children: [
                      Text(userData['usuario'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                      Text(userData['setor'],
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.normal)),
                    ]),
                    SizedBox(
                      height: 60,
                    ),
                    Column(
                      children: [
                        ListTile(
                          leading: const Icon(
                            Icons.task,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          title: const Text(
                            "Minhas tarefas",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushNamed(
                                  context, atividadesFuncionarioRoute);
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.shield_outlined,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          title: const Text(
                            "Meus dados e desempenho",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.pushNamed(context, dadosFuncionario);
                            });
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListTile(
                          leading: const Icon(
                            Icons.logout,
                            color: Colors.white,
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20),
                          title: const Text(
                            "Sair da conta",
                            style: TextStyle(color: Colors.white),
                          ),
                          onTap: () {
                            context.read<AuthBloc>().add(SignOutEvent());
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.popAndPushNamed(context, loginRoute);
                            });
                          },
                        ),
                      ],
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
