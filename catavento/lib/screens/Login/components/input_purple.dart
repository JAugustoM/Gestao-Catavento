import 'package:flutter/material.dart';

class PurpleTextField extends StatelessWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;
  final bool isPassword;
  const PurpleTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.isPassword,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      height: 68,
      child: TextField(
        obscureText: isPassword,
        controller: controller,
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderSide: BorderSide(width: 2),
                borderRadius: BorderRadius.circular(4.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0xFFACACAC))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(width: 2, color: Color(0x80FC298F))),
            prefixIcon: icon,
            filled: true,
            fillColor: Color(0xFFDEE1FF),
            labelText: label,
            labelStyle: TextStyle(
                color: Color(0xCCACACAC),
                fontSize: 16.0,
                fontWeight: FontWeight.w100)),
      ),
    );
  }
}
