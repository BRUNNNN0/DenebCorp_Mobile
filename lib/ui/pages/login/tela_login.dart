import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/configs/injection_container.dart';
import 'package:i_pet/ui/pages/login/view_models/login_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';
import 'package:i_pet/ui/pages/login/widgets/login_widgets.dart';
import 'package:i_pet/ui/widgets/backgroud/fundo_degrade_azul_claro.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_18.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_25.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_senha.dart';
import 'package:i_pet/ui/widgets/textfield/caixa_de_texto_email.dart';

class tela_login extends StatelessWidget {
  const tela_login({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginViewModel>(
      create: LoginFactoryViewModel().create,
      child: _tela_login(),
    );
  }
}

class _tela_login extends StatelessWidget {
  const _tela_login();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                    LoginFormWidget()
                ]
              )
            )
          )
        ],
      ),
    );
  }
}