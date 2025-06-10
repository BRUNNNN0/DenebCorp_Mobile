import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/ui/navigator/custom_bottom_nav.dart';
import 'package:i_pet/ui/navigator/rotas_index.dart';
import 'package:i_pet/ui/pages/buscar_servico/view_models/buscar_servico_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/buscar_servico/view_models/buscar_servico_viewmodel.dart';
import 'package:i_pet/ui/pages/buscar_servico/widgets/buscar_servico_widgets.dart';
import 'package:i_pet/ui/pages/login/view_models/login_factory_viewmodel.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';




class TelaBuscarServico extends StatelessWidget {
  const TelaBuscarServico({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<BuscarServicoViewmodel>(
      create: BuscarServicoFactoryViewModel().create,
      child: const _TelaBuscarServico(),
    );
  }
}

class _TelaBuscarServico extends StatelessWidget {
  const _TelaBuscarServico();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE3F2FD),
      body: buscarWidgets(),
      bottomNavigationBar: CustomBottomNavBar(currentIndex: rotasIndex.indexPesquisar)
    );
  }
}