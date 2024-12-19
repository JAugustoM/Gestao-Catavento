import 'package:catavento/shared/theme/colors.dart';
import 'package:flutter/material.dart';

class CustomHeader extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CustomHeader({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.blue,
      elevation: 0,
      automaticallyImplyLeading: false, // Remove o botão padrão
      flexibleSpace: Stack(
        alignment: Alignment.center, // Centraliza o título
        children: [
          // Row para os elementos nas extremidades
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0), // Adiciona o padding
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Botão de menu
              Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: InkWell(
                  onTap: () {
                    Scaffold.of(context).openDrawer();
                  },
                  child: const Icon(
                    Icons.menu,
                    size: 40.0,
                    color: Colors.white,
                  ),
                ),
              ),
              // Botão de "Ver Histórico"
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: TextButton.icon(
                  icon: const Icon(Icons.history, size: 18.0),
                  label: const Text("Ver Histórico"),
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: AppColors.mediumPink,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                ),
              ),
            ],
            ),
          ),
          // Título centralizado
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(
      kToolbarHeight + 20); // Ajusta a altura com o padding
}
