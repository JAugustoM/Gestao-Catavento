import 'package:flutter/material.dart';

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

                children: [widget.title,
                  SizedBox(width: 5,),
                  widget.icon,
                ],
              ))),
    );
  }
}