import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/ui/navigator/custom_bottom_nav.dart';
import 'package:i_pet/ui/pages/perfil/view_models/tela_perfil_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/perfil/view_models/tela_perfil_viewmodel.dart';
import 'package:i_pet/ui/pages/perfil/widgets/tela_perfil_widgets.dart';
import 'package:i_pet/ui/widgets/TextsUser/descricao_user.dart';
import 'package:i_pet/ui/widgets/TextsUser/nome_user.dart';
import 'package:i_pet/ui/widgets/backgroud/fundo_degrade_azul_claro.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao_com_imagem.dart';
import 'package:i_pet/ui/widgets/imgUser/imagem_perfil.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_14.dart';
import 'package:i_pet/ui/widgets/spacing_fields/espacamento_18.dart';



class TelaPerfil extends StatelessWidget {
  const TelaPerfil({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider<TelaPerfilViewModel>(
      create: TelaPerfilFactoryViewmodel().create,
      child: _tela_perfil(),
    );
  }
}

class _tela_perfil extends StatelessWidget {
   
  const _tela_perfil();

  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE3F2FD),
      body: SingleChildScrollView( // permite rolagem se necessário
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 85),
            ImagemPerfil(caminhoImagem: "assets/image/gabriel.jpg"),
            const SizedBox(height: 24), // espaçamento real
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TelaPerfilWidget(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNavBar(currentIndex: 1),
    );
  }
}