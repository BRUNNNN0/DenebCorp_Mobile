import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class campoSenha extends StatefulWidget {
  final String label;

  const campoSenha({
    Key? key,
    required this.label,
  }) : super(key: key);

  @override
  _campoSenhaState createState() => _campoSenhaState();
}

class _campoSenhaState extends State<campoSenha> {
  bool _obscureText = true; // Controla se a senha está visível ou oculta

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.96,
      child: TextField(
        obscureText: _obscureText, // Alterna entre mostrar ou ocultar a senha
        decoration: InputDecoration(
          labelText: widget.label,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              _obscureText ? Icons.visibility_off : Icons.visibility,
            ),
            onPressed: () {
              setState(() {
                _obscureText = !_obscureText; // Alterna o estado da senha
              });
            },
          ),
        ),
      ),
    );
  }
}
