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

          UserAccountsDrawerHeader(

            accountName: Text("Lucas"),
            currentAccountPicture: CircleAvatar(
              child: ClipOval(
                child: Icon(
                  Icons.person,
                  size: 40,
                ),
              ),
            ),
            accountEmail: Text("data"),
            decoration: BoxDecoration(
              color: Colors.transparent,
            ),
          )
        ],
      ),
    ));
  }
}
