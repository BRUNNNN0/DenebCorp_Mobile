import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_18.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_senha.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_telefone.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_texto_comum.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_texto_email.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_data.dart';
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

                    CampoEmail(label: "Email"),
                    espaco_14(),

                    caixadetexto(label: "Nome"),
                    espaco_14(),

                    caixadetexto(label: "Sobrenome"),
                    espaco_14(),

                    campoSenha(label: "Senha"),
                    espaco_14(),

                    campoSenha(label: "Confirmar Senha"),
                    espaco_14(),
                    
                    campoData(controller: _dataController),
                    espaco_14(),

                    CampoTelefone(label: "Telefone"),  
                    espaco_18(),

                    Botao(
                      textoBotao: "Cadastrar", 
                      larguraEmporc: 0.96, 
                      corBotao: Colors.blue, 
                      corBorda: Colors.blue, 
                      corDaFonte: Colors.white, 
                      tamanhoDaFonte: 18, 
                      onPressed: (){
                         print('Botão pressionado!');
                      }
                      )
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


