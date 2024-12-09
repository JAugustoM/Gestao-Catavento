import 'package:flutter/material.dart';
import 'components/input_purple.dart';
class Login extends StatelessWidget {
  const Login({super.key});


  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          // Background gradient
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF75CDF3), Color(0xFFB2E8FF)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          // Container (ficará abaixo da imagem do bolo)

          Center(
            child: Container(
              width: 532.0,
              height: 588.0,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                children: [
                  // Outros widgets aqui
                  SizedBox(height: 100,),
                  PurpleTextField(label: "Digite o nome do seu usuário", icon: Icon( Icons.person_outline , color: Color(0xCCACACAC),),),
                  PurpleTextField(label: "Digite o nome do seu usuário", icon: Icon( Icons.person_outline , color: Color(0xCCACACAC),),),
                ],
              ),
            ),
          ),

          Center(
            child: Transform.translate(
              offset: Offset(0, -310), // Mover a imagem 50 pixels para cima (ajuste conforme necessário)
              child: Image.asset(
                "assets/images/cake.png",
                width: 128,
                height: 128,
              ),
            ),
          )

        ],
      ),
    );
  }
}
