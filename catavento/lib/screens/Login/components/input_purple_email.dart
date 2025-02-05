import 'package:flutter/material.dart';

class PurpleTextFieldEmail extends StatefulWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;

  const PurpleTextFieldEmail({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
  });

  @override
  _PurpleTextFieldEmailState createState() => _PurpleTextFieldEmailState();
}

class _PurpleTextFieldEmailState extends State<PurpleTextFieldEmail> {
  @override
  void initState() {
    super.initState();
    // Inicializa o estado da visibilidade da senha com o valor recebido no construtor.
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      height: 68,
      child: TextField(
        controller: widget.controller,
        decoration: InputDecoration(
          border: OutlineInputBorder(
              borderSide: BorderSide(width: 2),
              borderRadius: BorderRadius.circular(4.0)),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0xFFACACAC))),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(width: 2, color: Color(0x80FC298F))),
          prefixIcon: widget.icon,
          filled: true,
          fillColor: Color(0xFFDEE1FF),
          labelText: widget.label,
          labelStyle: TextStyle(
              color: Color(0xCCACACAC),
              fontSize: 16.0,
              fontWeight: FontWeight.w100),
        ),
      ),
    );
  }

  // Função para alternar a visibilidade da senha
}
