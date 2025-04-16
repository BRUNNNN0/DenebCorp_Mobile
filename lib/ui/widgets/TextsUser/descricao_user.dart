import 'package:flutter/material.dart';

class DescricaoUsuario extends StatelessWidget {
  final String descricao;

  const DescricaoUsuario({
    super.key,
    required this.descricao,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      descricao,
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontSize: 16,
        color: Colors.black54,
      ),
    );
  }
}