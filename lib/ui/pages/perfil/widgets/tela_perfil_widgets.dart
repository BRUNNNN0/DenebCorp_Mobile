import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/progress_indicator_widget.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/ui/pages/login/view_models/login_viewmodel.dart';
import 'package:i_pet/ui/pages/perfil/view_models/tela_perfil_viewmodel.dart';
import 'package:i_pet/ui/widgets/button/botao_padrao_com_imagem.dart';
import 'package:i_pet/utils/util_text.dart';



class TelaPerfilWidget extends StatefulWidget {
  const TelaPerfilWidget({super.key});

  @override
  State<TelaPerfilWidget> createState() => _TelaPerfilWidgetState();
}

class _TelaPerfilWidgetState extends State<TelaPerfilWidget> {
  late final TelaPerfilViewModel _telaPerfilViewModel;
   bool _obscureText = true;

  @override
  void initState() {
    super.initState();
    _telaPerfilViewModel = context.read<TelaPerfilViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TelaPerfilViewModel, IRequestState<String>>(
      builder: (context, state) {
        final bool isProcessing = state is RequestProcessingState;
        return BotaoCMimagem(
                    textoBotao: "testes", 
                    corBotao: const Color.fromARGB(255, 132, 192, 241), 
                    corBorda: const Color.fromARGB(255, 132, 192, 241),
                    corFonte:   const Color.fromARGB(255, 0, 19, 34), 
                    tamanhoFonte: 18, 
                    larguraEmPorcentagem: 0.8, 
                    icone: Icon(Icons.login_outlined, color: const Color.fromARGB(255, 0, 19, 34)), 
                    onPressed: () {
                      onLoad();
                    }
                  );

      },
    );
  }

  void onLoad() {
    _telaPerfilViewModel.pegarUsuario();
  }
}


