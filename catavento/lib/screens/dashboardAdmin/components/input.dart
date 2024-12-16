import 'package:flutter/material.dart';

class Inputs extends StatefulWidget {
  final String text;
  final String? hint;
  final TextEditingController? controller;
  final Function(String)? onChanged;

  Inputs({
    required this.text,
    this.hint,
    this.controller,
    this.onChanged,
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
              controller: widget.controller,
              onChanged: widget.onChanged,
              decoration: InputDecoration(
                hintStyle: TextStyle(
                  fontSize: 15,
                  color: Colors.grey
                ),
                hintText: widget.hint?? '',
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