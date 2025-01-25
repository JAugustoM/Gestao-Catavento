import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  final String text;
  final String info;

  Info({
    required this.text,
    required this.info,
  });

  @override
  State<Info> createState(){
    return InfoState();
  }
}

class InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontFamily: "FredokaOne",
            fontSize: MediaQuery.of(context).size.height * 0.02,
            color: Colors.white,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(width: MediaQuery.of(context).size.width * 0.002,),
        Text(
          widget.info,
          style: TextStyle(
            fontFamily: "FredokaOne",
            fontSize: MediaQuery.of(context).size.height * 0.02,
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}