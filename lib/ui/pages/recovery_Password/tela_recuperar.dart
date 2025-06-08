import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/ui/pages/login/view_models/login_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';
import 'package:i_pet/ui/pages/login/widgets/login_widgets.dart';
import 'package:i_pet/ui/pages/recovery_Password/view_models/tela_recuperar_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/recovery_Password/view_models/tela_recuperar_viewmodel.dart';
import 'package:i_pet/ui/pages/recovery_Password/widgets/tela_recuperar_widgets.dart';
import 'package:i_pet/ui/widgets/backgroud/fundo_degrade_azul_claro.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';

class tela_RecuperarSenha extends StatelessWidget {
  const tela_RecuperarSenha({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<RecuperarSenhaViewModel>(
      create: RecuperarSenhaFactoryViewModel().create,
      child: _tela_RecuperarSenha(),
    );
  }
}

class _tela_RecuperarSenha extends StatelessWidget {
  const _tela_RecuperarSenha();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [         
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
                height: 230, 
                width: MediaQuery.of(context).size.width * 0.9,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20) 
                ), 
              child: Column(
                children: [
                    espaco_14(),
                    RecuperarSenhaFormWidget()
                ]
              )
            )
          )
        ],
      ),
    );
  }
}