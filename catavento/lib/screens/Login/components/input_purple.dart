import 'package:flutter/material.dart';

class PurpleTextField extends StatefulWidget {
  final String label;
  final Icon icon;
  final TextEditingController controller;
  final bool isSecurepassword;

  const PurpleTextField({
    super.key,
    required this.label,
    required this.icon,
    required this.controller,
    required this.isSecurepassword,
  });

  @override
  _PurpleTextFieldState createState() => _PurpleTextFieldState();
}

class _PurpleTextFieldState extends State<PurpleTextField> {
  late bool _securePasswordState;

  @override
  void initState() {
    super.initState();
    // Inicializa o estado da visibilidade da senha com o valor recebido no construtor.
    _securePasswordState = widget.isSecurepassword;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 324,
      height: 68,
      child: TextField(
        obscureText: _securePasswordState,
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
          suffixIcon: togglePassword(),
          labelStyle: TextStyle(
              color: Color(0xCCACACAC),
              fontSize: 16.0,
              fontWeight: FontWeight.w100),
        ),
      ),
    );
  }

  // Função para alternar a visibilidade da senha
  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _securePasswordState = !_securePasswordState;
        });
      },
      icon: _securePasswordState
          ? Icon(
              Icons.visibility,
              color: Color(0xFFACACAC),
            )
          : Icon(
              Icons.visibility_off,
              color: Color(0xFFACACAC),
            ),
    );
  }
}
