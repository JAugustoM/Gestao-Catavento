import 'package:catavento/bloc/auth2/auth_bloc.dart';
import 'package:catavento/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'components/input_purple.dart';
import 'components/button_singIn.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isLoading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                    height: 60,
                  ),

                  BlocBuilder<AuthBloc, AuthState>(
                    builder: (context, state) {
                      SchedulerBinding.instance.addPostFrameCallback((_) {
                        setState(() {
                          isLoading = false;
                        });
                      });

                      if (state is AuthSignInState) {
                        if (state.userData.isNotEmpty) {
                          if (state.userData['tipo'] == 'padrao') {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.popAndPushNamed(
                                  context, atividadesFuncionarioRoute);
                            });
                          } else {
                            SchedulerBinding.instance.addPostFrameCallback((_) {
                              Navigator.popAndPushNamed(context, homeRoute);
                            });
                          }
                        }
                      }
                      return Form(
                          child: Column(
                        children: [
                          PurpleTextField(
                            controller: _emailController,
                            label: "Digite o seu email",
                            icon: Icon(
                              Icons.person_outline,
                              color: Color(0xCCACACAC),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          PurpleTextField(
                            controller: _senhaController,
                            label: "Digite a sua senha",
                            icon: Icon(
                              Icons.lock_outline,
                              color: Color(0xCCACACAC),
                            ),
                          ),
                        ],
                      ));
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 50, 20, 0),
                        child: ButtonSingIn(
                          title: Text(
                            "Entrar",
                            style: TextStyle(color: Colors.white),
                          ),
                          isLoading: isLoading,
                          icon: Icon(
                            Icons.keyboard_arrow_right_rounded,
                            color: Colors.white,
                          ),
                          onPressed: () async {
                            setState(() {
                              isLoading = !isLoading;
                            });
                            context.read<AuthBloc>().add(AuthSignIn(
                                  email: _emailController.text,
                                  password: _senhaController.text,
                                ));
                          },
                        ),
                      )
                    ],
                  )
                  //SizedBox(height: 35),
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
