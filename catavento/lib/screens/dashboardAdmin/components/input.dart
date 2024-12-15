import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  final String text;
  final String hint;

  Inputs({
    required this.text,
    required this.hint,
  });

  @override
  State<Inputs> createState() {
    return InputsState();
  }
}

class InputsState extends State<Inputs>{
  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Text(
          widget.text,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black
          ),
        ),

        SizedBox(width: 4,),

        Expanded(
          child: SizedBox(
            height: 33,
            child: TextField(
            decoration: InputDecoration(
              hintStyle: TextStyle(
                fontSize: 15,
                color: Colors.grey
              ),
              hintText: widget.hint,
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10)
              ),
              contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10)
            ),
          ),
          )
          
        ),
      ],
    );
  }
}