import 'package:flutter/material.dart';
import 'package:i_pet/meusWidgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';


class tela_cadastro extends StatefulWidget {
  const tela_cadastro({super.key});

  @override
  State<tela_cadastro> createState() => _tela_cadastroState();
}

class _tela_cadastroState extends State<tela_cadastro> {
    TextEditingController _dataController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column( 
        children: [
   
          Padding(
            padding: const EdgeInsets.only(top: 50), // Ajusta a posição da logo
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, 
              child: Image.asset("assets/image/logo.png", fit: BoxFit.contain),
            ),
          ),
          

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16), 
                child: Column(
                  children: [
                    caixadetextoemail(label: "Email"),
                    espacamentonormal(),

                    caixadetexto(label: "Nome"),
                    espacamentonormal(),

                    caixadetexto(label: "Sobrenome"),
                    espacamentonormal(),

                    caixadetextosenha(label: "Senha"),
                    espacamentonormal(),

                    caixadetextosenha(label: "Confirmar Senha"),
                    espacamentonormal(),
                    
                    CaixaTextoData(controller: _dataController),
                    espacamentonormal(),

                    caixadetextotelefone(label: "Telefone"),  
                    
                    espacamentoalto(),
                    botao(
                      texto_botao: "Cadastrar", 
                      larguraEmporc: 0.96, 
                      cor_botao: Colors.blue, 
                      cor_borda: Colors.blue, 
                      cor_daFonte: Colors.white, 
                      tamanho_daFonte: 18
                      ),
                    
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


