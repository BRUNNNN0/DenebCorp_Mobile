import 'package:flutter/material.dart';

class Botao extends StatelessWidget {
  final String textoBotao;
  final Color corBotao;
  final Color corBorda;
  final Color corDaFonte;
  final double tamanhoDaFonte;
  final double larguraEmporc;
  final VoidCallback onPressed; 

  const Botao({
    Key? key,
    required this.textoBotao,
    required this.larguraEmporc,
    required this.corBotao,
    required this.corBorda,
    required this.corDaFonte,
    required this.tamanhoDaFonte,
    required this.onPressed, 
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * larguraEmporc,
      child: ElevatedButton.icon(
        onPressed: onPressed, 
        icon: const SizedBox.shrink(), 
        label: Text(
          textoBotao,
          style: TextStyle(fontSize: tamanhoDaFonte, color: corDaFonte),
        ),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 50),
          backgroundColor: corBotao,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
            side: BorderSide(color: corBorda),
          ),
        ),
      ),
    );
  }
}
