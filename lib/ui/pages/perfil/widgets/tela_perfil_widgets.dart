import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:i_pet/core/widgets/progress_indicator_widget.dart';
import 'package:i_pet/domain/entities/core/request_state_entity.dart';
import 'package:i_pet/domain/entities/user/user_entity.dart';
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

  // Variáveis para armazenar os dados do usuário
  String nome = '';
  String sobrenome = '';
  String email = '';
  String telefone = '';

  @override
  void initState() {
    super.initState();
    _telaPerfilViewModel = context.read<TelaPerfilViewModel>();
    _telaPerfilViewModel.pegarUsuario();
  
  
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TelaPerfilViewModel, IRequestState<UserEntity>>(
      builder: (context, state) {
        final bool isProcessing = state is RequestProcessingState;

        // Se os dados foram recuperados com sucesso, preenche as variáveis
        if (state is RequestCompletedState) {
          final dadosUsuario = state.data;
          
          nome = dadosUsuario.firstName;
          sobrenome = dadosUsuario.lastName;
          email = dadosUsuario.email;
          telefone = dadosUsuario.phoneNumber;
        }

        return SizedBox(
          
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                if (isProcessing)
                  CircularProgressIndicator(), // Indicador de progresso

                // Exibe os TextFields com os dados
                TextField(
                  controller: TextEditingController(text: nome),
                  enabled: false, // Não permite edição
                  decoration: InputDecoration(labelText: 'Nome'),
                ),
                TextField(
                  controller: TextEditingController(text: sobrenome),
                  enabled: false, // Não permite edição
                  decoration: InputDecoration(labelText: 'Sobrenome'),
                ),
                TextField(
                  controller: TextEditingController(text: email),
                  enabled: false, // Não permite edição
                  decoration: InputDecoration(labelText: 'Email'),
                ),
                TextField(
                  controller: TextEditingController(text: telefone),
                  enabled: false, // Não permite edição
                  decoration: InputDecoration(labelText: 'Telefone'),
                ),
                
              ],
            ),
          ),
        );
      },
    );
  }

  void onLoad() {
    _telaPerfilViewModel.pegarUsuario();
  }
}