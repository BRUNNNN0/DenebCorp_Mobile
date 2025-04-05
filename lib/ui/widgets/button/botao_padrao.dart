


import 'package:flutter/material.dart';

class botao extends StatelessWidget {
final String texto_botao;
final Color cor_botao;
final Color cor_borda;
final Color cor_daFonte;
final double tamanho_daFonte;
final double larguraEmporc;


  const botao({
    Key? key,
    required this.texto_botao,
    required this.larguraEmporc,
    required this.cor_botao,
    required this.cor_borda,
    required this.cor_daFonte,
    required this.tamanho_daFonte,
    }) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return                 
      SizedBox(
        width: MediaQuery.of(context).size.width * larguraEmporc, 
        child: ElevatedButton.icon(
          onPressed: () async {},
            label: Text(
              texto_botao,
                style: TextStyle(fontSize: tamanho_daFonte,color: cor_daFonte),
              ),
        style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: cor_botao,
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(color: cor_borda), 
          ),
        ),
      ),
    );
  }
}
