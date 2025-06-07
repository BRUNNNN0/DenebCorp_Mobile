

import 'package:flutter/material.dart';

class NomeUsuario extends StatelessWidget {
  final String nome;

  const NomeUsuario({
    super.key,
    required this.nome,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      nome,
      style: const TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Color(0xFF002244),
      ),
    );
  }
}