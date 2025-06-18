import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:i_pet/ui/pages/cadastro/cadastro_widgets.dart';
import 'package:i_pet/ui/pages/cadastro/view_model/cadastro_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/cadastro/view_model/cadastro_viewmodel.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_18.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_senha.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_telefone.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_texto_comum.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_texto_email.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_data.dart';
import 'package:intl/intl.dart';


class tela_cadastro extends StatelessWidget {
  const tela_cadastro({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CadastroViewmodel>(
      create: CadastroFactoryViewmodel().create,
      child: _tela_cadastro(),
    );
  }
}

class _tela_cadastro extends StatelessWidget {
  const _tela_cadastro();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column( 
        children: [
   
          Padding(
            padding: const EdgeInsets.only(top: 50), 
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.5, 
              child: Image.asset("assets/image/Miaujuda.png", fit: BoxFit.contain),

              
            ),
          ),
          

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(16), 
                child: Column(
                  children: [
                    Center(child: CadastroWidgets())
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


