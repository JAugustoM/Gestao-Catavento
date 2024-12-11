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
              width: 400.0,
              height: 400.0,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Outros widgets aqui
                  SizedBox(height: 100,),
                  PurpleTextField(label: "Digite o nome do seu usuário", icon: Icon( Icons.person_outline , color: Color(0xCCACACAC),),),
                  PurpleTextField(label: "Digite a sua senha", icon: Icon( Icons.person_outline , color: Color(0xCCACACAC),),),

                  //SizedBox(height: 35),

                  ElevatedButton( // colocar o botão para a direita 
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color.fromARGB(255, 28, 126, 238),
                    ),

                      child: Text(
                        "Entrar", 
                        style: TextStyle ( 
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
          
                ],
              ),
            ),
          ),

          Center(
            child: Transform.translate(
              offset: Offset(0, -230), // Mover a imagem 50 pixels para cima (ajuste conforme necessário)
              child: Image.asset(
                "assets/images/cake.png",
                width: 128,
                height: 128,
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}
