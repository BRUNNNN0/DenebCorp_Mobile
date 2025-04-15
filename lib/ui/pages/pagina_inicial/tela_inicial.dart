import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:i_pet/routing/routingHelper.dart';
import 'package:i_pet/ui/widgets/button/botao_do_google_login.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_18.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_25.dart';

class tela_Inicial extends StatefulWidget {
  const tela_Inicial({super.key});

  @override
  State<tela_Inicial> createState() => _tela_InicialState();
}

class _tela_InicialState extends State<tela_Inicial> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - 250,
            child: Image.asset("assets/image/primeiraTela.png", fit: BoxFit.cover),
          ),
          Align(
            alignment: Alignment.bottomCenter,
              child: Container(
                height: 250, 
                width: double.infinity, 
                color: Colors.white,
              child: Column(
                children: [
                  espaco_18(),
                      
                    Botao(
                    textoBotao: "Já tenho uma conta", 
                      larguraEmporc: 0.96, 
                      corBotao: Colors.blue, 
                      corBorda: Colors.blue, 
                      corDaFonte: Colors.white, 
                      tamanhoDaFonte: 18, 
                      onPressed: (){
                         Navigator.of(context).pushNamed(RouteGeneratorHelper.kLogin);
                      }
                    ),
                  espaco_14(),

                    Botao(
                    textoBotao: "Criar nova Conta", 
                    larguraEmporc: 0.96, 
                    corBotao: Colors.white, 
                    corBorda: Colors.blue, 
                    corDaFonte: Colors.blue, 
                    tamanhoDaFonte: 18,
                    onPressed: (){
                         print('Botão pressionado!');
                      }
                    ),
                  espaco_25(),

                  SizedBox(
                    child: Center(
                      child: Text("Acessar com"),
                    ),
                  ),
                  espaco_14(),

                  botaoGoogle(),
                
                ],
              ),
            ),
          ),
        ]
      ),
    );
  }
}        
                  