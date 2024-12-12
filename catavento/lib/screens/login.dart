import 'dart:js_interop';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'components/input_purple.dart';


class Login extends StatefulWidget{
  const Login ({super.key});

  @override
  _LoginState createState()=> _LoginState();
}
class _LoginState extends State<Login> {
  bool isLoading = false;
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
                  SizedBox(
                    height: 100,
                  ),
                  PurpleTextField(
                    label: "Digite o nome do seu usuário",
                    icon: Icon(
                      Icons.person_outline,
                      color: Color(0xCCACACAC),
                    ),
                  ),
                  PurpleTextField(
                    label: "Digite a sua senha",
                    icon: Icon(
                      Icons.lock_outline,
                      color: Color(0xCCACACAC),
                    ),
                  ),
                  ButtonSingIn(
                    title: Text("Sing in"),
                    isLoading: isLoading,
                    icon: Icon(
                      Icons.keyboard_arrow_right_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {

                      setState(() {
                        isLoading = !isLoading;
                      });
                      log("IsLoading  $isLoading");
                    },
                  ),

                  //SizedBox(height: 35),
                  ElevatedButton(
                    // colocar o botão para a direita
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      padding:
                          EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      backgroundColor: Color.fromARGB(255, 28, 126, 238),
                    ),

                    child: Text(
                      "Entrar",
                      style: TextStyle(
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
              offset: Offset(0, -230),
              // Mover a imagem 50 pixels para cima (ajuste conforme necessário)
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

class ButtonSingIn extends StatefulWidget {
  final Widget title;
  final Icon icon;
  final bool isLoading;

  final Function() onPressed;

  const ButtonSingIn(
      {super.key,
      required this.title,
      required this.icon,
      required this.onPressed,
      required this.isLoading});

  @override
  State<ButtonSingIn> createState() => _ButtonSingInState();
}

class _ButtonSingInState extends State<ButtonSingIn> {
  @override


  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        widget.onPressed();

      },


      child: Container(
          height: 45,
          width: 114,
          decoration: BoxDecoration(
              color: Color(0xFF75CDF3),
              borderRadius: BorderRadius.circular(8.0)),
          child: Center(
              child: widget.isLoading
                  ? Transform.scale( scale: 0.5,child: CircularProgressIndicator(color:Color(0xFFED5EA3 ) , backgroundColor: Colors.white,))
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [widget.title, widget.icon,
                      ],
                    ))),
    );
  }
}
