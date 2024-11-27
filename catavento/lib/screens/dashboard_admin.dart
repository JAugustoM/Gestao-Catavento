import 'package:flutter/material.dart';
import 'dart:ui';

class DashBoardAdmin extends StatelessWidget {
  const DashBoardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      //Esse Center pode ser alterado, só coloquei de exemplo.
      body: Center(

        // Esse ElevatedButton é o botão que abre o dialog.
        child: ElevatedButton(
            onPressed: () {
              _showCustomDialog(context);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF1A73E8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22))),
            child: Text(
              "Adicionar demanda",
              style: TextStyle(color: Colors.white, fontSize: 20),
            )),
      ),
    );
  }
}
// Dialog
void _showCustomDialog(BuildContext context){
  showGeneralDialog(
    context: context,
    pageBuilder: (context, animation1, animation2) {
      return Container();
    },
    transitionBuilder: (context, a1, a2, widget) {
      return ScaleTransition(
        scale: Tween<double>(begin: 0.5, end: 1.0).animate(a1),

        child: AlertDialog(
          backgroundColor: Color(0xFFD1EEFF),
          content: SizedBox(
              height: 639,
              width: 560,
              child: Padding(
                padding: const EdgeInsets.only(top: 41),
                child: Container(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Expanded(

                              child: Align(
                                //Aqui ficará o nome da demanda ou qual demanda será
                                alignment: Alignment.center,
                                child: Text("Nome da demanda",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.bold,
                                    )),
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                size: 25,
                              ))
                        ],
                      ),
                      SizedBox(height: 31),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 186,
                            height: 202,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                              BorderRadius.circular(20),
                            ),
                          ),
                          SizedBox(width: 30),
                          Column(
                            children: [
                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                              SizedBox(height: 10),
                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                              SizedBox(height: 10),

                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                              SizedBox(height: 10),

                              RichText(
                                  text: TextSpan(
                                      text: "Código: ",
                                      style: TextStyle(
                                          fontWeight:
                                          FontWeight.bold,
                                          fontSize:15),

                                      children: [
                                        TextSpan(
                                            text: "{Codigo do bolos}")
                                      ])),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )),
          shape: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16.0),
              borderSide: BorderSide.none),
        ),
      );
    },
  );
}
