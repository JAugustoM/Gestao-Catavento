import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DashBoardFuncionario extends StatelessWidget {
  const DashBoardFuncionario({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: Navbar(),
      appBar: AppBar(
        title: Text("Side Bar"),
        leading: Builder(
          builder: (context) => IconButton(
              onPressed: () => {
                    Scaffold.of(context).openDrawer(),
                  },
              icon: Icon(Icons.tune, color: Colors.black)),
        ),
      ),
      body: Container(
        child: Center(
          child: Text("aqui"),
        ),
      ),
    );
  }
}

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Drawer(
        child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              stops: [0.99, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Color(0xFF3598D4), // Cor #3598D4
                Color(0xFF015C98), //
              ])),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(

            child: Center(

              child: Column(

                children: [
                  SizedBox(height: 20,),
                    Container(
                      height: 60,
                      width: 60,
                      decoration:BoxDecoration(
                        color: Color(0xFFE1DCE6),
                        borderRadius: BorderRadius.circular(100)
                      ) ,
                      child: Center(
                        child:Icon(Icons.person_outline , size: 30, color: Color(00000000).withOpacity(0.45),),
                      ),
                    ),
                  SizedBox(height: 16,),
                  Column(
                    children: [
                      Text("Lucas Almeida" , style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                      )),
                      Text("Produção de Bolos Artificiais" , style: TextStyle(
                        color: Colors.white,
                        fontSize: 12
                      ))
                    ],
                  )


                ],
              ),
            ),
          ),
        ],
      ),
    ));
  }
}
