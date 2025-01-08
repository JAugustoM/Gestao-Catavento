import 'package:catavento/bloc/auth2/auth_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Navbar extends StatelessWidget {
  const Navbar({super.key});

  @override
  Widget build(BuildContext context) {
    final userData = context.read<AuthBloc>().userData;
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 75,
            padding: const EdgeInsets.all(16),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  AppColors.gradientDarkBlue,
                  AppColors.gradientLightBlue,
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
            child: Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey.shade200,
                  child: const Icon(Icons.person, size: 30),
                ),
                const SizedBox(width: 16),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      userData['usuario'],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      userData['tipo'] == 'admin' ? 'Administrador' : 'Gerente',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          ListTile(
            leading: const Icon(Icons.list_alt,
                color: AppColors.gradientDarkBlue,
                size: 20), // Ícone de demandas
            title: const Text(
              'Demandas',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.gradientDarkBlue,
              ),
            ),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, homeRoute);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.group,
                color: AppColors.gradientDarkBlue,
                size: 20), // Ícone de funcionários
            title: const Text(
              'Funcionários',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.gradientDarkBlue,
              ),
            ),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, crudFuncionariosRoute);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.shopping_cart,
                color: AppColors.gradientDarkBlue,
                size: 20), // Ícone de produtos
            title: const Text(
              'Produtos',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.gradientDarkBlue,
              ),
            ),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, produtosRoute);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.bar_chart,
                color: AppColors.gradientDarkBlue,
                size: 20), // Ícone de produtos
            title: const Text(
              'Desempenho',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.gradientDarkBlue,
              ),
            ),
            onTap: () {
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, desempenhoAdminRoute);
              });
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout,
                color: AppColors.gradientDarkBlue, size: 20), // Ícone de sair
            title: const Text(
              'Sair da Conta',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: AppColors.gradientDarkBlue,
              ),
            ),
            onTap: () {
              context.read<AuthBloc>().add(AuthSignOut());
              SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, loginRoute);
              });
            },
          ),
        ],
      ),
    );
  }
}
