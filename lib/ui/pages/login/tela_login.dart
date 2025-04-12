import 'package:flutter/material.dart';
import 'package:i_pet/ui/widgets/backgroud/fundo_degrade_azul_claro.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_18.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_25.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_senha.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_texto_email.dart';

class tela_login extends StatefulWidget {
  const tela_login({super.key});

  @override
  State<tela_login> createState() => _tela_loginState();
}

class _tela_loginState extends State<tela_login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FundoDegradeAzulClaro(),
          
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 60), 
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Image.asset("assets/image/pataLogo.png", fit: BoxFit.contain),
              ),
            ),
          ),
          
          Align(
            alignment: Alignment.center,
              child: Container(
                height: 280, 
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20) 
                ), 
              child: Column(
                children: [
                    espaco_25(),
                    
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: CampoEmail(label: "Email")                    
                    ),

                    espaco_14(),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: campoSenha(label: "Senha")                    
                    ),

                    espaco_18(),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: botao(
                        texto_botao: "Fazer Login", 
                        larguraEmporc: 0.96, 
                        cor_botao: Colors.blue, 
                        cor_borda: Colors.blue, 
                        cor_daFonte: Colors.white, 
                        tamanho_daFonte: 18
                        )
                    ),

                    espaco_18(),

                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Align(
                        alignment: Alignment.center,
                        child: Text("Esqueceu a senha?")
                      ),
                    ),
                ]
              )
            )
          )
        ],
      ),
    );
  }
}