import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    String formattedDate = DateFormat('dd/MM/yyyy').format(DateTime.now());

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconMenu(),
              // botão pra ver o histórico
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF015C98),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                ),
                child: Text(
                  'Ver histórico',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Demandas atuais ($formattedDate)',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF015C98),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Icon Menu
class IconMenu extends StatefulWidget {
  const IconMenu({super.key});

  @override
  State<IconMenu> createState() {
    return IconMenuState();
  }
}

class IconMenuState extends State<IconMenu> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
      iconSize: 30,
      onPressed: () {
        // Lógica do menu
      },
      icon: Icon(Icons.menu),
      color: Color(0xFF015C98),
    );
  }
}
