import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/ui/pages/cadastro/cadastro_widgets.dart';
import 'package:i_pet/ui/pages/cadastro/view_model/cadastro_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/cadastro/view_model/cadastro_viewmodel.dart';



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
            padding: const EdgeInsets.only(top: 50), // Ajusta a posição da logo
            child: SizedBox(
              width: MediaQuery.of(context).size.width * 0.9, 
              child: Image.asset("assets/image/logo.png", fit: BoxFit.contain),
            ),
          ),
          
          

          Expanded(
            child: SingleChildScrollView(
              child: Container(
                    child: CadastroWidgets(),)))
                  ],
                ),
              );

  }
}


