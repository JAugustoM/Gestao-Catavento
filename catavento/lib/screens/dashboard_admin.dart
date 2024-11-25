import 'package:flutter/material.dart';

class DashBoardAdmin extends StatelessWidget {
  const DashBoardAdmin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: ElevatedButton(onPressed: (){
          
        },
          style: ElevatedButton.styleFrom(
            backgroundColor:  Color(0xFF1A73E8),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(22)
            )
          ),
          child: Text("Adicionar demanda" , style: TextStyle(
            color: Colors.white,

          ),),
        ),
      ),
    );
  }
}
