import 'package:flutter/material.dart';

class BotaoCMimagem extends StatelessWidget {
  final String textoBotao;
  final Color corBotao;
  final Color corBorda;
  final Color corFonte;
  final double tamanhoFonte;
  final double larguraEmPorcentagem;
  final Widget icone;
  final VoidCallback onPressed;

  const BotaoCMimagem({
    super.key,
    required this.textoBotao,
    required this.corBotao,
    required this.corBorda,
    required this.corFonte,
    required this.tamanhoFonte,
    required this.larguraEmPorcentagem,
    required this.icone,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * larguraEmPorcentagem,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: corBotao,
          foregroundColor: corFonte,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(color: corBorda, width: 2),
          ),
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            icone,
            const SizedBox(width: 20),
            Text(
              textoBotao,
              style: TextStyle(
                fontSize: tamanhoFonte,
                color: corFonte,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}