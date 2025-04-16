import 'package:flutter/material.dart';

class ImagemPerfil extends StatelessWidget {
  final String caminhoImagem;

  const ImagemPerfil({
    super.key,
    required this.caminhoImagem,
  });

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 60,
      backgroundImage: AssetImage(caminhoImagem),
    );
  }
}