import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/ui/navigator/custom_bottom_nav.dart';
import 'package:i_pet/ui/navigator/rotas_index.dart';
import 'package:i_pet/ui/pages/cadastrar_servico/viewmodels/viewmodels/tela_cadastrar_servico_Factory_viewmodel.dart';
import 'package:i_pet/ui/pages/cadastrar_servico/viewmodels/viewmodels/tela_cadastrar_servico_viewmodel.dart';
import 'package:i_pet/ui/pages/cadastrar_servico/widgets/cadastrar_servico_widgets.dart';

class telaCadastroService extends StatelessWidget {
  const telaCadastroService({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CadastroDeServicoViewModel>(
      create: CadastroServicoFactoryViewmodel().create,
      child: _tela_cadastro_service(),
    );
  }
}

class _tela_cadastro_service extends StatelessWidget {
  const _tela_cadastro_service();
  
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
        body: CadastrarServicoScreen(),
        bottomNavigationBar: CustomBottomNavBar(currentIndex: rotasIndex.indexCadastras)
     );

  }


  
}